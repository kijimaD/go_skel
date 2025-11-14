.DEFAULT_GOAL := help

.PHONY: test
test: ## テストを実行する
	go test -v -cover -shuffle=on ./...

.PHONY: build
build: ## ビルドする
	go build -o ./bin/goskel .

.PHONY: fmt
fmt: ## フォーマットする
	goimports -w .

.PHONY: lint
lint: ## Linterを実行する
	go build -o /dev/null . # buildが通らない状態でlinter実行するとミスリードなエラーが出るので先に試す
	golangci-lint run -v ./...
	go vet ./...

.PHONY: gen
gen: ## Execute go generate
	go generate ./...

.PHONY: toolsinstall
toolsinstall: ## 開発ツールをインストールする
	@go install golang.org/x/tools/cmd/goimports@latest
	@which golangci-lint > /dev/null || (echo "Installing golangci-lint..." && \
		curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b $$(go env GOPATH)/bin v2.2.2)

.PHONY: check
check: fmt build test lint ## 一気にチェックする

.PHONY: help
help: ## Show help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

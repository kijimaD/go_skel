# goskel

Go template repository.

rename command:

```shell
git grep -l 'goskel' | xargs sed -i 's/goskel/your_repo/g'
git grep -l 'kijimad' | xargs sed -i 's/kijimad/your_name/g'
```

## install

```shell
$ go install github.com/kijimad/goskel@main
```

## docker run

```shell
$ docker run -v "$PWD/":/work -w /work --rm -it ghcr.io/kijimad/goskel:latest
```

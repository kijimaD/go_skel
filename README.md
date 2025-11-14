# goskel

Go template repository.

```
git grep -l 'goskel' | xargs sed -i 's/goskel/your_repo/g'
git grep -l 'kijimaD' | xargs sed -i 's/kijimaD/your_name/g'
```

## install

```
$ go install github.com/kijimaD/goskel@main
```

## docker run

```
$ docker run -v "$PWD/":/work -w /work --rm -it ghcr.io/kijimad/goskel:latest
```

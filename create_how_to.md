# How to manually create image

## Linux

### 1. Build

``` ps
docker build -t sheyenrath/ghaction-compress-files .
```

### 2. Delete dangling images

``` ps
docker rmi $(docker images -f "dangling=true" -q)
```

### 3. Tag

``` ps
docker tag sheyenrath/ghaction-compress-files:latest sheyenrath/ghaction-compress-files:2
```

### 4. Push

``` cmd
docker push sheyenrath/ghaction-compress-files:latest
docker push sheyenrath/ghaction-compress-files:2
```
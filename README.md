Docker for hmq

```sh
docker build -t m01i0ng/hmq .
docker run -d --restart always --name hmq -p 1883:1883 -p 1888:1888 m01i0ng/hmq
```

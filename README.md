Sample for alpine with timezone in Golang
---

[alpine](https://hub.docker.com/_/alpine/) is small image, but [golang:x.x.x-alpine](https://hub.docker.com/_/golang/) is too big.  
Golang's single binary and Docker's multi stage build solves problem with image size,  
But another problem with the timezone occurs.

When you call `time.LoadLocation(zone)`, an error occurs.  
e.g.
```
$ make run_alpine
panic: open /usr/local/go/lib/time/zoneinfo.zip: no such file or directory

goroutine 1 [running]:
main.main()
        /go/src/github.com/takecy/tz/main.go:11 +0x22b
make: *** [run_alpine] Error 2
```

You can solve this problem by adding the following to Dockerfile.
```
RUN apk --no-cache add tzdata
```
```
$ make run_alpine_tz
utc:2017-10-24 05:50:30.540154873 +0000 UTC m=+0.000416296
jst:2017-10-24 14:50:30.540154873 +0900 JST
```

Image size is increased about 1.5MB.  
This is acceptable to me.


### Image size
```
takecy/tz-alpine                                                latest              d9000684ec07        6 minutes ago       5.91MB
takecy/tz-alpine-tz                                             latest              2edd086d69e0        10 minutes ago      7.23MB
takecy/tz                                                       latest              95d22869b20b        11 minutes ago      272MB
```
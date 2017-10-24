build:
	docker build -t takecy/tz .

run: build
	docker run takecy/tz

build_alpine_tz:
	docker build -f Dockerfile_alpine_tz -t takecy/tz-alpine-tz .

run_alpine_tz: build_alpine_tz
	docker run takecy/tz-alpine-tz

build_alpine:
	docker build -f Dockerfile_alpine -t takecy/tz-alpine .

run_alpine: build_alpine
	docker run takecy/tz-alpine

clean:
	docker system prune -f
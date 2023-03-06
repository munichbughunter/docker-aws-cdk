AWS_CDK_VERSION = 2.65.0
IMAGE_NAME ?= doe0003p/aws-cdk:$(AWS_CDK_VERSION)
TAG = $(AWS_CDK_VERSION)

build:
	docker buildx build \
		--push \
		--platform linux/arm64,linux/amd64 \
		--tag $(IMAGE_NAME) .

test:
	docker run --rm -it $(IMAGE_NAME) cdk --version

shell:
	docker run --rm -it -v ~/.aws:/root/.aws -v $(shell pwd):/opt/app $(IMAGE_NAME) bash


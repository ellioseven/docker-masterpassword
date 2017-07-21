FROM alpine

ENV BUILD_PACKAGES \
	build-base \
	ca-certificates \
	ncurses-dev \
	openssl \
	tar \
	wget

RUN apk --no-cache add $BUILD_PACKAGES bash openssl-dev \
	&& mkdir mpa \
	&& cd mpa \
	&& wget https://ssl.masterpasswordapp.com/masterpassword-cli.tar.gz \
	&& tar -xzf masterpassword-cli.tar.gz \
	&& ./build \
	&& mv mpw /usr/bin/mpw \
	&& apk del $BUILD_PACKAGES

FROM alpine

ENV VERSION 2.5-cli-2 

ENV BUILD_PACKAGES \
	build-base \
	ca-certificates \
	json-c-dev \
	libsodium-dev \
	ncurses-dev \
	openssl \
	tar \
	wget

RUN apk --no-cache add $BUILD_PACKAGES bash openssl-dev \
	&& mkdir mpa \
	&& cd mpa \
	&& wget -O masterpassword-cli.tar.gz https://github.com/Lyndir/MasterPassword/archive/$VERSION.tar.gz \
	&& tar -xzf masterpassword-cli.tar.gz \
	&& rm masterpassword-cli.tar.gz \
	&& cd MasterPassword-*/platform-independent/cli-c \
	&& ./build \
	&& mv mpw /usr/bin/mpw \
	&& rm -rf ../../../MasterPassword* \
	&& apk del $BUILD_PACKAGES


FROM marxin/gcc-docker
MAINTAINER Martin Liška

WORKDIR /abuild

RUN ld --version && which ld

RUN env GIT_SSL_NO_VERIFY=true git clone -b lto-stable --single-branch https://github.com/marxin/gecko-dev.git

WORKDIR /abuild/gecko-dev

RUN sed -i -s  's/j9/j4/g;s/lto=9/lto=4/g' .mozconfig
RUN rm -rf linux && rm -rf inkscape && rm .git -rf && make -f client.mk build

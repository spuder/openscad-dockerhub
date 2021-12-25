FROM debian:latest
ARG TARGETPLATFORM
RUN echo "I'm building for $TARGETPLATFORM"
ARG OPENSCAD_VERSION=2021.01
RUN apt update && apt install -y -qq wget xvfb libfontconfig libharfbuzz-dev libgl1
RUN export ARCH=$(case ${TARGETPLATFORM:-linux/amd64} in \
    "linux/amd64")   echo "x86_64"  ;; \
    "linux/arm/v7")  echo "armhf"   ;; \
    "linux/arm64")   echo "aarch64" ;; \
    *)               echo ""        ;; esac) \
    && echo "ARCH=$ARCH"
RUN wget https://files.openscad.org/OpenSCAD-${OPENSCAD_VERSION}-${ARCH}.AppImage
RUN mv OpenSCAD-${OPENSCAD_VERSION}-${ARCH}.AppImage /OpenSCAD.AppImage
RUN chmod a+x OpenSCAD.AppImage
ADD openscad /usr/local/bin/openscad
RUN chmod a+x /usr/local/bin/openscad

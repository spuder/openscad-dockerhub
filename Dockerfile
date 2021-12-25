FROM debian:latest
ARG TARGETPLATFORM
RUN echo "I'm building for $TARGETPLATFORM"
ARG OPENSCAD_VERSION=2021.01
ARG ARCH=x86_64 # aarch64
RUN apt update && apt install -y -qq wget xvfb libfontconfig libharfbuzz-dev libgl1
RUN wget https://files.openscad.org/OpenSCAD-${OPENSCAD_VERSION}-${ARCH}.AppImage
RUN mv OpenSCAD-${OPENSCAD_VERSION}-${ARCH}.AppImage /OpenSCAD.AppImage
RUN chmod a+x OpenSCAD.AppImage
ADD openscad /usr/local/bin/openscad
RUN chmod a+x /usr/local/bin/openscad

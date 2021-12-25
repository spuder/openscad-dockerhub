FROM debian:latest
RUN apt update && apt install -y -qq wget xvfb libfontconfig libharfbuzz-dev libgl1
RUN wget https://files.openscad.org/OpenSCAD-2021.01-x86_64.AppImage
RUN chmod a+x OpenSCAD-2021.01-x86_64.AppImage
ADD openscad /usr/local/bin/openscad
RUN chmod a+x /usr/local/bin/openscad

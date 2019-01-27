FROM resin/raspberrypi3-debian:stretch
#balena script that kicks off QEMU emulation
RUN ["cross-build-start"]
RUN apt-get update && apt-get -y install --no-install-recommends  python-rpi.gpio python3-rpi.gpio \
python-smbus python3-smbus python-dev python3-dev python-serial python3-serial \
python-imaging fonts-freefont-ttf wget \
build-essential
COPY . /eink
WORKDIR /eink
RUN wget https://pypi.python.org/packages/36/83/73748b6e1819b57d8e1df8090200195cdae33aaa22a49a91ded16785eedd/spidev-3.2.tar.gz
RUN tar xzvf spidev-3.2.tar.gz
WORKDIR spidev-3.2
RUN python setup.py install
WORKDIR ..
CMD ["/bin/bash"]
RUN ["cross-build-end"]
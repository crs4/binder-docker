FROM crs4/cmake:3.14

RUN apt-get -y update && apt-get -y install --no-install-recommends \
      curl \
      gcc-8 \
      g++-8 \
      git \
      ninja-build \
      python3-dev \
      python3-pip \
 && update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 70 --slave /usr/bin/g++ g++ /usr/bin/g++-7 \
 && update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-8 80 --slave /usr/bin/g++ g++ /usr/bin/g++-8

RUN python3 -m pip install --upgrade --no-cache-dir setuptools pip

COPY binder /binder

WORKDIR /binder

RUN python3 build.py -j$(grep -c ^processor /proc/cpuinfo)

# Install Horovod
ARG HOROVOD_WITHOUT_PYTORCH=1
ARG HOROVOD_WITHOUT_MXNET=1
ARG HOROVOD_WITH_TENSORFLOW=1
ARG HOROVOD_VERSION=

RUN apt-get update && apt-get install -y --no-install-recommends --fix-missing \
    build-essential \
    g++-8 \
    gcc-8 \
    python3-dev

RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 700 --slave /usr/bin/g++ g++ /usr/bin/g++-7 && \
    update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-8 800 --slave /usr/bin/g++ g++ /usr/bin/g++-8

RUN python3 -m pip install --no-cache-dir horovod${HOROVOD_VERSION:+==${HOROVOD_VERSION}}

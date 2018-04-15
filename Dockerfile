# =======================================================
#   Binary Build Layer
# =======================================================
FROM jbrinkmann/lagoon-puffer-fish:devel-1.15.0.0 as builder
LABEL maintainer="USGS EROS LSRD http://eros.usgs.gov" \
      description="Application executables for L2 QA tools"

WORKDIR ${SRC_DIR}
COPY . ${SRC_DIR}

# `  Build and install the qa tools applications
RUN cd ${SRC_DIR}/raw_binary \
    && make BUILD_STATIC=yes ENABLE_THREADING=yes \
    && make install \
    && cd ${SRC_DIR} \
    && rm -rf *

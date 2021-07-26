FROM docker/for-desktop-kernel:5.10.25-6594e668feec68f102a58011bb42bd5dc07a7a9b AS ksrc

FROM ubuntu:20.04

WORKDIR /
COPY --from=ksrc /kernel-dev.tar /
RUN tar xf kernel-dev.tar && rm kernel-dev.tar

RUN yes | unminimize

RUN apt update && apt upgrade -y

RUN apt install -y sysstat procps util-linux iproute2 numactl bpfcc-tools \
                   trace-cmd nicstat ethtool tiptop msr-tools bpftrace strace \
                   kmod

RUN apt install -y linux-tools-common linux-tools-generic perf-tools-unstable

RUN ln -s /usr/lib/linux-tools/*/perf /usr/local/bin/perf

RUN apt install -y man-db manpages-dev

RUN apt install -y vim less

WORKDIR /root
CMD mount -t debugfs debugfs /sys/kernel/debug && /bin/bash

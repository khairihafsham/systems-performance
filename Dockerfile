FROM ubuntu:20.04

RUN yes | unminimize

RUN apt update && apt upgrade -y

RUN apt install -y sysstat procps util-linux iproute2 numactl bpfcc-tools \
                   trace-cmd nicstat ethtool tiptop msr-tools bpftrace strace

RUN apt install -y linux-tools-common linux-tools-generic perf-tools-unstable

RUN ln -s /usr/lib/linux-tools/*/perf /usr/local/bin/perf

RUN apt install -y man-db manpages-dev

RUN apt install -y vim less

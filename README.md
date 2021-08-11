# What is this?

A setup for practising the tools mentioned in the book Systems Performance. Specifically for MacOS at the moment, due
the special configuration needed for Docker in Mac to enable tracing the kernel.

Most of the tools mentioned in the book is available, although might be in a different name due to packaging. Some,
requires extra step to enable.

## Requirement

1. Docker
2. Docker Compose

## How?

```
> docker-compose run --rm bash
> bpftrace -l tracepoint* | head
```

You should see something like:

```
tracepoint:vsock:virtio_transport_alloc_pkt
tracepoint:vsock:virtio_transport_recv_pkt
tracepoint:9p:9p_client_req
tracepoint:9p:9p_client_res
tracepoint:9p:9p_protocol_dump
tracepoint:fib6:fib6_table_lookup
tracepoint:bpf_test_run:bpf_test_finish
tracepoint:devlink:devlink_hwmsg
tracepoint:devlink:devlink_hwerr
tracepoint:devlink:devlink_health_report
```

## sar

Requires cron to call a command for collecting data. To enable, do below:

```
> service sysstat start
> service cron start
```

example cron config, collect metric every 1 minute

```
*/1 * * * * root command -v debian-sa1 > /dev/null && debian-sa1 1 1 -S ALL
```

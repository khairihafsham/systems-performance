# What is this?

A setup for practising the tools mentioned in the book Systems Performance. Specifically for MacOS at the moment, due
the special configuration needed for Docker in Mac to enable tracing the kernel.

Most of the tools mentioned in the book is available, although might be in a different name due to packaging. Some,
requires extra step to enable.

## sar

Requires cron to call a command for collecting data. To enable, do below:

```
> service sysstat start
> service cron start
```

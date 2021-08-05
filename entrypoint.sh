#!/bin/bash
set -e

echo 0 > /proc/sys/kernel/kptr_restrict

exec "$@"

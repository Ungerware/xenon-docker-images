#!/bin/sh

exec /sbin/setuser munge /usr/sbin/munged --foreground > /var/log/munged.out.log 2> /var/log/munged.err.log

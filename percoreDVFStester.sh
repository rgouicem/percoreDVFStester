#!/usr/bin/env bash

function watcher() {
    while sleep 0.5 ; do
	cat /sys/devices/system/cpu/cpufreq/policy*/scaling_cur_freq
	echo
	echo
    done
}

function looper() {
    while : ; do : ; done
}

function cleanup() {
    kill -9 $wpid $lpid
}

trap cleanup EXIT

echo "Start watcher"
watcher &
wpid=$!


sleep 2

echo "*********** START LOOPER **********"

looper &
lpid=$!

sleep 2

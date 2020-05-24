#!/usr/bin/env bash

function watcher() {
    N=$(nproc)
    while sleep 0.5 ; do
	for ((i=0;i<N;i++)) ; do
	    echo cpu$i: $(cat /sys/devices/system/cpu/cpufreq/policy$i/scaling_cur_freq) MHz
	    done
	echo
	echo
    done
}

function looper() {
    while : ; do : ; done
}

function cleanup() {
    kill -9 $wpid $lpid &> /dev/null
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

#!/bin/bash
#
# Verify that check can detect inline and regular extents inside the same inode
#
# This problem takes us quite much effort in the past, and subpage data write
# can cause such problem more easily.
#
# Make sure btrfs check can at least detect such error

source "$TEST_TOP/common"

check_prereq btrfs

check_image() {
	run_mustfail "mixed extent types not detected" \
		"$TOP/btrfs" check "$1"
}

check_all_images

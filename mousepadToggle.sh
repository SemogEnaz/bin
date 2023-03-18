#!/bin/bash

mousepad="Elan Touchpad"

device_enable_str=$(xinput list-props "$mousepad" | grep Device\ Enabled)

is_enabled=${device_enable_str: -1}

[[ $is_enabled = 1 ]] && xinput disable "$mousepad" || xinput enable "$mousepad"

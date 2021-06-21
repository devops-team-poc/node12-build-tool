#!/bin/sh


set -e


sh -c "npx detox test -c android.emu.release.ci --headless"

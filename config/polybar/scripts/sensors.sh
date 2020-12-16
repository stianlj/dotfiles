#!/usr/bin/env bash
set -euo pipefail

grep_sensor() {
    sensors | grep "${1}" | awk '{print substr($3, 2, length($3)-5)}' | tr "\\n" " " | sed 's/ /°C  /g' | sed 's/  $//'
}

PARAMETER=$1
case $PARAMETER in
    cpu)
        grep_sensor 'CPU Temperature'
        ;;
    motherboard)
        grep_sensor 'Motherboard Temperature'
        ;;
    amd_gpu_junction)
        grep_sensor 'junction'
        ;;
    *)
        echo "Default"
        ;;
esac


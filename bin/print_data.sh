#!/bin/bash
set -euo pipefail

function logging() {
    echo "[INFO] Start Script."
    echo "[INFO] Running..."

    sleep $((RANDOM % 10))
}

function print() {
    local name="$1"
    local age="$2"
    local sex="$3"
    local height="$4"
    local weight="$5"

    {
        echo "================================="
        echo "NAME  : ${name}"
        echo "AGE   : ${age}"
        echo "SEX   : ${sex}"
        echo "HEIGHT: ${height}"
        echo "WEIGHT: ${weight}"
        echo "================================="
    }

}

function main() {
    local profile="$1"

    logging

    case "${profile}" in
    "alice") print "alice" "21" "woman" "160" "50" ;;
    "bob") print "bob" "32" "man" "187" "80" ;;
    "chris") print "chris" "25" "man" "172" "65" ;;
    *)
        echo "[ERROR]: profile is an incorrect value." >&2
        exit 1
        ;;

    esac
}

main "$@"

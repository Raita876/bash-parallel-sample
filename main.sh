#!/bin/bash
set -euo pipefail

readonly THIS_SCRIPT_DIR=$(
    cd "$(dirname "$0")"
    pwd
)

readonly PROFILES=(
    "alice"
    "bob"
    "chris"
    "xxxxxx" #invalid value
)

readonly PRINT_DATA_SH="${THIS_SCRIPT_DIR}/bin/print_data.sh"

function header() {
    local text="$1"

    {
        echo "#####################################"
        echo "# ${text}"
        echo "#####################################"
    }
}

function main() {
    local pids=()
    local tmp_dir
    tmp_dir=$(mktemp -d "${THIS_SCRIPT_DIR}/XXXXXX")

    for p in "${PROFILES[@]}"; do
        local tmp_log="${tmp_dir}/${p}.log"

        local print_data_cmd
        local print_data_pid

        print_data_cmd="print_data.sh ${p}"
        ${PRINT_DATA_SH} "${p}" &>"${tmp_log}" &
        print_data_pid="$!"
        pids+=("${print_data_pid}")

        echo "${print_data_cmd} (PID=${print_data_pid})"
    done

    local status_code="0"
    for pid in "${pids[@]}"; do
        echo "Wait PID=${pid}"
        if wait "${pid}"; then
            status_code="1"
        fi
    done

    for log in $(find "${tmp_dir}" -type f -name "*.log"); do
        header "Print $(basename "${log}")"
        cat "${log}"
        echo ""
    done

    rm -rf "${tmp_dir}"

    exit "${status_code}"
}

main "$@"

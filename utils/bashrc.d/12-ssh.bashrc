#!/usr/bin/env bash

set -eEuo pipefail

if ! [[ -d ~/.ssh/sockets ]]  && [[ -d ~/.ssh_sockets_readonly ]]; then
	rsync -r ~/.ssh_sockets_readonly/ ~/.ssh/sockets
fi

set +eEuo pipefail

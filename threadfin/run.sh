#!/usr/bin/env sh
set -e

OPTIONS_FILE="/data/options.json"

# Lê o nível de debug a partir das opções do add-on (default 0).
DEBUG=0
if [ -f "${OPTIONS_FILE}" ]; then
  DEBUG="$(jq -r '.debug // 0' "${OPTIONS_FILE}")"
fi

# Garante que as pastas persistentes existem antes de arrancar.
mkdir -p "${THREADFIN_CONF}" "${THREADFIN_TEMP}" "${THREADFIN_CACHE}"

echo "[Threadfin] A arrancar na porta ${THREADFIN_PORT} (config: ${THREADFIN_CONF}, debug: ${DEBUG})"

exec "${THREADFIN_BIN}/threadfin" \
  -port="${THREADFIN_PORT}" \
  -bind="${THREADFIN_BIND_IP_ADDRESS}" \
  -config="${THREADFIN_CONF}" \
  -debug="${DEBUG}"

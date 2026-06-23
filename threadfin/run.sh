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

# Limpa o bindIp do settings.json — esse campo não pode ser um IP do host
# (ex: 192.168.1.x) dentro de um container Docker sem host_network, o que
# impede o Threadfin de arrancar. O bind é sempre 0.0.0.0 (todas as
# interfaces do container); o IP exposto é controlado pelo port mapping do HA.
SETTINGS_FILE="${THREADFIN_CONF}/settings.json"
if [ -f "${SETTINGS_FILE}" ]; then
  jq '.bindIp = ""' "${SETTINGS_FILE}" > "${SETTINGS_FILE}.tmp" \
    && mv "${SETTINGS_FILE}.tmp" "${SETTINGS_FILE}" \
    || rm -f "${SETTINGS_FILE}.tmp"
fi

echo "[Threadfin] A arrancar na porta ${THREADFIN_PORT} (config: ${THREADFIN_CONF}, debug: ${DEBUG})"

exec "${THREADFIN_BIN}/threadfin" \
  -port="${THREADFIN_PORT}" \
  -bind="${THREADFIN_BIND_IP_ADDRESS}" \
  -config="${THREADFIN_CONF}" \
  -debug="${DEBUG}"

ARG BUILD_FROM=fyb3roptik/threadfin:1.2.37
# hadolint ignore=DL3006
FROM ${BUILD_FROM}

# jq é usado pelo run.sh para ler as opções do add-on (/data/options.json).
# hadolint ignore=DL3008
RUN apt-get update \
    && apt-get install -y --no-install-recommends jq \
    && rm -rf /var/lib/apt/lists/*

# Guarda a configuração do Threadfin na pasta persistente do add-on (/data),
# para sobreviver a reinícios e atualizações do add-on.
ENV THREADFIN_CONF=/data/conf \
    THREADFIN_TEMP=/data/temp \
    THREADFIN_CACHE=/data/cache \
    THREADFIN_PORT=34400 \
    THREADFIN_BIND_IP_ADDRESS=0.0.0.0

COPY run.sh /run.sh
RUN chmod a+x /run.sh

USER root
ENTRYPOINT []
CMD [ "/run.sh" ]

# Threadfin

## Como usar

1. Instala e arranca o add-on.
2. Abre **Open Web UI**.
3. No assistente do Threadfin:
   - Adiciona o teu URL/ficheiro **M3U** (lista de canais).
   - Adiciona o teu **EPG XMLTV** (guia de programação), se tiveres.
   - Mapeia/filtra os canais que queres expor.
4. No Plex/Emby/Jellyfin, adiciona um sintonizador de TV em direto a apontar
   para o Threadfin:
   - **M3U:** `http://<ip>:34400/m3u/threadfin.m3u`
   - **XMLTV:** `http://<ip>:34400/xmltv/threadfin.xml`

## Opções do add-on

| Opção | Tipo | Default | Função |
| ----- | ---- | ------- | ------ |
| `debug` | `int(0,3)` | `0` | Nível de debug dos logs do Threadfin (0 = off, 3 = verboso) |

A porta publicada define-se no separador **Network** do add-on (não é uma
opção), porque o mapeamento host→container é gerido nativamente pelo
Home Assistant. A porta interna é sempre `34400`.

## Persistência

A configuração fica em `/data/conf` (persistente do add-on). Para reinício de
raiz, podes apagar essa pasta via SSH/Samba add-on.

## Variáveis internas

Definidas no [Dockerfile](Dockerfile) e passadas ao binário:

| Variável | Valor | Função |
| -------- | ----- | ------ |
| `THREADFIN_CONF` | `/data/conf` | Pasta de configuração |
| `THREADFIN_TEMP` | `/data/temp` | Ficheiros temporários |
| `THREADFIN_CACHE` | `/data/cache` | Cache |
| `THREADFIN_PORT` | `34400` | Porta interna da interface web |

## Instalação rápida com imagem pré-construída (opcional)

Por omissão o add-on é **construído localmente** no teu HA (funciona em qualquer
caso, sem configuração extra). Se preferires que o HA **descarregue** a imagem já
pronta (instalação mais rápida), o CI publica-a no GHCR:

1. Torna o pacote público uma vez:
   `https://github.com/users/MarceloRRMartins/packages/container/hassio-threadfin/settings`
   → **Change visibility** → **Public**.
2. Adiciona ao [config.yaml](config.yaml):
   ```yaml
   image: "ghcr.io/marcelorrmartins/hassio-threadfin"
   ```
3. Reinstala/atualiza o add-on.

> Para este add-on (casca fina sobre a imagem oficial) o ganho é pequeno, por
> isso o modo local vem ativo por omissão.

## Resolução de problemas

- **Não abre a UI:** confirma que o add-on está *running* nos logs e que a porta
  publicada (separador Network) não está em uso por outro serviço.
- **Plex não encontra o sintonizador:** usa o URL direto do M3U/XMLTV em vez de
  depender de descoberta automática.
- **Mais detalhe nos logs:** sobe a opção `debug` para `2` ou `3`.

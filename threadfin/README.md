# Threadfin – Home Assistant Add-on

[Threadfin](https://github.com/Threadfin/Threadfin) é um proxy M3U e gestor de
EPG (baseado no xTeVe) que serve listas IPTV ao **Plex DVR**, **Emby** e
**Jellyfin** como se fosse um sintonizador de TV em direto.

## Instalação

1. Adiciona este repositório à tua **Add-on Store** (ver o
   [README principal](../README.md)).
2. Instala o add-on **Threadfin**.
3. Arranca o add-on e abre a interface em **Open Web UI** (ou
   `http://<ip-do-home-assistant>:34400/web/`).

## Opções

```yaml
debug: 0
```

- **`debug`** (`0`–`3`): nível de detalhe dos logs do Threadfin. `0` desliga,
  `3` é o mais verboso. Útil para diagnóstico.

Toda a restante configuração (listas M3U, EPG XMLTV, filtros, mapeamento, etc.)
é feita dentro da própria interface web do Threadfin e guardada de forma
persistente em `/data/conf`, por isso sobrevive a reinícios e atualizações.

## Porta

A porta publicada controla-se no separador **Network** da página do add-on
(mapeamento host → `34400`). A porta interna é fixa em `34400`.

## Notas

- **Versão fixada:** imagem base [`fyb3roptik/threadfin:1.2.37`](https://hub.docker.com/r/fyb3roptik/threadfin)
  (amd64 / aarch64 / armv7) — builds reprodutíveis.
- **Descoberta automática (Plex/HDHomeRun):** o acesso por URL direto funciona
  com o mapeamento de porta normal. Se precisares de descoberta por broadcast
  na rede local, considera ativar `host_network` no `config.yaml`.

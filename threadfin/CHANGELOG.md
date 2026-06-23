# Changelog

A versão do add-on espelha a versão do Threadfin (gerida automaticamente pelo Renovate).

## 1.2.40

- `run.sh` limpa automaticamente o campo `bindIp` do `settings.json` ao
  arrancar — evita o crash "cannot assign requested address" quando um IP
  do host (ex: 192.168.1.x) é gravado nas definições do Threadfin mas não
  existe dentro do container Docker.

## 1.2.39

- Remove `host_network: true`: a combinação com `ports: 34400/tcp: 34400` causava
  um conflito que impedia o Threadfin de ligar à porta 34400 (crash loop ao arrancar).
  O port mapping padrão é suficiente — SSDP/descoberta do Jellyfin funciona na LAN
  sem host_network.

## 1.2.38

- Corrige o URL da interface web: voltou a `http://` (o Threadfin serve em HTTP simples,
  por isso o `[PROTO:ssl]` apontava para `https://` e impedia o acesso, incl. via Tailscale).
- Mantém `host_network: true` para a descoberta na rede (DLNA/SSDP) por Jellyfin/Plex/Emby.
- Adiciona perfil AppArmor, subindo a classificação de segurança do Supervisor de 4 para 5.
- Nota: a versão do add-on (1.2.38) não corresponde à versão upstream do Threadfin (1.2.37)
  — a imagem usada é a mesma (`fyb3roptik/threadfin:1.2.37`); o bump serve para o
  Supervisor reconhecer esta versão como mais recente que a 1.2.37 instalada.

## 1.2.37

- Versão inicial do add-on Threadfin para Home Assistant.
- Baseado na imagem oficial `fyb3roptik/threadfin:1.2.37` (amd64 / aarch64 / armv7).
- Configuração persistente em `/data/conf`.
- Interface web exposta na porta `34400` com botão "Open Web UI".
- Opção `debug` (0–3) para o nível de logs.
- Ícone e logo do add-on.

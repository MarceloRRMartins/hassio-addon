# Changelog

A versão do add-on espelha a versão do Threadfin (gerida automaticamente pelo Renovate).

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

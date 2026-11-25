# Cardeal Ltda. — Infraestrutura de Redes

Projeto acadêmico desenvolvido para a disciplina de **Redes de Computadores**.

O objetivo é projetar e implementar uma infraestrutura de rede para a empresa fictícia Cardeal Ltda., disponibilizando serviços internos de comunicação, compartilhamento de arquivos, hospedagem web e acesso à Internet.

## Objetivos do projeto

- Implementar uma rede local (LAN).
- Configurar distribuição automática de endereços IP (DHCP).
- Implementar resolução de nomes (DNS).
- Hospedar uma página institucional (HTTP).
- Configurar serviço de e-mail (SMTP e IMAP/POP3).
- Disponibilizar compartilhamento de arquivos (Samba/SMB).
- Implementar gateway de acesso à Internet.
- Analisar o tráfego de rede utilizando Wireshark.

## Arquitetura da infraestrutura

A infraestrutura foi implementada utilizando três máquinas virtuais Ubuntu no VirtualBox, com distribuição dos serviços entre elas.

| Máquina virtual | Endereço IP | Serviços |
|---|---|---|
| VM1 — Gateway | 192.168.10.1 | Gateway, DHCP, NAT e encaminhamento de pacotes |
| VM2 — Web/DNS | 192.168.10.2 | Apache2 e BIND9 |
| VM3 — Mail/Files | 192.168.10.3 | Postfix, Dovecot e Samba |

### Configuração da rede

| Parâmetro | Configuração |
|---|---|
| Rede interna | 192.168.10.0/24 |
| Gateway | 192.168.10.1 |
| Servidor DNS | 192.168.10.2 |
| Faixa DHCP | 192.168.10.50–192.168.10.200 |
| Domínio interno | cardeal.local |

## Tecnologias utilizadas

- **VirtualBox:** virtualização das máquinas.
- **Ubuntu Server:** sistema operacional dos servidores.
- **ISC DHCP Server:** distribuição dinâmica de endereços IP.
- **BIND9:** resolução de nomes DNS.
- **Apache2:** hospedagem da página web.
- **Postfix:** envio de mensagens por SMTP.
- **Dovecot:** acesso às mensagens por IMAP/POP3.
- **Samba:** compartilhamento de arquivos na rede.
- **nftables:** regras de firewall e NAT.
- **Wireshark:** captura e análise de pacotes.

## Organização do repositório

| Diretório | Conteúdo |
|---|---|
| `topologia/` | Representação da infraestrutura de rede |
| `gateway/` | Configurações do gateway e encaminhamento |
| `dhcp/` | Arquivos de configuração do DHCP |
| `dns/` | Configurações do servidor DNS |
| `web/` | Arquivos e configurações do servidor web |
| `email/` | Configurações dos serviços de e-mail |
| `samba/` | Configurações do compartilhamento de arquivos |
| `wireshark/` | Capturas e análises do tráfego de rede |
| `scriptsMaquinas/` | Scripts auxiliares de configuração |
| `relatorio/` | Documentação,imagens e relatório do projeto |

## Testes e validação

Foram realizados testes para verificar o funcionamento dos serviços implementados:

- **DHCP:** obtenção automática de endereço IP por uma máquina cliente.
- **DNS:** resolução dos nomes internos da empresa.
- **HTTP:** acesso à página institucional hospedada na rede.
- **SMTP:** envio de mensagens entre máquinas da rede.
- **IMAP:** autenticação e verificação da caixa de entrada.
- **Samba:** acesso ao compartilhamento de arquivos.
- **Gateway:** comunicação com a Internet através da VM1.

O Wireshark foi utilizado para capturar e analisar pacotes relacionados aos protocolos de rede, permitindo observar as comunicações entre cliente e servidor.

## Evidências e documentação

As capturas de tela, arquivos de configuração, diagramas e registros dos testes estão organizados nos respectivos diretórios deste repositório.

## Contexto acadêmico

Projeto desenvolvido como atividade prática da disciplina de Redes de Computadores 

**Projeto:** Infraestrutura de Rede — Cardeal Ltda.  
**Instituição:** Universidade Federal de Pelotas (UFPel)  
**Ano:** 2026

#!/usr/bin/env bash
# VM1 Cardeal: enp0s3 = NAT/DHCP; enp0s8 = 192.168.10.1/24
set -euo pipefail
NETPLAN=/etc/netplan/00-installer-config.yaml
[[ $EUID -eq 0 ]] || { echo "Use: sudo bash vm1-configuracao-rede.bash"; exit 1; }
ip link show enp0s3 >/dev/null && ip link show enp0s8 >/dev/null || { echo "Interfaces não encontradas; nada alterado."; exit 1; }
echo "Será configurado enp0s3 via DHCP e enp0s8 em 192.168.10.1/24."
read -r -p "Continuar? (s/N): " r
[[ "$r" =~ ^[sS]$ ]] || exit 0
[[ -f "$NETPLAN" ]] && cp -a "$NETPLAN" "${NETPLAN}.backup-cardeal-$(date +%Y%m%d-%H%M%S)"
cat > "$NETPLAN" <<'EOF'
network:
  version: 2
  ethernets:
    enp0s3:
      dhcp4: true
    enp0s8:
      dhcp4: false
      addresses:
        - 192.168.10.1/24
EOF
chmod 600 "$NETPLAN"
netplan generate
netplan apply
ip -br addr
echo "Gateway, DHCP, encaminhamento e nftables são configurados separadamente."

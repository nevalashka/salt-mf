# init.sls
include:
  - 7_iptables_ufw.backup
  - 7_iptables_ufw.config

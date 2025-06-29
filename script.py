import os
import re

# Список названий политик
raw_policies = [
    "/etc/pam.d/common-session (debian)",
    "/etc/pam.d/system-auth (rhel)",
    "ssh/sshd_config",
    "ssh issue/motd",
    "remove_unused_network_services",
    "iptables_ufw_base",
    "selinux_config",
    "apparmor_profiles",
    "disable_core_dump",
    "disable_usb_storage",
    "disable_removable_mounts",
    "ntp_time_protection",
    "disable_ipv6",
    "browser_password_store_block",
    "restrict_service_control",
    "no_exec_rights",
    "forbid_specific_commands",
    "restrict_bash_users",
    "allow_only_specific_apps",
    "restrict_service_users_access",
    "env_and_environment_control",
    "local_users_management",
    "mount_network_shares",
    "ldap_sudo_group",
    "nsswitch_and_sudoers",
    "restrict_su_command",
    "gui_idle_screen_lock",
    "set_umask_default",
    "auditd_config",
    "logrotate_setup",
    "protect_log_deletion",
    "rsyslog_forwarding",
    "cron_usage_audit",
    "aide_user_config_check",
    "corporate_repos",
    "unattended_upgrades",
    "software_distribution",
    "pkg_management_enforcement",
    "pkg_source_restriction",
    "dns_client_config",
    "restrict_network_changes",
    "file_distribution",
    "sensitive_file_permissions",
    "disk_quotas",
    "tmp_cleaning",
    "filetype_app_association",
    "ctrl_alt_del_lockdown",
    "modprobe_blacklist",
    "cron_jobs_control",
    "systemd_coredump_config",
    "tcp_wrappers_hosts_access",
    "fstab_mount_policy",
    "pam_time_login_limits"
]

def slugify(name):
    name = name.lower()
    name = name.strip()
    name = re.sub(r'[^\w\-]+', '_', name)
    name = re.sub(r'_+', '_', name)
    return name.strip('_')

base_dir = 'salt-policies'

for policy in raw_policies:
    folder_name = slugify(policy)
    policy_path = os.path.join(base_dir, folder_name)
    files_path = os.path.join(policy_path, 'files')

    os.makedirs(files_path, exist_ok=True)

    # Создаём пустые backup/config/restore
    for fname in ['backup.sls', 'config.sls', 'restore.sls']:
        fpath = os.path.join(policy_path, fname)
        with open(fpath, 'w') as f:
            pass

    # init.sls с include
    init_path = os.path.join(policy_path, 'init.sls')
    with open(init_path, 'w') as f:
        f.write("include:\n")
        f.write("  - .backup\n")
        f.write("  - .config\n")

print(f"✅ Структура всех политик создана в: {base_dir}/")
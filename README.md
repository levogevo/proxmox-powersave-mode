# proxmox-powersave-mode
If the system allows, switch the power mode to powersave.
Then create a system service to always turn on this feature on boot.

To install:
```
bash <(curl -Ls https://raw.githubusercontent.com/levogevo/proxmox-powersave-mode/main/enable_powersave.sh)
```

To uninstall:
```
systemctl stop powersave.service
systemctl disable powersave.service
```
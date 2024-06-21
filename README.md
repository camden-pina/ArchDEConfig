# Hyprdots
Dot files for Hyprland

1. Add "nvidia nvidia_modeset nvidia_uvm nvidia_drm" to the MODULES=() section of /etc/mkinitcpio.conf

2. Add "nvidia_drm.modeset=1                      
   nvidia.NVreg_PreserveVideoMemoryAllocations=1" to kernel parameters

3. Reboot
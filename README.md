# For uptime Log
```
./get_uptime.sh
./parse_uptime.sh
```


# Reload nvidia driver
```
sudo rmmod nvidia_uvm
sudo rmmod nvidia_drm
sudo rmmod nvidia_modeset
sudo rmmod nvidia

# Then, reload them if desired:
sudo modprobe nvidia
sudo modprobe nvidia_modeset
sudo modprobe nvidia_drm
sudo modprobe nvidia_uvm
```

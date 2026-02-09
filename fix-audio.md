## Add & Pin the Resolute Repository
Run these commands to add the repo and "pin" it. Pinning ensures that only the kernel is pulled, and your system won't accidentally upgrade to 26.04.

```bash
# Add the Resolute (26.04) repository
echo "deb http://archive.ubuntu.com/ubuntu/ resolute main restricted" | sudo tee /etc/apt/sources.list.d/resolute.list

# Create the Pin file to prevent full OS upgrade
cat <<EOF | sudo tee /etc/apt/preferences.d/resolute-pin
Package: *
Pin: release n=resolute
Pin-Priority: 1
EOF

sudo apt update
```

## Update Kernel
Install the "Ubuntu-fied" 6.19 kernel from the Resolute repo.

```bash
sudo apt install -t resolute linux-image-generic linux-headers-generic
```

## Update Firmware
Install the provided SOF Firmware (Run this in the folder with the .deb)

```bash
sudo apt install ./firmware-sof-signed_2025.12.2-1_all.deb
```

## Buffer Underflow Workaround

This prevents the SoundWire clock from desyncing by ensuring the buffer never shrinks too small for the hardware to keep up.

```bash
# Create user config directory
mkdir -p ~/.config/pipewire/pipewire.conf.d/

# Create the override file
cat <<EOF > ~/.config/pipewire/pipewire.conf.d/99-lunar-lake-audio-fix.conf
context.properties = {
    default.clock.min-quantum = 1024
}
EOF
```

## Reboot!

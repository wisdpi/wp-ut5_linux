# WP-UT5 driver for Linux

This is the driver released for WisdPi USB 3.2 to 5GbE adapter WP-UT5.
WP-UT5 use Realtek RTL8157 IC.

## Note
- The driver is a clone of Realtek linux driver r8152-2.18.1.
- We have tested the driver on Ubuntu 24.04.1. 
- In theory, it supports all Linux distribution versions after kernel version 4.10. If it works correctly on other versions during testing, please let me know, and we will add them to the compatibility list.

## Compatibility(Tested)
- Ubuntu 24.04


## Requirements
- Ubuntu 24.04.01
- Kernel: 
- WP-UT5

## Quick install
1. Prepare

  `sudo apt update -y && sudo apt install git gcc make -y`

2. Clone the code

  `git clone https://github.com/wisdpi/wp-ut5_linux.git`

3. Change to the directory

  `cd wp-ut5_linux/`

4. Build

  ```
  sudo depmod -a
  sudo make all
  ```

5. Config system

  ```
  sudo update-initramfs -u
  sudo cp 50-wput5.rules /etc/udev/rules.d/
  ```

6. Reboot:

  `sudo reboot`

7. You can check whether the driver is loaded by using following commands.
  
  ```
  lsmod | grep r8152
  ifconfig -a
  ```

![image](image/2.png)

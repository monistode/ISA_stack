# RISC stack ISA implementation

This is an implementation of a [RISC stack ISA from here](https://github.com/monistode/ISA-docs),
initiated from [this template](https://github.com/monistode/de10nano_template).

# Usage

## Getting the linux image
First you must have a DE10-Nano devboard, along with a linux image from [here](https://github.com/monistode/image-scripts).
You could also just ask the authors for a linux image, though they will probably ingnore you.

## Getting the binary
### Method 1
Just boot the installed linux image and do

```
mkdir -p /config
mount -t configfs configfs /config
cd /config/device-tree/overlays
mkdir -p stack
echo -n "stack.dtbo" > stack/path
```

### Method 2
To use this program, you have to first install [quartus](https://www.intel.com/content/www/us/en/products/details/fpga/development-tools/quartus-prime/resource.html).
Then, compile the project as described in [here](https://github.com/zangman/de10-nano/blob/master/docs/Flash-FPGA-from-HPS-running-Linux.md).
Now, move the `.rbf file` to `/boot/sdr.rbf`, and enjoy!

## Running the code
Get the program from [here](https://github.com/monistode/uploader), and compile it on the SD card.
```
gcc -std=c++14 upload.cpp -o upload
```
Then, just run the program you compiled with [this](https://github.com/monistode/binutils)
```
./upload program.bin
```

## What do the buttons mean?
- `SW3` enables and disables step-by-step execution
- If `SW1` is on and you press `KEY0`, the program counter goees to 0
- `KEY1` steps the instruciton
- `KEY0` unhalts
- `GPIO0[0]` is the RX for UART
- `GPIO0[1]` is the TX for UART
- All the other pins on `GPIO0` do parallel output, but don't use it, it's weird and bad design

Good luck, you'll need it!

# Useful reaources for learning all this
Check out the DE10-Nano for absolute beginners, it's a very useful repo.
    https://github.com/zangman/de10-nano/tree/master
Also, the getting started guide is OK
    https://www.intel.com/content/www/us/en/developer/articles/guide/terasic-de10-nano-get-started-guide.html
Lastly, just read the docs)


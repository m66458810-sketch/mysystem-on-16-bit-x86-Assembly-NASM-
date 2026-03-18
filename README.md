 # MikhailOS 🚀

Welcome to **MikhailOS**! This is a custom operating system project written entirely in **Assembly (x86)**. 

I am 12 years old, and I am passionate about low-level programming and learning how computer systems work from the ground up.

## 🛠 Features
- Written in **NASM Assembly**.
- Custom graphical bootloader logic.
- Displays a basic GUI/Interface upon boot.
- Developed by a junior mind exploring the world of OS development.

## 🚀 How to Compile and Run

To run this OS, you will need `nasm` and an emulator like `qemu`.

1. **Compile the source code:**
   nasm -f bin kernel.asm -o kernel.bin
   
3. Run in QEMU: qemu-system-x86_64 -drive format=raw,file=main.bin

   📈 Future Goals
[ ] Move to 32-bit Protected Mode.
[ ] Implement a basic kernel.
[ ] Add more complex graphics and user input handling.
[ ] Add detailed comments to the source code for better readability.
💬 Connect with me
If you like this project, feel free to leave a ⭐ star on GitHub! I appreciate all the feedback and "hats off" from the community.

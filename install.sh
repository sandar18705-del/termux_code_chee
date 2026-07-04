#!/data/data/com.termux/files/usr/bin/bash

echo -e "\033[92m[*] bypass_cyber အား ထည့်သွင်းနေပါသည်...\033[0m"

# ၁။ လိုအပ်တဲ့ Python နဲ့ Library တွေ သွင်းမယ်
echo -e "\033[94m[*] Installing required packages...\033[0m"
pkg update && pkg upgrade -y

# Install essential tools (တစ်ခါတည်းသွင်း)
echo -e "\033[94m[*] Installing build tools...\033[0m"
pkg install -y python python-pip clang cmake make
pkg install -y opencv opencv-python
pkg install -y libjpeg-turbo libpng
pkg install -y python-numpy  # Termux အတွက် numpy

# Install Python packages
echo -e "\033[94m[*] Installing Python packages...\033[0m"
pip install --upgrade pip
pip install numpy pybind11 setuptools wheel aiohttp ddddocr

# ၂။ Folder အဟောင်းရှိရင် ဖျက်ပြီး အသစ်ဆောက်မယ်
echo -e "\033[94m[*] Creating directory...\033[0m"
rm -rf ~/termux_code_chee
mkdir -p ~/termux_code_chee
cd ~/termux_code_chee

# ၃။ ဖုန်းရဲ့ Bit (Architecture) ကို စစ်ဆေးမယ်
echo -e "\033[94m[*] Checking device architecture...\033[0m"
ARCH=$(uname -m)

if [ "$ARCH" = "aarch64" ] || [ "$ARCH" = "arm64" ]; then
    echo -e "\033[92m[*] 64-bit device detected\033[0m"
    curl -LO https://raw.githubusercontent.com/sandar18705-del/termux_code_chee/main/termux_code_chee_64bit.so
    mv termux_code_chee_64bit.so termux_code_chee.so
elif [ "$ARCH" = "armv7l" ] || [ "$ARCH" = "arm" ]; then
    echo -e "\033[92m[*] 32-bit device detected\033[0m"
    curl -LO https://raw.githubusercontent.com/sandar18705-del/termux_code_chee/main/termux_code_chee_32bit.so
    mv termux_code_chee_32bit.so termux_code_chee.so
else
    echo -e "\033[91m[!] Unknown architecture: $ARCH\033[0m"
    exit 1
fi

# ၄။ run.py ကို ဒေါင်းမယ်
echo -e "\033[94m[*] Downloading run.py...\033[0m"
curl -LO https://raw.githubusercontent.com/sandar18705-del/termux_code_chee/main/run.py

# ၅။ Execute permission ပေးမယ်
chmod +x run.py
chmod +x termux_code_chee.so

# ၆။ စစ်ဆေးမယ်
if [ -f "termux_code_chee.so" ] && [ -f "run.py" ]; then
    echo -e "\033[92m[✔] အောင်မြင်စွာ ထည့်သွင်းပြီးပါပြီ!\033[0m"
    echo -e "\033[93mအသုံးပြုရန်:\033[0m"
    echo -e "  cd ~/termux_code_chee"
    echo -e "  python run.py"
    echo -e ""
    echo -e "\033[93mသို့မဟုတ် တစ်ကြောင်းတည်းနဲ့:\033[0m"
    echo -e "  cd ~/termux_code_chee && python run.py"
else
    echo -e "\033[91m[!] ဒေါင်းလုဒ်မအောင်မြင်ပါ။ အင်တာနက်ကို စစ်ဆေးပါ။\033[0m"
    exit 1
fi

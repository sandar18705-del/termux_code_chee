#!/data/data/com.termux/files/usr/bin/bash

echo -e "\033[92m[*] bypass_cyber အား ထည့်သွင်းနေပါသည်...\033[0m"

# ၁။ လိုအပ်တဲ့ Python နဲ့ Library တွေ သွင်းမယ်
pkg update && pkg upgrade -y


# 2. Install essential tools
pkg install python python-pip clang cmake make
pkg install opencv opencv-python
pkg install libjpeg-turbo libpng

# 3. Install Python packages
pip install numpy
pip install pybind11
pip install setuptools wheel
pip install aiohttp
pip install ddddocr
pkg install python -y


# ၂။ Folder အဟောင်းရှိရင် ဖျက်ပြီး အသစ်ဆောက်မယ်
rm -rf ~/termux_code_chee
mkdir -p ~/termux_code_chee
cd ~/termux_code_chee

# ၃။ ဖုန်းရဲ့ Bit (Architecture) ကို စစ်ဆေးမယ်
ARCH=$(getprop ro.product.cpu.abi)

if [ "$ARCH" = "arm64-v8a" ]; then
    echo -e "\033[94m[*] 64-bit ဖုန်းဖြစ်ကြောင်း စစ်ဆေးတွေ့ရှိရသဖြင့် 64-bit version ကို ဒေါင်းလုဒ်ဆွဲနေသည်...\033[0m"
    curl -LO https://raw.githubusercontent.com/sandar18705-del/termux_code_chee/main/termux_code_chee_64bit.so
    mv termux_code_chee_64bit.so termux_code_chee.so
else
    echo -e "\033[94m[*] 32-bit ဖုန်းဖြစ်ကြောင်း စစ်ဆေးတွေ့ရှိရသဖြင့် 32-bit version ကို ဒေါင်းလုဒ်ဆွဲနေသည်...\033[0m"
    curl -LO https://raw.githubusercontent.com/sandar18705-del/termux_code_chee/main/termux_code_chee_32bit.so
    mv termux_code_chee_32bit.so termux_code_chee.so
fi

# ၄။ Starter ဖိုင်ကို ဒေါင်းမယ်
curl -LO https://raw.githubusercontent.com/sandar18705-del/termux_code_chee/main/run.py

# ၅။ Execute permission ပေးမယ်
chmod +x run.py

echo -e "\033[92m[✔] အောင်မြင်စွာ ထည့်သွင်းပြီးပါပြီ!\033[0m"
echo -e "\033[93mအသုံးပြုရန်: cd ~/termux_code_chee && python run.py\033[0m"

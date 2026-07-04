import sys
import os
import asyncio
import importlib

# .so ဖိုင်ရှိတဲ့ folder ကို သေချာစေရန်
# GitHub ကနေ install လုပ်ထားရင် ဒီ path က မှန်ပါတယ်
module_path = os.path.expanduser("~/termux_code_chee")
if module_path not in sys.path:
    sys.path.append(module_path)

def main():
    try:
        # termux_code_chee.so ကို import လုပ်ခြင်း
        # name က import လုပ်တဲ့အခါ file extension မပါရပါ
        module = importlib.import_module("termux_code_chee")
        
        # main function ကို ရှာပြီး run
        if hasattr(module, 'main'):
            print("🚀 Starting module...")
            asyncio.run(module.main())
        else:
            print("❌ Error: 'main()' function not found in .so file.")
            
    except ImportError as e:
        print(f"❌ Error: Could not import .so file. {e}")
    except Exception as e:
        print(f"❌ Error: {e}")

if __name__ == "__main__":
    main()
      

# 🎧 L↔R Audio Channel Swap Toggle

A lightweight PowerShell + Equalizer APO hack to fix headsets that have swapped Left/Right audio channels — triggered instantly with a hotkey.

---

## 🧠 The Problem

So you bought a headset with separate audio and mic jacks (totally not the Akari 30 H8326, definitely not mine 🥲), grabbed a combo adapter to plug both into your laptop's single jack, and now everything sounds backwards.
The explosion that should rattle your left ear is coming from the right. The friend whispering directions in your right ear is in your left. It's chaos.
Turns out there are two wiring standards for headset jacks — CTIA and OMTP — and cheap adapters love to mismatch with your headset. It's not a defect, just an incompatibility. A very personal, very specific incompatibility that definitely didn't make me question my entire purchase. 🙂
This script fixes it in software using Equalizer APO. Toggle the swap on and off with a hotkey, no new hardware needed, and most importantly — no returns.

---

## ✅ What It Does

- Pressing the hotkey **toggles** a channel swap filter in Equalizer APO (`L=R, R=L`)
- Press again to go back to normal
- No windows pop up, no UI — just instant audio switching

---

## 📦 Requirements

- Windows 10/11
- [Equalizer APO](https://sourceforge.net/projects/equalizerapo/) installed (default path: `C:\Program Files\EqualizerAPO\`)
- PowerShell (built into Windows)

---

## 🛠️ Setup

### 1. Install Equalizer APO
Download and install from [here](https://sourceforge.net/projects/equalizerapo/).  
During setup, select your audio output device.

### 2. Create the config files
Navigate to `C:\Program Files\EqualizerAPO\config\` and create these two files:

**`swap.txt`**
```
Copy: L=R R=L
```

**`normal.txt`**
```
(leave this file empty)
```

> Your `config.txt` in the same folder should already exist from the Equalizer APO install.

### 3. Set up the script
Create this folder structure:
```
C:\
└── Scripts\
    ├── audio-toggle.ps1
    ├── Shortcuts\
    │   └── Audio Toggle.lnk
    └── Icons\
        └── audio.ico
```
Place `audio-toggle.ps1` directly inside `C:\Scripts\`.  
The `Icons` folder is optional — used if you want a custom icon on the shortcut.

### 4. Create a shortcut
1. Right-click on your Desktop → **New → Shortcut**
2. Set the target to:
   ```
   powershell.exe -NoProfile -ExecutionPolicy Bypass -File "C:\Scripts\audio-toggle.ps1"
   ```
3. Name it `Audio Toggle`
4. Optionally right-click → **Properties → Change Icon** and point it to your `.ico` file

### 5. Move shortcut to Start Menu Programs
Press `Win + R`, type `shell:programs`, hit Enter.  
**Cut and paste** your shortcut into that folder.

> ⚠️ The shortcut **must** be in this folder for hotkeys to work in Windows.  
> You can also keep a copy in `C:\Scripts\Shortcuts\` for backup.

### 6. Assign a hotkey
1. Right-click the shortcut in `shell:programs` → **Properties**
2. Click the **Shortcut key** field
3. Press your desired combo e.g. `Ctrl + Alt + A`
4. Click **Apply → OK**

### 7. Test it
Press your hotkey — audio should swap instantly. Press again to toggle back.

---

## 📁 File Structure

```
C:\
├── Scripts\
│   ├── audio-toggle.ps1
│   ├── Shortcuts\
│   │   └── Audio Toggle.lnk
│   └── Icons\
│       └── audio.ico
└── Program Files\
    └── EqualizerAPO\
        └── config\
            ├── config.txt      ← managed by the script
            ├── swap.txt        ← L=R R=L filter
            └── normal.txt      ← empty (no filter)
```

---

## ⚙️ How It Works

`audio-toggle.ps1` reads the current `config.txt`:
- If it contains `swap.txt` → switches to `normal.txt` (empty, no filter)
- Otherwise → switches to `swap.txt` (channel swap active)

Equalizer APO watches `config.txt` in real time, so the audio changes immediately with no restart needed.

---

## 📝 Notes

- If you change the install path of Equalizer APO, update the `$configPath` variable at the top of `audio-toggle.ps1`
- The hotkey only works when the shortcut is inside `shell:programs`
- If the hotkey stops working, **don't delete and recreate** the shortcut — edit it in place via Properties

---

## 💡 Why Not Just Buy a New Adapter?

You can! Look for adapters labeled **CTIA/OMTP switchable**. But this script is free, instant, and lets you toggle on the fly — useful if you share the headset or switch between apps.

---

## 📄 License

MIT — do whatever you want with it.

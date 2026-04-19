# 🟢 Termux Banner Tool

Termux-এর উপরে সবসময় একটি **Hacker-থিম ব্যানার** দেখানোর টুল।  
Custom নাম, টাইটেল এবং সাবটাইটেল সেট করা যায়।

```
╔══════════════════════════════════════════════════╗
║                     ALEX                         ║
║──────────────────────────────────────────────────║
║            Welcome to My Termux                  ║
║               Stay in the dark                   ║
╚══════════════════════════════════════════════════╝
```

---

## ⚡ ইনস্টল করুন (এক কমান্ডে)

```bash
git clone https://github.com/YOUR_USERNAME/termux-banner.git
cd termux-banner
bash install.sh
```

---

## 🛠️ ব্যবহার

### ইনস্টল করুন
```bash
bash install.sh
```
ইনস্টলের সময় জিজ্ঞেস করবে:
- **নাম** — বড় করে দেখাবে (যেমন: ALEX, ROOT, HACKER)
- **টাইটেল** — মাঝে দেখাবে
- **সাবটাইটেল** — নিচে দেখাবে (ঐচ্ছিক)

### পরিবর্তন করুন
```bash
cd termux-banner
bash install.sh
```
আবার চালালে নতুন তথ্য দিয়ে আপডেট হবে।

### আনইনস্টল করুন
```bash
bash uninstall.sh
```

---

## 📁 ফাইল স্ট্রাকচার

```
termux-banner/
├── install.sh          # ইনস্টলার
├── uninstall.sh        # আনইনস্টলার
├── scripts/
│   └── banner.sh       # মূল ব্যানার স্ক্রিপ্ট
└── README.md
```

---

## ⚙️ কীভাবে কাজ করে

- `install.sh` চালালে আপনার নাম/টাইটেল `~/.termux_banner_config` এ সেভ হয়
- `~/.bashrc` ও `~/.zshrc` এ স্বয়ংক্রিয়ভাবে যোগ হয়
- Termux খোলার সাথে সাথে ব্যানার দেখায়

---

## 📋 Requirements

- Termux (Android)
- bash

---

## 📄 License

MIT License

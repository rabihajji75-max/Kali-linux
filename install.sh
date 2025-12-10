#!/bin/bash
# أداة التثبيت بنقرة واحدة - Educational Phone Tracker
# 🇹🇳 يدعم تونس (+216)

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[1;36m'
NC='\033[0m'

echo -e "${CYAN}"
echo "╔══════════════════════════════════════════════╗"
echo "║    Educational Phone Tracker Simulator       ║"
echo "║       🇸🇦 🇦🇪 🇪🇬 🇹🇳 🇺🇸 🇫🇷 🇬🇧       ║"
echo "║        FOR EDUCATIONAL USE ONLY             ║"
echo "╚══════════════════════════════════════════════╝${NC}"
echo ""
echo -e "${YELLOW}⚠️  تحذير: هذه الأداة لأغراض تعليمية فقط!${NC}"
echo -e "${RED}   يحظر تتبع الأشخاص دون موافقتهم قانونياً!${NC}"
echo ""

# التحقق من النظام
echo -e "${GREEN}🔍 فحص النظام...${NC}"

if [[ $(grep -i "kali" /etc/os-release) ]]; then
    echo -e "${GREEN}✓ Kali Linux موجود${NC}"
elif [[ $(grep -i "ubuntu" /etc/os-release) ]]; then
    echo -e "${GREEN}✓ Ubuntu موجود${NC}"
elif [[ $(grep -i "debian" /etc/os-release) ]]; then
    echo -e "${GREEN}✓ Debian موجود${NC}"
else
    echo -e "${YELLOW}⚠ نظام غير معروف${NC}"
fi

# تثبيت المتطلبات
echo ""
echo -e "${GREEN}📦 تثبيت المتطلبات...${NC}"
sudo apt update -y
sudo apt install -y python3 python3-pip git wget curl unzip
pip3 install requests colorama

# تحميل المشروع
echo ""
echo -e "${GREEN}⬇️  تحميل المشروع...${NC}"
git clone https://github.com/YOUR_USERNAME/phone-tracker-edu.git 2>/dev/null || {
    echo -e "${YELLOW}⚠ Git غير مثبت، جاري التحميل المباشر...${NC}"
    wget -q https://github.com/YOUR_USERNAME/phone-tracker-edu/archive/main.zip -O tracker.zip
    unzip -q tracker.zip
    mv phone-tracker-edu-main phone-tracker-edu
    rm tracker.zip
}

cd phone-tracker-edu

# جعل الملفات قابلة للتنفيذ
chmod +x tracker.py
chmod +x start.sh

# إنشاء اختصار سطح المكتب
echo ""
echo -e "${GREEN}🔗 إنشاء اختصار على سطح المكتب...${NC}"
cat > ~/Desktop/Start_Tracker_Educational.desktop << EOF
[Desktop Entry]
Name=Phone Tracker Simulator (Educational)
Comment=أداة تعليمية لمحاكاة تتبع الهواتف
Exec=/bin/bash -c "cd $(pwd) && python3 tracker.py"
Icon=applications-internet
Terminal=true
Type=Application
Categories=Education;Security;
Keywords=education;privacy;tracking;simulator
EOF

chmod +x ~/Desktop/Start_Tracker_Educational.desktop

# إنشاء أمر مباشر
echo ""
echo -e "${GREEN}⚙️  إنشاء أمر مباشر...${NC}"
cat > /usr/local/bin/tracker-edu << EOF
#!/bin/bash
cd $(pwd)
python3 tracker.py
EOF

chmod +x /usr/local/bin/tracker-edu

echo ""
echo -e "${GREEN}✅ تم التثبيت بنجاح!${NC}"
echo ""
echo -e "${CYAN}🎯 طرق التشغيل:${NC}"
echo "   1. ${GREEN}في Terminal:${NC} اكتب ${YELLOW}tracker-edu${NC}"
echo "   2. ${GREEN}من المجلد:${NC} اكتب ${YELLOW}python3 tracker.py${NC}"
echo "   3. ${GREEN}من سطح المكتب:${NC} انقر نقراً مزدوجاً على ${YELLOW}Start_Tracker_Educational${NC}"
echo ""
echo -e "${CYAN}🌍 الدول المدعومة:${NC}"
echo "   🇸🇦 السعودية (+966) | 🇦🇪 الإمارات (+971)"
echo "   🇪🇬 مصر (+20) | 🇹🇳 تونس (+216) 🇹🇳"
echo "   🇺🇸 أمريكا (+1) | 🇫🇷 فرنسا (+33) | 🇬🇧 بريطانيا (+44)"
echo ""
echo -e "${YELLOW}📚 تذكر: هذه الأداة لأغراض تعليمية فقط!${NC}"
echo -e "${RED}🚫 يحظر استخدامها لتتبع الأشخاص الحقيقيين${NC}"

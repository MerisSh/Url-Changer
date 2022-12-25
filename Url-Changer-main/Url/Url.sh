# Bash Script for Hide Phishing URL Created by KP

url_checker() {
    if [ ! "${1//:*}" = http ]; then
        if [ ! "${1//:*}" = https ]; then
            echo -e "[91m[!] URL INCORRECT. Merci de vouloir utiliser des liens commencent par http ou https.[97m"
            exit 1
        fi
    fi
}

echo -e "[97m"
echo -n "[97mURL à modifier [91m[[97mhttp[91m/[97mhttps[91m] >[92m "
read phish
url_checker $phish
sleep 1
echo "[97mModifications en cours..."
echo ""
short=$(curl -s https://is.gd/create.php\?format\=simple\&url\=${phish})
shorter=${short#https://}
echo -e "[97mQue voulez vous appliquer au lien [91m[ [97mexemple [91m> [97mhttps://google.com/ [91m][97m"
echo -en "[91m >[92m "
read mask
url_checker $mask
echo -e "[97m"
echo -e "[97mQue voulez vous appliquer en fin de lien [91m[ [97mexemple [91m> [97mhttps://google.com-logs [91m][97m"
echo -e "[97mMerci de ne pas faire espace mais d'appliquer cela à la place [97m"[91m-[97m"\e[0m"
echo -en "[91m >[92m "
read words
if [[ -z "$words" ]]; then
echo -e "[91m[!] INCORRECT.[97m"
echo -e "\n[97mVotre lien et en cours de création...\n"
final=$mask@$shorter
echo -e "[97mVoici votre URL [91m>[92m ${final} \e[0m\n"
exit
fi
if [[ "$words" =~ " " ]]; then
echo -e "[91m[!] INCORRECT.[97m"
echo -e "\n[97mVotre lien et en cours de création...\n"
final=$mask@$shorter
echo -e "[97mVoici votre URL [91m>[92m ${final} \e[0m\n"
exit
fi
echo -e "\n[97mVotre lien et en cours de création...\n"
final=$mask-$words@$shorter
echo -e "[97mVoici votre URL [91m>[92m ${final} \e[0m\n"

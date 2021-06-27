#!/bin/bash
NC='\033[0m'
RED='\033[1;38;5;196m'
GREEN='\033[1;38;5;040m'
ORANGE='\033[1;38;5;202m'
BLUE='\033[1;38;5;012m'
BLUE2='\033[1;38;5;032m'
PINK='\033[1;38;5;013m'
GRAY='\033[1;38;5;004m'
NEW='\033[1;38;5;154m'
YELLOW='\033[1;38;5;214m'
CG='\033[1;38;5;087m'
CP='\033[1;38;5;221m'
CPO='\033[1;38;5;205m'
CN='\033[1;38;5;247m'
CNC='\033[1;38;5;051m'

function banner(){
echo -e ${RED}"#############################################################################"
echo -e ${CP}"#            ____   ___  _     ____   ____    _    _   _                      #"                           
echo -e ${CP}"#           / ___| / _ \| |   / ___| / ___|  / \  | \ | |                     #"
echo -e ${CP}"#           \___ \| | | | |   \___ \| |     / _ \ |  \| |                     #"
echo -e ${CP}"#            ___) | |_| | |___ ___) | |___ / ___ \| |\  |                     #"
echo -e ${CP}"#           |____/ \__\_\_____|____/ \____/_/   \_\_| \_|                     #"
echo -e  ${PINK}"#                 A FrameWork For Scanning SQL Injection                      #"
echo -e ${BLUE}"#                 https://facebook.com/unknownclay                            #"
echo -e ${YELLOW}"#                 Coded By: Machine404                                        #"
echo -e ${CP}"#                 https://github.com/machine1337                              #"
echo -e ${RED}"##############################################################################"
            
}
sleep 1
echo -e ${CP}"[+] Checking Internet Connectivity"
if [[ "$(ping -c 1 google.com | grep '100% packet loss' )" != "" ]]; then
  echo "No Internet Connection"
  exit 1
  else
  echo "Internet is present"
  
fi

function sql_single(){
clear
banner
echo -e -n ${BLUE}"\n[+] Enter domain name (e.g https://target.com/) : "
read domain
echo -e -n ${BLUE}"\n[+] Enter path of payloads list: "
read list
echo -e ${CNC}"\n[+] Searching For SQL Injection"
for i in $(cat $list); do
curl -s $domain | wc -l > tmp1
curl -s $domain$i | wc -l > tmp2
tmp1=$(cat tmp1)
tmp2=$(cat tmp2)
if [ $tmp1 -gt $tmp2 ]; then
echo -n -e "\n${BLUE}$domain ${CP}"[Payload $i]" ${RED}[VULNERABLE]${RED}\n" | tee sql_single1.txt
elif [ $tmp1 -lt $tmp2 ]; then
echo -n -e "${CP} $domain ${CP}"[Payload $i]" ${RED}[VULNERABLE]${RED}\n"   | tee sql_single2.txt
elif [ $tmp1 -eq $tmp2 ]; then
echo -n -e ${GREEN}"\n$domain  [Not Vulnerable]"
fi
done
rm tmp1 tmp2
}
function sql_mass(){
clear
banner
echo -n -e ${PINK}"\n[+]Enter target urls list (e.g https://target.com) : "
read urls
echo -n -e ${PINK}"\n[+]Enter path of payloads list : "
read pay
sleep 1
echo -e ${CNC}"\n[+] Searching For SQL Injection "
for i in $(cat $urls ); do
for j in $(cat $pay); do
curl -s  $i | wc -l > mass1
curl -s  $i$j | wc -l > mass2
mass1=$(cat mass1)
mass2=$(cat mass2)
if [ $mass1 -gt $mass2 ]; then
echo -n -e "\n${BLUE}$i ${CP}"[Payload $j]" ${RED}[VULNERABLE]${RED}\n" | tee sql_mass1.txt
elif [ $mass1 -lt $mass2 ]; then
echo -n -e "\n${CP} $i ${CP}"[Payload $j]" ${RED}[VULNERABLE]${RED}\n"   | tee sql_mass2.txt
elif [ $mass1 -eq $mass2 ]; then
echo -n -e ${GREEN}"\n$i  [Not Vulnerable]\n"
fi
done
done
rm mass1 mass2
}
trap ctrl_c INT
ctrl_c() {
clear
echo -e ${RED}"[*] (Ctrl + C ) Detected, Trying To Exit... "
echo -e ${RED}"[*] Stopping Services... "
if [[ ! -f mass1  ]]; then
 echo "aleady cleaned"   >/dev/null 2>&1
else
rm  -R mass1 
fi
if [[ ! -f mass2  ]]; then echo "aleady cleaned"   >/dev/null 2>&1 
else
rm  -R mass2
fi
 
sleep 1
echo ""
echo -e ${YELLOW}"[*] Thanks For Using SQL SCANNER  :)"
exit
}
menu()
{
clear
banner
echo -e ${YELLOW}"\n[*] Which Type of Scan u want to Perform\n "
echo -e "  ${NC}[${CG}"1"${NC}]${CNC} Single domain Scan"
echo -e "  ${NC}[${CG}"2"${NC}]${CNC} List of domains"
echo -e "  ${NC}[${CG}"3"${NC}]${CNC} Exit"

echo -n -e ${YELLOW}"\n[+] Select: "
        read redi_play
                if [ $redi_play -eq 1 ]; then
                        sql_single
                elif [ $redi_play -eq 2 ]; then
                        sql_mass
                elif [ $redi_play -eq 3 ]; then
                      exit
                fi
}
menu

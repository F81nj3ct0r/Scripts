#!/bin/bash

# Created by F81nj3ct0r - 01-20-2024
# The following script and its contents are free to use and redistribute, please just give credit where it is due.

# This script is intended to simply automate the manual checking of some of the common PrivEsc opportunities on Linux
# To use the script, just get the script onto your target and run: "./Auto_Info_Gatherer.sh" 

## SET VARIABLES FOR COLOR ##
RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

## CREATING NECESSARY DIRECTORIES ##
mkdir AIG_RESULTS
cd AIG_RESULTS

printf "Created By ${PURPLE}F81nj3ct0r${NC}\n"
printf "${YELLOW}View My Other Content on GitHub at https://github.com/F81nj3ct0r?tab=repositories ${NC}\n"
echo ""
printf "${RED}Use Only on Systems Where You Have Permission to be Snooping on!${NC}\n"
echo ""
printf "${RED}################${NC}\n"
printf "${RED}STARTING SCRIPT!${NC}\n"
printf "${RED}################${NC}\n"
echo ""

## CHECKING OS AND KERNEL INFORMATION ##
printf "${BLUE}##################################${NC}\n"
printf "${BLUE}CHECKING OS AND KERNEL INFORMATION${NC}\n"
printf "${BLUE}##################################${NC}\n"
echo ""

cat /etc/issue
echo ""
cat /etc/os-release
echo ""
uname -a
echo ""
arch

echo ""
echo ""
echo ""


## CHECKING KERNAL MODULE INFORMATION ##
printf "${BLUE}##################################${NC}\n"
printf "${BLUE}CHECKING KERNEL MODULE INFORMATION${NC}\n"
printf "${BLUE}##################################${NC}\n"
echo ""

printf "${CYAN}---------------------------------${NC}\n" 
printf "${CYAN}Loaded Kernel Module Information:${NC}\n"
printf "${CYAN}---------------------------------${NC}\n"
lsmod

echo ""
printf "${YELLOW}TO FIND OUT MORE ABOUT A SPECIFIC MODULE, RUN ${ORANGE}'/sbin/modinfo [module name]'${NC}\n"
echo ""

echo ""
echo ""
echo ""


## CHECKING MOUNTED DRIVE INFORMATION ##
printf "${BLUE}##################################${NC}\n"
printf "${BLUE}CHECKING MOUNTED DRIVE INFORMATION${NC}\n"
printf "${BLUE}##################################${NC}\n"
echo ""

printf "${CYAN}-------------------------------${NC}\n" 
printf "${CYAN}Mounted Filesystem Information:${NC}\n"
printf "${CYAN}-------------------------------${NC}\n" 
mount

echo ""

printf "${CYAN}-----------------------------------${NC}\n" 
printf "${CYAN}Drives Mounted At Boot Information:${NC}\n"
printf "${CYAN}-----------------------------------${NC}\n" 
cat /etc/fstab
echo ""

printf "${CYAN}--------------------------------${NC}\n" 
printf "${CYAN}All Available Disks Information:${NC}\n"
printf "${CYAN}--------------------------------${NC}\n" 
lsblk -afs


echo ""
echo ""
echo ""


## CHECKING PROCESS INFORMATION ##
printf "${BLUE}##################################${NC}\n"
printf "${BLUE}   CHECKING PROCESS INFORMATION   ${NC}\n"
printf "${BLUE}##################################${NC}\n"
echo ""

ps -aux

echo ""
echo ""
echo ""


## CHECKING NETWORK INFORMATION ##
printf "${BLUE}##################################${NC}\n"
printf "${BLUE}   CHECKING NETWORK INFORMATION   ${NC}\n"
printf "${BLUE}##################################${NC}\n"
echo ""
printf "${CYAN}---------------------------${NC}\n" 
printf "${CYAN}Network Device Information:${NC}\n"
printf "${CYAN}---------------------------${NC}\n" 
ifconfig -a
ip address
echo ""

printf "${CYAN}---------------------------${NC}\n" 
printf "${CYAN}Network Routes Information:${NC}\n"
printf "${CYAN}---------------------------${NC}\n" 
route -ev
routel -ev
echo ""

printf "${CYAN}-------------------------------${NC}\n" 
printf "${CYAN}Network Connection Information:${NC}\n"
printf "${CYAN}-------------------------------${NC}\n" 
netstat -anp > NETSTAT_RESULTS.txt
echo ""
printf "${GREEN}To see the output of the netstat command, see 'NETSTAT_RESULTS.txt'${NC}\n"
echo ""
ss -anp > SS_RESULTS.txt
echo ""
printf "${GREEN}To see the output of the ss command, see 'SS_RESULTS.txt'${NC}\n"


echo ""
printf "${CYAN}IP Tables Rules:${NC}\n"
iptables -L
echo ""
cat "/etc/iptables/rules.v4$" 2>/dev/null
echo ""

echo ""
echo ""
echo ""


## CHECKING ENV VARS FOR INFORMATION ##
printf "${BLUE}#################################${NC}\n"
printf "${BLUE}CHECKING ENV VARS FOR INFORMATION${NC}\n"
printf "${BLUE}#################################${NC}\n"
echo ""
printf "${CYAN}----------------------${NC}\n"
printf "${CYAN}Environment Variables:${NC}\n"
printf "${CYAN}----------------------${NC}\n"
env

echo ""
printf "${CYAN}-----------------------${NC}\n"
printf "${CYAN}.BASHRC File Variables:${NC}\n"
printf "${CYAN}-----------------------${NC}\n"


echo ""
echo ""
echo ""

## CHECKING CRON JOBS FOR INFORMATION ##
printf "${BLUE}##################################${NC}\n"
printf "${BLUE}  CHECKING CRON JOBS INFORMATION  ${NC}\n"
printf "${BLUE}##################################${NC}\n"
echo ""
printf "${CYAN}----------------------${NC}\n"
printf "${CYAN}Current User Cronjobs:${NC}\n"
printf "${CYAN}----------------------${NC}\n"
crontab -l
echo ""

printf "${CYAN}-----------------------${NC}\n"
printf "${CYAN}All Scheduled Cronjobs:${NC}\n"
printf "${CYAN}-----------------------${NC}\n"
ls -la /etc/cron.*

echo ""
echo ""
echo ""



## CHECKING INSTALLED PACKAGES FOR INFORMATION ##
printf "${BLUE}###############################################${NC}\n"
printf "${BLUE}CHECKING ALL INSTALLED PACKAGES FOR INFORMATION${NC}\n"
printf "${BLUE}###############################################${NC}\n"
echo ""
printf "${GREEN}TO SEE A LIST OF ALL INSTALLED PACKAGES, SEE THE 'INSTALLED_PACKAGES.txt' FILE${NC}\n"
dpkg -s > INSTALLED_PACKAGES.txt
dpkg -l >> INSATALLED_PACKAGES.txt

echo ""
echo ""
echo ""


## CHECKING FOR ALL USER WRITABLE FILES ##
printf "${BLUE}####################################${NC}\n"
printf "${BLUE}CHECKING FOR ALL USER WRITABLE FILES${NC}\n"
printf "${BLUE}####################################${NC}\n"
echo ""
find / -writable -type d 2>/dev/null

echo ""
echo ""
echo ""


## CHECKING FOR ALL FILES WITH SUID SET ##
printf "${BLUE}####################################${NC}\n"
printf "${BLUE}CHECKING FOR ALL FILES WITH SUID SET${NC}\n"
printf "${BLUE}####################################${NC}\n"
echo ""
find / -perm -u=s -type f 2>/dev/null
find / -perm -u=s -type f 2>/dev/null > SUID_FILES.txt
printf "${GREEN}TO SEE A LIST OF GREPABLE SUID FILES, SEE THE 'SUID_FILES.txt' FILE!${NC}\n"
echo ""
printf "${GREEN}TO FIND ONLY READABLE TEXT IN THOSE FILES, RUN";printf ${ORANGE}' for file in $(cat SUID_FILES.txt); do strings $file | grep "OS"; done '${NC}
echo ""

echo ""
echo ""
echo ""

## CHECKING FOR SUDO PERMISSIONS ##
printf "${BLUE}#############################${NC}\n"
printf "${BLUE}CHECKING FOR SUDO PERMISSIONS${NC}\n"
printf "${BLUE}#############################${NC}\n"
echo ""
sudo -l


echo ""
echo ""
echo ""

## CHECKING /ETC/PASSWD AND /USR/BIN/PASSWD PERMISSIONS ##
printf "${BLUE}##################################${NC}\n"
printf "${BLUE}CHECKING PASSWORD FILE PERMISSIONS${NC}\n"
printf "${BLUE}##################################${NC}\n"
echo ""
printf "${CYAN}------------------------${NC}\n"
printf "${CYAN}/etc/passwd Permissions:${NC}\n"
printf "${CYAN}------------------------${NC}\n"
ls -la /etc/passwd
cat /etc/passwd 2>/dev/null
echo ""

printf "${CYAN}------------------------${NC}\n"
printf "${CYAN}/etc/shadow Permissions:${NC}\n"
printf "${CYAN}------------------------${NC}\n"
ls -la /etc/shadow
cat /etc/shadow 2>/dev/null
echo ""

printf "${CYAN}----------------------------${NC}\n"
printf "${CYAN}/usr/bin/passwd Permissions:${NC}\n"
printf "${CYAN}----------------------------${NC}\n"
ls -asl /usr/bin/passwd
echo ""


echo ""
echo ""
echo ""

## CHECKING CAPABILITIES ON SYSTEM BINARIES ##
printf "${BLUE}########################################${NC}\n"
printf "${BLUE}CHECKING CAPABILITIES ON SYSTEM BINARIES${NC}\n"
printf "${BLUE}########################################${NC}\n"
echo ""
/usr/sbin/getcap -r / 2>/dev/null
echo ""
echo ""
echo ""

## EXIT ##
printf "${RED}#################################################${NC}\n"
printf "${RED}Script Execution Complete! See Above for Results!${NC}\n"
printf "${RED}#################################################${NC}\n"
echo ""
echo ""

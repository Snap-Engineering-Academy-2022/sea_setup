#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
MAGENTA='\033[0;164m'
NC='\033[0m'

printf "${MAGENTA}Creating file system...${NC}\n"
cd /Users/`whoami`/Desktop
mkdir g9CS
cd g9CS
mkdir unit_00
printf "${GREEN}✓✓✓ File system created!${NC}\n"

printf "${MAGENTA}Installing Homebrew...${NC}\n"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
#need response from user
printf "${GREEN}✓✓✓ Homebrew installed!${NC}\n"
#
# printf "${MAGENTA}Installing Python3...${NC}\n"
# brew install python3
# printf "${GREEN}✓✓✓ Python3 installed!${NC}\n"
#
# printf "${MAGENTA}Installing git...${NC}\n"
# brew install git
# printf "${GREEN}✓✓✓ git installed!${NC}\n"
#
# printf "${MAGENTA}Installing direnv...${NC}\n"
# brew install direnv
# printf "${GREEN}✓✓✓ direnv installed!${NC}\n"
#
# printf "${MAGENTA}Installing Atom...${NC}\n"
# brew cask install atom
# printf "${GREEN}✓✓✓ Atom installed!${NC}\n"
#
# echo 'eval "$(direnv hook bash)"' > /Users/`whoami`/.bash_profile
# #restart terminal?
#
# printf "${MAGENTA}Creating virtual environment...${NC}\n"
# python3 -m venv env
# echo 'source env/bin/activate' > .envrc
# direnv allow .
# printf "${GREEN}✓✓✓ virtual environment created! ${NC}\n"

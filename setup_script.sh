#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
PURPLE='\033[1;35m'
NC='\033[0m'

printf "${BLUE}Creating file system...${NC}\n"
cd /Users/`whoami`/Desktop
mkdir -p cs9
cd cs9
mkdir -p unit_00
printf "${GREEN}✓✓✓ File system created!${NC}\n\n\n"

printf "${BLUE}Installing Homebrew...${NC}\n"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
printf "${GREEN}✓✓✓ Homebrew installed!${NC}\n\n\n"

printf "${BLUE}Installing python3...${NC}\n"
brew install python3
printf "${GREEN}✓✓✓ python3 installed!${NC}\n\n\n"

printf "${BLUE}Installing git...${NC}\n"
brew install git
printf "${GREEN}✓✓✓ git installed!${NC}\n\n\n"

printf "${BLUE}Installing direnv...${NC}\n"
brew install direnv
printf "${GREEN}✓✓✓ direnv installed!${NC}\n\n\n"

printf "${BLUE}Installing Atom...${NC}\n"
brew cask install atom
printf "${GREEN}✓✓✓ Atom installed!${NC}\n\n\n"

printf "${BLUE}Creating virtual environment...${NC}\n"
python3 -m venv env
printf 'PATH_add env/bin' > .envrc
if [ ! -e /Users/`whoami`/.bash_profile ]; then
    printf 'eval "$(direnv hook bash)"' > /Users/`whoami`/.bash_profile
else
    printf '\neval "$(direnv hook bash)"' >> /Users/`whoami`/.bash_profile
fi
source ~/.bash_profile
direnv allow .
printf "${GREEN}✓✓✓ virtual environment created! ${NC}\n\n\n"

printf "${PURPLE}Your computer is configured! Please restart Terminal. ${NC}\n"

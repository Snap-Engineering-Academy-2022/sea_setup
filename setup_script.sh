#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
PURPLE='\033[1;35m]'
NC='\033[0m'

printf "${BLUE}Creating file system...${NC}\n"
cd /Users/`whoami`/Desktop
mkdir -p g9CS
cd g9CS
mkdir -p unit_00
printf "${GREEN}✓✓✓ File system created!${NC}\n\n\n"

printf "${BLUE}Installing Homebrew...${NC}\n"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
printf "${GREEN}✓✓✓ Homebrew installed!${NC}\n\n\n"

printf "${BLUE}Installing Python3...${NC}\n"
brew install python3
printf "${GREEN}✓✓✓ Python3 installed!${NC}\n\n\n"

printf "${BLUE}Installing git...${NC}\n"
brew install git
printf "${GREEN}✓✓✓ git installed!${NC}\n\n\n"

printf "${BLUE}Installing direnv...${NC}\n"
brew install direnv
echo 'eval "$(direnv hook bash)"' > /Users/`whoami`/.bash_profile
source ~/.bash_profile
printf "${GREEN}✓✓✓ direnv installed!${NC}\n\n\n"

printf "${BLUE}Installing Atom...${NC}\n"
brew cask install atom
printf "${GREEN}✓✓✓ Atom installed!${NC}\n\n\n"

printf "${BLUE}Creating virtual environment...${NC}\n"
python3 -m venv env
echo 'source env/bin/activate' > .envrc
direnv allow .
printf "${GREEN}✓✓✓ virtual environment created! ${NC}\n\n\n"

printf "${PURPLE}Your computer is configured! Please restart Terminal. ${NC}\n"

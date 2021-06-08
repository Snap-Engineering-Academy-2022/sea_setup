#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
PURPLE='\033[1;35m'
NC='\033[0m'

# file system creation
printf "${BLUE}Creating file system...${NC}\n" sudo chown -R $(whoami) /usr/local/etc
cd /Users/`whoami`/Desktop
mkdir -p sea
cd sea
mkdir -p t1
printf "${GREEN}✓✓✓ File system created!${NC}\n\n\n"

#changing ownership of /usr/local/etc directories
sudo chown -R $(whoami) /usr/local/etc

#giving user write permission
chmod u+w /usr/local/etc

printf "${BLUE}Installing Xcode...${NC}\n"
xcode-select --install
xcode_version=$( xcode-select --version )
if [[ "$xcode_version" =~ "xcode-select version "[2-9][0-9][0-9][0-9]"." ]]; then
  printf "${GREEN}✓✓✓ Xcode installed!${NC}\n\n\n"
else
  printf "${RED}Message from version request: %s${NC}\n" "$xcode_version"
  printf "${RED}Unexpected output from Xcode installation. Please ask an instructor for help. ${NC}"
  read -p "Proceed? [y/n]: " ans
  if [[ $ans == 'n' ]]; then
    exit 1
  fi
fi

# macOS version check, Homebrew requires 10.12 or higher
printf "${BLUE}Checking macOS version...${NC}\n"
os_version=$( defaults read loginwindow SystemVersionStampAsString )
printf "You are running macOS verion %s.\n" $os_version
if [[ "$os_version" =~ 10\.1[2-9]\.[0-9]? ]]; then
  printf "${GREEN}✓✓✓ macOS version supported by Homebrew!${NC}\n\n\n"
else
  printf "${RED}Installing Homebrew requires macOS version 10.12 or higher. Please ask an instructor for help. ${NC}"
  read -p "Proceed? [y/n]: " ans
  if [[ $ans == 'n' ]]; then
    exit 1
  fi
fi

# Homebrew installation
printf "${BLUE}Installing Homebrew...${NC}\n"
brew_version=$( brew --version )
if [[ "$brew_version" =~ "Homebrew "2\.[1-9]\.[1-9][0-9]?.? ]]; then
  printf "${GREEN}✓✓✓ Homebrew already installed !${NC}\n\n\n"
else
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew_version=$( brew --version )
  if [[ "$brew_version" =~ "Homebrew "2\.[1-9]\.[1-9][0-9]?.? ]]; then
    printf "${GREEN}✓✓✓ Homebrew installed !${NC}\n\n\n"
  else
    printf "${RED}Output from version request: %s${NC}\n" "$brew_version"
    printf "${RED}Unexpected output from Homebrew installation. Please ask an instructor for help. ${NC}"
    read -p "Proceed? [y/n]: " ans
    if [[ $ans == 'n' ]]; then
      exit 1
    fi
  fi
fi

# node installation
printf "${BLUE}Installing node.js...${NC}\n"
node_version=$( node --version )
if [[ "$node_version" =~ "Node "12\.[0-9]\.[0-9]? ]]; then
  printf "${GREEN}✓✓✓ Node already installed!${NC}\n\n\n"
else
  brew install node
  node_version=$( node --version )
  if [[ "$node" =~ "Node "12\.[0-9]\.[0-9]? ]]; then
    printf "${GREEN}✓✓✓ Node installed!${NC}\n\n\n"
  else
    printf "${RED}Output from version request: %s${NC}\n" "$node_version"
    printf "${RED}Unexpected output from Node installation. Please ask an instructor for help. ${NC}"
    read -p "Proceed? [y/n]: " ans
    if [[ $ans == 'n' ]]; then
      exit 1
    fi
  fi
fi

# git installation
printf "${BLUE}Installing git...${NC}\n"
git_version=$( git --version )
if [[ "$git_version" =~ "git version "2\.[2-9][0-9]?\.[0-9]? ]]; then
  printf "${GREEN}✓✓✓ git already installed!${NC}\n\n\n"
else
  brew install git
  git_version=$( git --version )
  if [[ "$git_version" =~ "git version "2\.[2-9][0-9]?\.[0-9]? ]]; then
    printf "${GREEN}✓✓✓ git installed!${NC}\n\n\n"
  else
    printf "${RED}Output from version request: %s${NC}\n" "$git_version"
    printf "${RED}Unexpected output from git installation. Please ask an instructor for help. ${NC}"
    read -p "Proceed? [y/n]: " ans
    if [[ $ans == 'n' ]]; then
      exit 1
    fi
  fi
fi

# yarn installation
printf "${BLUE}Installing yarn...${NC}\n"
yarn_version=$( yarn --version )
if [[ "$yarn_version" =~ "yarn version "2\.[2-9][0-9]?\.[0-9]? ]]; then
  printf "${GREEN}✓✓✓ yarn already installed!${NC}\n\n\n"
else
  brew install yarn
  yarn_version=$( yarn --version )
  if [[ "$yarn_version" =~ "yarn version "2\.[2-9][0-9]?\.[0-9]? ]]; then
    printf "${GREEN}✓✓✓ yarn installed!${NC}\n\n\n"
  else
    printf "${RED}Output from version request: %s${NC}\n" "$yarn_version"
    printf "${RED}Unexpected output from yarn installation. Please ask an instructor for help. ${NC}"
    read -p "Proceed? [y/n]: " ans
    if [[ $ans == 'n' ]]; then
      exit 1
    fi
  fi
fi



printf "${PURPLE}Your computer is configured! Please restart Terminal. ${NC}\n"
exit 0

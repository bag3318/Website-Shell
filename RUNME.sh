#!/bin/sh

# Code > English comments available

# Define preset variables
# =============================

# Text Emphasis
normal=$(tput sgr0);      # Select normal mode
bold=`tput bold`;         # Select bold mode
nonbold=`tput sgr0` 	  # Select non-bold mode
underline=`tput smul`;    # Select underline mode
nonunderline=`tput rmul`; # Select non-underline mode

# Reset
Color_Off='\033[0m';       # Text Reset

# Regular Colors
Black='\033[0;30m';        # Black
Red='\033[0;31m';          # Red
Green='\033[0;32m';        # Green
Yellow='\033[0;33m';       # Yellow
Blue='\033[0;34m';         # Blue
Purple='\033[0;35m';       # Purple
Cyan='\033[0;36m';         # Cyan
White='\033[0;37m';        # White

# Bold
BBlack='\033[1;30m';       # Black
BRed='\033[1;31m';         # Red
BGreen='\033[1;32m';       # Green
BYellow='\033[1;33m';      # Yellow
BBlue='\033[1;34m';        # Blue
BPurple='\033[1;35m';      # Purple
BCyan='\033[1;36m';        # Cyan
BWhite='\033[1;37m';       # White

# Underline
UBlack='\033[4;30m';       # Black
URed='\033[4;31m';         # Red
UGreen='\033[4;32m';       # Green
UYellow='\033[4;33m';      # Yellow
UBlue='\033[4;34m';        # Blue
UPurple='\033[4;35m';      # Purple
UCyan='\033[4;36m';        # Cyan
UWhite='\033[4;37m';       # White

# Background
On_Black='\033[40m';       # Black
On_Red='\033[41m';         # Red
On_Green='\033[42m';       # Green
On_Yellow='\033[43m';      # Yellow
On_Blue='\033[44m';        # Blue
On_Purple='\033[45m';      # Purple
On_Cyan='\033[46m';        # Cyan
On_White='\033[47m';       # White

# High Intensity
IBlack='\033[0;90m';       # Black
IRed='\033[0;91m';         # Red
IGreen='\033[0;92m';       # Green
IYellow='\033[0;93m';      # Yellow
IBlue='\033[0;94m';        # Blue
IPurple='\033[0;95m';      # Purple
ICyan='\033[0;96m';        # Cyan
IWhite='\033[0;97m';       # White

# Bold High Intensity
BIBlack='\033[1;90m';      # Black
BIRed='\033[1;91m';        # Red
BIGreen='\033[1;92m';      # Green
BIYellow='\033[1;93m';     # Yellow
BIBlue='\033[1;94m';       # Blue
BIPurple='\033[1;95m';     # Purple
BICyan='\033[1;96m';       # Cyan
BIWhite='\033[1;97m';      # White

# High Intensity backgrounds
On_IBlack='\033[0;100m';   # Black
On_IRed='\033[0;101m';     # Red
On_IGreen='\033[0;102m';   # Green
On_IYellow='\033[0;103m';  # Yellow
On_IBlue='\033[0;104m';    # Blue
On_IPurple='\033[0;105m';  # Purple
On_ICyan='\033[0;106m';    # Cyan
On_IWhite='\033[0;107m';   # White

# =============================

# quick note: echo = output text

echo ${bold}Hi there,;
echo " "My job is to successfully run my website on a local serve on your computer.;
echo " "You will need WiFi for the initial setup, as well as for some parts;
echo " "of the website. If you encounter any errors, just leave them in the issues;
echo " "tab and I will try to fix them ASAP.;
echo " "Thank you.;
echo Please Enjoy!${nonbold};

process1() { # create new function/method
	cd ~/Desktop/Website; # set the current directory to the user's desktop
	echo "${bold}Downloading website repository...${nonbold}";
	curl -LOk "https://github.com/bag3318/English-Project/archive/master.zip"; # download website from repo
	echo "${bold}Done downloading website repository";
	echo "Unzipping .zip file...${nonbold}";
	unzip master.zip -d ~/Desktop/Website; # unzip website .zip file
	echo "${bold}Done unzipping .zip file";
	echo "Removing master.zip file...${nonbold}";
	rm master.zip # remove website.zip file
	echo "${bold}Finished removing master.zip file${nonbold}";
	cd ~/Desktop/Website/English-Project-master; # set the current directory to the website folder
	echo "${bold}Begin installing Ruby Version Manager...${nonbold}";
	\curl -sSL https://get.rvm.io | bash -s stable --ruby # install Ruby Version Manager
	source ~/.rvm/scripts/rvm
	echo "${bold}Finished isntalling Ruby Version Manager"
	echo "Opening new window...${nonbold}"
	open -a Terminal.app ~/Desktop/Website/RUNME_data/2.sh
	exit;
} # end function/method

confirm1() { # create new function/method
	echo "Press ${bold}c${nonbold} to ${underline}continue${nonunderline}, or press ${bold}q${nonbold} to ${underline}quit${nonunderline} the process";
	while read -r -n 1 -s answer; do # enter a loop while reading the users input
		if [[ $answer = [CcQq] ]]; then # if the users input is either C or c, Q or q then...
		    [[ $answer = [Cc] ]] && retval=0; # if the users input is either C or c, Q or q then...
		    [[ $answer = [Qq] ]] && retval=1; # if the the users input it C or c set the retval = 0
		    break; # break on command when done 
		fi # if the users input is Q or q set the retval = 1
	done # end if statement
	return $retval; # return the command: retval's value
} # end function/method



if confirm1; then # if the confirm1 method/process is successful, then...
	process1; # run the process1 function/method
else # otherwise...
	echo "${bold}That\'s too bad, come back again sometime please \:\)${nonbold}";
	exit; # exit the process
fi # end if statement


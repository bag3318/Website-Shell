#!/bin/bash


master_function()  {

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

	echos() {
		echo ${bold}Hey there,;
		echo " "My job is to uninstall the following:;
		echo " "\* rvm;
		echo " "\* User version of Ruby;
		echo " "\* All Ruby Gems including itself;
		echo " "\* xcode command line tools;
		echo " "\* The website project folder \(English-Project-master\);
		echo So basically everything that was installed with the ${underline}SETUP.sh${nonunderline} file${nonbold};
	}
	echos;
	processes() {
		process1() {
			echo "${bold}Uninstalling...${nonbold}";
			rvm implode; # this will uninstall rvm
			# Note you may need to manually remove /etc/rvmrc and ~/.rvmrc if they exist still.
			echo ${bold}Removing leftover folders not removed by RVM...${nonbold};
			rm -r /etc/rvmrc;
			rm -r ~/.rvmrc;
			echo ${bold}Done removing leftover folders${nonbold};
			sudo rm -rf /Library/Developer/CommandLineTools; # this will uninstall xcode command line tools
			/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall)" # unistalls homebrew
			rm -r ~/Desktop/Website-Shell-master/English-Project-master; # this will remove the website project folder
		}
		process2() {
			sudo rm -r /usr/local/bin/; 
			sudo rm -r /usr/local/etc/;
			sudo rm -r /usr/local/git/;
			sudo rm -r /usr/local/include/;
			sudo rm -r /usr/local/lib/;
			sudo rm -r /usr/local/man/;
			sudo rm -r /usr/local/remotedesktop/;
			sudo rm -r /usr/local/sbin/;
			sudo rm -r /usr/local/share/;
			sudo rm -r /usr/local/var/;
			echo "${bold}Done!${nonbold}";
		}
	}
	processes;
	confirmations() {
		confirm1() {
			echo Are you sure you want to uninstall? \(${bold}Y/N${nonbold}\);
			while read -r -n 1 -s answer; do
				if [[ $answer = [YyNn] ]]; then
				    [[ $answer = [Yy] ]] && retval=0;
				    [[ $answer = [Nn] ]] && retval=1;
				    break;
				fi;
			done;
			return $retval;
		}

		confirm2() {
			echo Are you sure you want to remove these folders? \(${bold}Y/N${nonbold}\);
			while read -r -n 1 -s answer; do
				if [[ $answer = [YyNn] ]]; then
				    [[ $answer = [Yy] ]] && retval=0;
				    [[ $answer = [Nn] ]] && retval=1;
				    break;
				fi;
			done;
			return $retval;
		}
	}
	confirmations;
	init_functions() {
		init_function1() {
			if confirm1; then
				process1;
			else
				echo ${bold}Done!;
				echo Bye${nonbold};
				exit;
			fi;
		}	
		init_function2() {
			if confirm2; then
				process2;
			else
				echo ${bold}k${nonbold};
				exit;
			fi;
		}	
		init_function1;
		init_function2;
	}
	init_functions;
}
master_function;

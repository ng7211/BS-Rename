#!/usr/bin/bash
# Shell script that adds given argument to the file name in the current directory. 
# Demy Abdulsalami, Ilja Winkler
# 29.10.2025
 
# Parameterübergabe über $1
ARGUMENT=$1

# Prüfung, ob Parameterübergebn wurde.
if [[  "$ARGUMENT" == ""  ]]
then
	echo "Kein Argument angegeben, bitte geben sie ein Argument an!"
exit 1
fi
# For loop to iterate over every file in the current directory.
for DATEI in *
do

# Check if "DATEI" is a file.
	if [[ -f "$DATEI" ]]
	then
		# extract file name and file ending.
		DATEINAME="${DATEI%.*}"
		DATEIENDUNG="${DATEI##*.}"
			
		# When file name and loop variable are the same the argument given is added to the file name.	
		if [[ "$DATEINAME" == "$DATEI" ]]
		then
			mv $DATEI $DATEINAME$ARGUMENT
		# When file has a file ending argument given will be added to the file name and the file ending will be added to the argument.
		else
			mv $DATEI $DATEINAME$ARGUMENT.$DATEIENDUNG
		fi
	fi
done

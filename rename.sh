#! /usr/bin/bash

# Parameterübergabe über $1
ARGUMENT=$1

# Prüfung, ob Parameterübergebn wurde.
if [[  "$ARGUMENT" == ""  ]]
then
	echo "Kein Argument angegeben, bitte geben sie ein Argument an!"
exit 1
fi
# For-Schleife, um über alle Dateien des aktuellen Verzeichnes zu iterieren.
for DATEI in *
do

# Prüfung ob Datei regulär ist.
	if [[ -f "$DATEI" ]]
	then
		# Dateiname und Dateiendung extrahieren.
		DATEINAME="${DATEI%.*}"
		DATEIENDUNG="${DATEI##*.}"
			
		# Wenn Dateiname und unser Laufvariable gleich sind dann wird das Parameterargument an die Datei gehängt.
		if [[ "$DATEINAME" == "$DATEI" ]]
		then
			mv $DATEI $DATEINAME$ARGUMENT
		# Wenn nicht dann zudem noch Dateiendung hinzufügen.
		else
			mv $DATEI $DATEINAME$ARGUMENT.$DATEIENDUNG
		fi
	fi
done




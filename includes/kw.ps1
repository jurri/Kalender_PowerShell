###############################################################################################
##-- Funktionen zum Berechnen des Kalenderwochentags -- Anfang --##############################
###############################################################################################
$Zeit = Get-Date 																			  #
																							  #
																							  #
Function LZ($N){ 										# Laufzeit							  #
	$X = "" 																				  #
	if ($N -le 9){ 																			  #
		$X = "0" 																			  #
	}  																						  #
	$X + $N 																				  #
}																							  #
																							  #
																							  #
Function DTobjToYWDarray($Zeit){  						# Return array Zeit[Y..W..]			  #
  	$DoWk = +$Zeit.DayofWeek																  #
  	if ($DoWk -eq 0){ 									# Mon=1..Sun=7						  #
  		$DoWk = 7 																			  #
	}																						  #
  	$Tijd = $Zeit.AddDays(4 - $DoWk)					# such den nächsten Donnerstag		  #
  	$Week = 1+[Math]::Floor(($Tijd.DayOfYear-1)/7)    	# Bereinigt den 7ten				  #
  	$Year = $Tijd.Year									# ... muss so sein ?...				  #
  	$Year, $Week, $DoWk 																	  #
} 																							  #
																							  #
																							  #
Function StrKWobj($WNDa){								# Return object Woche				  #
	"$(LZ($WNDa[1]))"																		  #
}																							  #
																							  #
$WNDa = DTobjToYWDarray($Zeit)																  #
$kw = $(StrKWobj($WNDa))																	  #
###############################################################################################
##-- Funktionen zum Berechnen des Kalenderwochentags -- Ende --################################
###############################################################################################
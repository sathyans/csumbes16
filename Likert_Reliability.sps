* Encoding: windows-1252.
*Check Reliability of Likerts.
DISPLAY DICTIONARY.
*Reliability - Importance.
output comment text = "Reliability - Importance".
RELIABILITY /VARIABLES=  P237200_Q4 TO P237200_Q14
/SCALE('Reliability Coefficient') ALL /MODEL=ALPHA.
*Reliability - Satisfaction.
output comment text = "Reliability - Satisfaction".
RELIABILITY /VARIABLES=  P237200_Q15 TO P237200_Q25 P237200_Q27 TO P237200_Q51
/SCALE('Reliability Coefficient') ALL /MODEL=ALPHA.
RELIABILITY /VARIABLES=  P237200_Q52 TO P237200_Q66
/SCALE('Reliability Coefficient') ALL /MODEL=ALPHA.
*Reliability - Agreement.
output comment text = "Reliability - Agreement".
RELIABILITY /VARIABLES=  P237200_Q67 TO P237200_Q77 P237200_Q90 TO P237200_Q94
/SCALE('Reliability Coefficient') ALL /MODEL=ALPHA.
*Reliability - Often.
output comment text = "Reliability - Often".
RELIABILITY /VARIABLES=  P237200_Q78 TO P237200_Q88
/SCALE('Reliability Coefficient') ALL /MODEL=ALPHA.


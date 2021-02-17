# :computer: Serverautomatisering-HF2

:pencil: Af Jacob, Mark & Mads (JMM.LOCAL)

## Indhold:
* [Del-12 // Disable Powershell GPO](#del-12--disable-powershell-gpo)
* [Del-13 // Hjælpefunktioner](#del-13--hjælpefunktioner)
* [Del-14 // Alias](#del-14)
* [Del-15 // Ændre server navne og IP](#del-15)
* [Del-16 // Øget sikkerhed](#del-16)
* [Del-17 // Scripts](#del-17)
* [Del-18 // OU](#del-18)
* [Del-19 // Automatisering](#del-19)
* [Del-20 // Whatif](#del-20)
* [Del-21 // Windows Recycle Bin](#del-21)
* [Del-22 // Fjern og tilføj server fra domæne](#del-22)
* [Del-23 // ?](#del-23)
* [Del-24 // ?](#del-24)

<!-------------------------------------------------------------------- DEL-12 -------------------------------------------------------------------------------------->
## [Del-12 // Disable Powershell GPO](#computer-Serverautomatisering-HF2)
Opret en ny GPO og gå til følgende:
```
User Configuration > Administrative Templates > System > Don’t run specified Windows applications
```
Click på "Show..." og skriv powershell.exe
<br/>
![gpo-disable-powershell](images/gpo-disable-powershell.png)
<br/>
Vores "Disable Powershell" GPO gælder alle Authenticated Users
![powershell-disabled](images/powershell-disabled.png)

## [Del-13 // Hjælpefunktioner](#computer-Serverautomatisering-HF2)
En cmdlet - udtalt "command-let" er en lille, let kommando, der bruges i Windows PowerShell-miljøet. En cmdlet findes typisk som et lille script, der er beregnet til at udføre en enkelt specifik funktion, såsom coping filer og skift af mapper. En cmdlet og dens relevante parametre kan indtastes i en PowerShell-kommandolinje til øjeblikkelig udførelse eller inkluderes som en del af et længere PowerShell-script, der kan udføres som ønsket.
<br/>
<br/>
Opretter ny computer med New-ADComputer
```
PS C:\Users\Administrator> New-ADComputer
cmdlet New-ADComputer at command pipeline position 1
Supply values for the following parameters:
Name: PC1
```
Herunder kan man se den nyoprettede computer
<br/>
![opretter-ny-computer-med-ps](images/opretter-ny-computer-med-ps.png)
<br/>
Opretter ny bruger med New-ADUser
```
PS C:\Users\Administrator> New-ADUser
cmdlet New-ADUser at command pipeline position 1
Supply values for the following parameters:
Name: Bruger1
```
Herunder kan man se den nyoprettede bruger
<br/>
![opretter-ny-bruger-med-ps](images/opretter-ny-bruger-med-ps.png)
<br/>
Opretter my OU med New-ADOrganizationalUnit
```
PS C:\Users\Administrator> New-ADOrganizationalUnit
cmdlet New-ADOrganizationalUnit at command pipeline position 1
Supply values for the following parameters:
Name: OU1
```
Herunder kan man se den nyoprettede OU
<br/>
![opretter-ny-ou-med-ps](images/opretter-ny-ou-med-ps.png)
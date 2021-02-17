# :computer: Serverautomatisering-HF2

:pencil: Af Jacob, Mark & Mads (JMM.LOCAL)

## Indhold:
* [Del-12 // Disable Powershell GPO](#del-12--disable-powershell-gpo)
* [Del-13 // Hjælpefunktioner](#del-13--hjælpefunktioner)
* [Del-14 // Alias](#del-14--Alias)
* [Del-15 // Ændre server navn og ip-adresse](#del-15--ændre-server-navn-og-ip-adresse)
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

<!-------------------------------------------------------------------- DEL-13 -------------------------------------------------------------------------------------->
## [Del-13 // Hjælpefunktioner](#computer-Serverautomatisering-HF2)
En cmdlet - udtalt "command-let" er en lille, let kommando, der bruges i Windows PowerShell-miljøet. En cmdlet findes typisk som et lille script, der er beregnet til at udføre en enkelt specifik funktion, såsom coping filer og skift af mapper. En cmdlet og dens relevante parametre kan indtastes i en PowerShell-kommandolinje til øjeblikkelig udførelse eller inkluderes som en del af et længere PowerShell-script, der kan udføres som ønsket.
<br/>
<br/>
Opretter ny computer med New-ADComputer
```
PS C:\>  New-ADComputer
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
PS C:\> New-ADUser
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
PS C:\> New-ADOrganizationalUnit
cmdlet New-ADOrganizationalUnit at command pipeline position 1
Supply values for the following parameters:
Name: OU1
```
Herunder kan man se den nyoprettede OU
<br/>
![opretter-ny-ou-med-ps](images/opretter-ny-ou-med-ps.png)

<!-------------------------------------------------------------------- DEL-14 -------------------------------------------------------------------------------------->
## [Del-14 // Alias](#computer-Serverautomatisering-HF2)
Et PowerShell-alias er et andet navn, der er tildelt en cmdlet. PowerShell-cmdletnavne kan være besværlig at skrive og bruge. For at minimere indtastning og for at gøre det lettere for brugere der er vant til andre shells som f.eks. CMD eller Unix-shells, understøtter Windows PowerShell begrebet et alias. Simpelthen alias er et alternativt navn til en cmdlet.
<br/>
<br/>
Skriv følgende for en liste af indbyggede Alias
```
PS C:\> Get-Alias
```
Exporterer ovestående liste til [Alias.txt](Alias.txt)
```
PS C:\> Get-Alias | Out-File -FilePath .\Desktop\Alias.txt
```
Opretter egne Alias
```
PS C:\Users\Administrator> Set-Alias
cmdlet Set-Alias at command pipeline position 1
Supply values for the following parameters:
Name: loc
Value: Get-Location
```
Kan nu se min nuværende lokation ved bare at skrive "loc" istedet for Get-Location
```
PS C:\Users\Administrator> loc

Path                  
----                  
C:\Users\Administrator
```
Alias der åbner notepad.exe, notepad kan efterfølgende åbnes ved bare at skrive "np"
```
PS C:\> Set-Alias -Name np -Value C:\Windows\notepad.exe

PS C:\> Get-Alias -Name np

CommandType     Name                                               Version    Source
-----------     ----                                               -------    ------                     
Alias           np -> notepad.exe
```

<!-------------------------------------------------------------------- DEL-15 -------------------------------------------------------------------------------------->
## [Del-14 // Ændre server navne og ip-adresse](#computer-Serverautomatisering-HF2)
```
PS C:\> Set-NetIPAddress -InterfaceIndex 15 -IPAddress 192.168.10.22 -PrefixLength 24
```
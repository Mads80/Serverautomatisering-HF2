# :computer: Serverautomatisering-HF2

:pencil: Af Jacob, Mark & Mads (JMM.LOCAL)

## Indhold:
* [Del-12 // Disable Powershell GPO](#del-12--disable-powershell-gpo)
* [Del-13 // Hjælpefunktioner](#del-13--hjælpefunktioner)
* [Del-14 // Alias](#del-14--Alias)
* [Del-15 // Ændre server navn og ip-adresse](#del-15--ændre-server-navn-og-ip-adresse)
* [Del-16 // Øget sikkerhed](#del-16--øget-sikkerhed)
* [Del-17 // Mappe scripts](#del-17--mappe-script)
* [Del-18 // OU](#del-18)
* [Del-19 // Automatisering](#del-19)
* [Del-20 // Whatif](#del-20)
* [Del-21 // Windows Recycle Bin](#del-21)
* [Del-22 // Fjern og tilføj server fra domæne](#del-22)
* [Del-23 // ?](#del-23)
* [Del-24 // ?](#del-24)

<!-------------------------------------------------------------------- DEL-12 -------------------------------------------------------------------------------------->
## [Del-12 // Disable Powershell GPO](#computer-Serverautomatisering-HF2)
Opretter en ny GPO og går til følgende:
```powershell
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
```powershell
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
```powershell
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
```powershell
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
```powershell
PS C:\> Get-Alias
```
Exporterer ovestående liste til [Alias.txt](Alias.txt)
```powershell
PS C:\> Get-Alias | Out-File -FilePath .\Desktop\Alias.txt
```
Opretter egne Alias
```powershell
PS C:\Users\Administrator> Set-Alias
cmdlet Set-Alias at command pipeline position 1
Supply values for the following parameters:
Name: loc
Value: Get-Location
```
Kan nu se min nuværende lokation ved bare at skrive "loc" istedet for Get-Location
```powershell
PS C:\Users\Administrator> loc

Path                  
----                  
C:\Users\Administrator
```
Alias der åbner notepad.exe, notepad kan efterfølgende åbnes ved bare at skrive "np"
```powershell
PS C:\> Set-Alias -Name np -Value C:\Windows\notepad.exe

PS C:\> Get-Alias -Name np

CommandType     Name                                               Version    Source
-----------     ----                                               -------    ------                     
Alias           np -> notepad.exe
```

<!-------------------------------------------------------------------- DEL-15 -------------------------------------------------------------------------------------->
## [Del-15 // Ændre server navn og ip-adresse](#computer-Serverautomatisering-HF2)
Ændrer ip-adresse på Server2 og Server3
```powershell
PS C:\> Get-NetAdapter

Name                      InterfaceDescription                    ifIndex Status       MacAddress             LinkSpeed
----                      --------------------                    ------- ------       ----------             ---------
Ethernet0                 Intel(R) 82574L Gigabit Network Conn...      15 Up           00-0C-29-8F-4B-92         1 Gbps
PS C:\> New-NetIPAddress -InterfaceIndex 15 -IPAddress 192.168.10.22 -PrefixLength 24

PS C:\> Get-NetAdapter

Name                      InterfaceDescription                    ifIndex Status       MacAddress             LinkSpeed
----                      --------------------                    ------- ------       ----------             ---------
Ethernet0                 Intel(R) 82574L Gigabit Network Conn...      14 Up           00-0C-29-69-48-FC         1 Gbps
PS C:\> New-NetIPAddress -InterfaceIndex 14 -IPAddress 192.168.10.33 -PrefixLength 24
```
Kan nu efterfølgende pinge fra Server1 til de nye ip-adresser
<br/>
![ping-fra-server1-til-nye-iper](images/ping-fra-server1-til-nye-iper.png)
<br/>
Omdøber Server2 til Server002 (Gentag dette for Server3 også)
```powershell
PS C:\> hostname
Server2

PS C:\> Rename-Computer -NewName "Server002"
WARNING: The changes will take effect after you restart the computer Server2.
```
Efter en genstart er det nye navn trådt i kraft
<br/>
![nyt-navn-server2-til-server002](images/nyt-navn-server2-til-server002.png)


<!-------------------------------------------------------------------- DEL-16 -------------------------------------------------------------------------------------->
## [Del-16 // Øget sikkerhed](#computer-Serverautomatisering-HF2)
Opretter en liste over kørende services, sorteret alfabetisk og gemmer den som [service.txt](Service.txt)
```powershell
PS C:\> Get-Service | Sort-Object name | Out-File .\Service.txt
```

<!-------------------------------------------------------------------- DEL-17 -------------------------------------------------------------------------------------->
## [Del-17 // Mappe script](#computer-Serverautomatisering-HF2)
Følgende [script](Oprette-mapper.ps1) opretter 3 mapper der hver især har 3 undermapper
```powershell
new-item -type directory -path C:\Byer\Odense\Salg -Force
new-item -type directory -path C:\Byer\Odense\Marketing -Force
new-item -type directory -path C:\Byer\Odense\Produktion -Force

new-item -type directory -path C:\Byer\Vejle\Salg -Force
new-item -type directory -path C:\Byer\Vejle\Marketing -Force
new-item -type directory -path C:\Byer\Vejle\Produktion -Force

new-item -type directory -path C:\Byer\Svenborg\Salg -Force
new-item -type directory -path C:\Byer\Svenborg\Marketing -Force
new-item -type directory -path C:\Byer\Svenborg\Produktion -Force
```
![opretter-mapper](images/opretter-mapper.png)

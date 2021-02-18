$Users = Import-Csv -Delimiter "," -Path "C:\Scripts\Ansatte.csv"        
foreach ($User in $Users)
{               
    $UserFirstname = $User.FirstName       
    $UserLastname = $User.LastName
    $UserMail = $user.Mail
    $UserPassword = $User.Password
    $UserDescription = $User.Description
    $UserOffice = $user.Office
    New-ADUser -Name "$UserFirstname" -Office "$UserOffice" -DisplayName "$UserFirstname" -EmailAddress "$UserMail" -GivenName "$UserFirstname" -Surname "$UserLastname" -Description "$UserDescription" -AccountPassword (ConvertTo-SecureString $UserPassword -AsPlainText -Force) -Enabled $true -ChangePasswordAtLogon $true -server jmm.local
    
    echo ("Brugeren "+ $UserFirstname +" er blevet tilføjet til AD.")      
}
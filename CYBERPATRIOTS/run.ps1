$input1 = Read-Host -Prompt 'Do you want to change the local security policy. True or false'
if($input1)
{
# Set the password history length to 5 passwords
Set-LocalUser -Name User -PasswordHistoryLength 5

# Set the maximum password age for users to 90 days
Set-LocalUser -Name User -MaxPasswordAge 90

# Set the maximum password age for administrators to 30 days
Set-LocalUser -Name Administrator -MaxPasswordAge 30

# Set the minimum password age for users and administrators to 10 days
Set-LocalUser -Name User -MinPasswordAge 10
Set-LocalUser -Name Administrator -MinPasswordAge 10

# Set the minimum password length for users and administrators to 8 characters
Set-LocalUser -Name User -MinPasswordLength 8
Set-LocalUser -Name Administrator -MinPasswordLength 8

# Enable password complexity requirements for users and administrators
Set-LocalUser -Name User -PasswordComplexityEnabled $true
Set-LocalUser -Name Administrator -PasswordComplexityEnabled $true
}
$input1 = Read-Host -Prompt 'What is the URL of the README'
$w = Invoke-WebRequest -Uri $input1 -UseBasicParsing
$w.AllElements Where-Object tagname -EQ "P"
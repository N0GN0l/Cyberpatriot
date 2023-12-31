start-process powershell -verb runas
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled True


$input1 = Read-Host -Prompt 'Do you want to change the local security policy. True or false'
if($input1)
{
    Function Parse-SecPol($CfgFile){ 
    secedit /export /cfg "$CfgFile" | out-null
    $obj = New-Object psobject
    $index = 0
    $contents = Get-Content $CfgFile -raw
    [regex]::Matches($contents,"(?<=\[)(.*)(?=\])") | %{
        $title = $_
        [regex]::Matches($contents,"(?<=\]).*?((?=\[)|(\Z))", [System.Text.RegularExpressions.RegexOptions]::Singleline)[$index] | %{
            $section = new-object psobject
            $_.value -split "\r\n" | ?{$_.length -gt 0} | %{
                $value = [regex]::Match($_,"(?<=\=).*").value
                $name = [regex]::Match($_,".*(?=\=)").value
                $section | add-member -MemberType NoteProperty -Name $name.tostring().trim() -Value $value.tostring().trim() -ErrorAction SilentlyContinue | out-null
            }
            $obj | Add-Member -MemberType NoteProperty -Name $title -Value $section
        }
        $index += 1
    }
    return $obj
}

    Function Set-SecPol($Object, $CfgFile){
       $SecPool.psobject.Properties.GetEnumerator() | %{
            "[$($_.Name)]"
           $_.Value | %{
                $_.psobject.Properties.GetEnumerator() | %{
                    "$($_.Name)=$($_.Value)"
                }
            }
        } | out-file $CfgFile -ErrorAction Stop
        secedit /configure /db c:\windows\security\local.sdb /cfg "$CfgFile" /areas SECURITYPOLICY
    }


    $SecPool = Parse-SecPol -CfgFile C:CYBERPATRIOTS\Test.cfg
    $SecPool.'System Access'.PasswordComplexity = 1
    $SecPool.'System Access'.MinimumPasswordAge = 15
    $SecPool.'System Access'.MinimumPasswordLength = 8
    $SecPool.'System Access'.MaximumPasswordAge = 60

    Set-SecPol -Object $SecPool -CfgFile C:CYBERPATRIOTS\Test.cfg


}
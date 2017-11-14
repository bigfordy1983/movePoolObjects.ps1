        <#
    .Synopsis
    This Script is designed to Move Contact objects between one pool and another, making DR pool failovers more manageable.

    .Parameters

    -Pool1: Mandatory, this is the user whose settings you are mirroring FROM
    -Pool2: Mandatory, this is the user whose settings you are mirroring TO

    .Example

   PS C:\> .\MovePoolObjects.ps1 -Pool1 "pool1.contoso.com" -Pool2 "pool2.contoso.com" -Location "contoso"

    
    #>
    
    param (

    [String]$Pool1,
    [String]$Pool2,
    [String]$Location

    ) 
    
    $Userpath = "c:\temp\"+$location+"users.csv"
    $CAPpath = "c:\temp\"+$location+"CAP.csv"
    $UMpath = "c:\temp\"+$location+"UM.csv"
    $MRpath = "c:\temp\"+$location+"MR.csv"
    


Get-CsUser -Filter{RegistrarPool -eq $Pool1} | Select-Object * | Export-Csv -Path $Userpath -NoTypeInformation
Get-CsCommonAreaPhone -Filter{RegistrarPool -eq $Pool1} | Select-Object * | Export-Csv -Path $CAPpath -NoTypeInformation
Get-CsExUmContact -Filter{RegistrarPool -eq $Pool1} | Select-Object * | Export-Csv -Path $UMpath -NoTypeInformation
Get-CsMeetingRoom  -Filter{RegistrarPool -eq $Pool1} | Select-Object * | Export-Csv -Path $MRpath -NoTypeInformation
Get-CsUser -Filter{RegistrarPool -eq $Pool1} | Move-CsUser -Target $Pool2
Get-CsCommonAreaPhone -Filter{RegistrarPool -eq $Pool1} | Move-CsCommonAreaPhone -Target $Pool2
Get-CsExUmContact -Filter{RegistrarPool -eq $Pool1} | Move-CsExUmContact -Target $Pool2
Get-CsMeetingRoom -Filter{RegistrarPool -eq $Pool1} | Move-CsMeetingRoom -Target $Pool2

 <#
    .Synopsis
    This Script is designed to Move Contact objects between one pool and another, making DR pool failovers more manageable.
    
    .Parameters
    -Pool1: Mandatory, this is the user whose settings you are mirroring FROM
    -Pool2: Mandatory, this is the user whose settings you are mirroring TO
    
    .Example
    PS C:\> .\MovePoolObjects.ps1 -Pool1 "pool1.contoso.com" -Pool2 "pool2.contoso.com" -Location "contoso"
    
    #>

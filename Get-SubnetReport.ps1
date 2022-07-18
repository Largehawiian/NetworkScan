#
function Get-SubnetReport {
    param (
        [CmdletBinding()]
        [Parameter(Mandatory = $True,
            ParameterSetName = "Scan")]
        [Parameter(ParameterSetName = "PortScan")]
        [String]$Subnet,
        [Parameter(Mandatory = $True,
            Position = 0,
            ParameterSetName = "Scan")]
        [Parameter(ParameterSetName = "PortScan")]
        [String]$FirstHost,
        [Parameter(Mandatory = $True,
            Position = 1,
            ParameterSetName = "Scan")]
        [Parameter(ParameterSetName = "PortScan")]
        [String]$LastHost,
        [Parameter(Mandatory = $True,
            ParameterSetName = "PortScan")]
        [string]$Port
    )
    if ($Port) {
        $Script:Scan = Invoke-SubnetScan -Subnet $Subnet -FirstHost $FirstHost -LastHost $LastHost | Invoke-PortScan -Port $Port
        [portscan]::ScanReport($Script:Scan) | Format-Table
    }
    if (!$Port) {
        $Script:Scan = Invoke-SubnetScan -Subnet $Subnet -FirstHost $FirstHost -LastHost $LastHost
        [portscan]::PingReport($Script:Scan) | Sort-Object "Remote Address" -Descending | Format-Table
    }

}

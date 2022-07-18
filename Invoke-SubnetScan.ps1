function Invoke-SubnetScan {
    param (
        [switch]$ResolveDNS,
        [Parameter(Mandatory=$True)]
        [ValidateNotNullOrEmpty()]
        [String]$Subnet,
        [Parameter(Mandatory=$True)]
        [ValidateNotNullOrEmpty()]
        [String]$FirstHost,
        [Parameter(Mandatory=$True)]
        [ValidateNotNullOrEmpty()]
        [String]$LastHost
    )
    $Script:Hosts = Foreach ($i in $FirstHost..$LastHost){
        $Subnet.trim(".") + "." + $i
    }
    if (!$ResolveDNS){
        Invoke-FastPing -HostName $Script:Hosts | Where-Object {$Null -ne $_.RoundtripAverage}
    }
    if ($ResolveDNS){
        Write-Output -Message "DNS Server To Use?" -
        $DNSServer = Read-Host
        $Scan = Invoke-FastPing -HostName $Script:Hosts | Where-Object {$Null -ne $_.RoundtripAverage}
        $Results = foreach ($i in $Scan){
            [PSCustomObject]@{
                ComputerName = (Resolve-DNSName $i.ComputerName -Server $DNSServer -ErrorAction SilentlyContinue).NameHost
                IPAddress = $i.ComputerName
                RoundTripAverage = $i.RoundtripAverage
                Online = $i.Online
            }
        }
        return $Results
    }

}
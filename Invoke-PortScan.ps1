function Invoke-PortScan {
    param (
        [Parameter(Mandatory=$True)]
        [ValidateNotNullOrEmpty()]
        [String]$Port,
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
    
    foreach ($i in $Script:Hosts){
        Test-NetConnection -RemoteAddress $i -Port $Port
    }
}

function Invoke-PortScan {
    param (
        [Parameter(ParameterSetName = "Pipeline",
            ValueFromPipelineByPropertyName,
            Mandatory = $True)]
        [String]$ComputerName,
        [Parameter(Mandatory = $True)]
        [String]$Port
    )
    begin {

    }
    process {
        Test-NetConnection -RemoteAddress $ComputerName -Port $Port | ForEach-Object {
            [portscan]::new($_.RemoteAddress, $_.RemotePort, $_.InterfaceAlias, $_.SourceAddress, $_.TcpTestCuceeded)
        }
    
    }

}

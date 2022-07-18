class portscan {
    [string]$RemoteAddress
    [string]$RemotePort
    [string]$InterfaceAlias
    [string]$SourceAddress
    [bool]$TcpTestCuceeded
    hidden[portscan[]]$Results

    portscan () {}

    portscan ($RemoteAddress, $RemotePort, $InterfaceAlias, $SourceAddress, $TcpTestCuceeded) {
        $this.RemoteAddress = $RemoteAddress
        $this.RemotePort = $RemotePort
        $this.InterfaceAlias = $InterfaceAlias
        $this.SourceAddress = $SourceAddress.tostring()
        $this.TcpTestCuceeded = $TcpTestCuceeded
    }

    static [array[]]ScanReport ($results) {
        $Report = $results | Select-Object @{L = "Remote Address"; E = { $_.RemoteAddress } },
        @{L = "Remote Port"; E = { $_.RemotePort } },
        @{L = "Interface Alitas"; E = { $_.InterfaceAlias } },
        @{L = "Source Address"; E = { $_.SourceAddress } },
        @{L = "TCP Test Succeeded"; E = { $_.TcpTestCuceeded } }
        return $Report
    }

    static [array[]]PingReport ($Results){
        $Report = $Results | Select-Object @{L = "Remote Address"; E = { $_.ComputerName}},
        @{L = "Round Trip Average"; E = {$_.RoundTripAverage}},
        @{L = "Online"; E={$_.Online}}
        return $Report
    }

}
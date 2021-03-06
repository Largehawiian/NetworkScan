## Synopsis

Collection of tools to scan networks for online hosts and port availability.

## Installation

### Prerequisites

* Windows PowerShell 5.1 or greater, or
* [PowerShell Core](https://github.com/PowerShell/PowerShell)

### Installing FastPing via PowerShell Gallery

```powershell
Install-Module -Name 'NetworkScan' -Scope 'CurrentUser'
```

## Quick Start

### Invoke-SubnetScan

```powershell
# Output a report of hosts pinged in the specified subnet
Get-SubnetReport -Subnet "192.168.1." -FirstHost 1 -LastHost 254

#Output a report of hosts alive in the specified subnet of which were tested on the specified TCP port
Get-SubnetReport -Subnet "192.168.1." -FirstHost 1 -LastHost 254 -Port 22

# Ping all hosts in 192.168.1.0/24
Invoke-SubnetScan -Subnet "192.168.1." -FirstHost 1 -LastHost 254

# Ping all hosts in 192.168.1.0/24 with reverse DNS resolution.
Invoke-SubnetScan -Subnet "192.168.1." -FirstHost 1 -LastHost 254 -ResolveDNS

# Scan Subnet for port 22 availability 
Invoke-SubnetScan -Subnet "192.168.1." -FirstHost 1 -LastHost 254 | Invoke-PortScan -Port 22 

```

## Author

[Jeremy Jackson]

## Contributors

[Andrew Pearce](https://twitter.com/austoonz) - Author of Invoke-FastPing
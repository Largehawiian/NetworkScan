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
# Ping all hosts in 192.168.1.0/24
Invoke-SubnetScan -Subnet "192.168.1." -FirstHost 1 -LastHost 254

# Ping all hosts in 192.168.1.0/24 with reverse DNS resolution.
Invoke-SubnetScan -Subnet "192.168.1." -FirstHost 1 -LastHost 254 -ResolveDNS

# Scan Subnet for port 22 availability 
Invoke-PortScan -Subnet "192.168.1." -FirstHost 1 - LastHost 254 -Port 22 

```

### Invoke-PingSweep

```powershell
# Ping a range of IP Addresses using the function name
Invoke-PingSweep -StartIP '1.1.1.1' -EndIP '1.1.1.5'

# Ping a range of IP Addresses using the psweep alias
psweep -StartIP '1.1.1.1' -EndIP '1.1.1.5'

# Ping a range of IP Addresses using the psweep alias and subnet calculations
psweep -IPAddress '1.1.1.1' -SubnetMask '255.255.255.252'
```

## Author

[Jeremy Jackson]

## Contributors

[Andrew Pearce](https://twitter.com/austoonz) - Author of Invoke-FastPing
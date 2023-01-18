
#Purpose: automate VM shutdown for hyper-v host patching


#Create paramater and seed with hyper-v hostname
[cmdletbinding()]
Param($vmhost = '<server hostname>')
#create varaiable that checks for running VMs
$runningVM = Get-VM -ComputerName $vmhost| where state -eq 'running'

# Execute loop to shutdown running VMs
foreach ($cn in $runningVM) {
Stop-VM $cn.name -asjob
}
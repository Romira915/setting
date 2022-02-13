Set-Location (Split-Path $script:myInvocation.MyCommand.path -parent)
wsl --install

$path = Resolve-Path .\wsl2_for_windows11_after_reboot.ps1
$commnd = 'powershell -ExecutionPolicy Unrestricted -File ' + $path
New-ItemProperty -LiteralPath 'HKCU:Software\Microsoft\Windows\CurrentVersion\RunOnce' -Name 'wsl2_for_windows11_after_reboot' -PropertyType 'String' -Value $commnd -force

pause
Restart-Computer
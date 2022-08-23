@echo off
setlocal enableextensions
cd /d "%~dp0"
set "DepStore=VCLibs64.Appx,VCLibs86.Appx,Framework64.Appx,Framework86.Appx,Runtime64.Appx,Runtime86.Appx"
set "DepPurchase=VCLibs64.Appx,VCLibs86.Appx,Framework64.Appx,Framework86.Appx,Runtime64.Appx,Runtime86.Appx"
set "DepXbox=VCLibs64.Appx,VCLibs86.Appx,Framework64.Appx,Framework86.Appx,Runtime64.Appx,Runtime86.Appx"
set "DepInstaller=VCLibs64.Appx,VCLibs86.Appx"
PowerShell Add-AppxProvisionedPackage -Online -PackagePath Store.AppxBundle -DependencyPackagePath %DepStore% -LicensePath Store.xml
PowerShell Add-AppxPackage -Path Store.AppxBundle
PowerShell Add-AppxProvisionedPackage -Online -PackagePath PurchaseApp.AppxBundle -DependencyPackagePath %DepPurchase% -LicensePath PurchaseApp.xml
PowerShell Add-AppxPackage -Path PurchaseApp.AppxBundle
PowerShell Add-AppxProvisionedPackage -Online -PackagePath AppInstaller.AppxBundle -DependencyPackagePath %DepInstaller% -LicensePath AppInstaller.xml
PowerShell Add-AppxPackage -Path AppInstaller.AppxBundle
PowerShell Add-AppxProvisionedPackage -Online -PackagePath XboxIdentity.AppxBundle -DependencyPackagePath %DepXbox% -LicensePath XboxIdentity.xml
PowerShell Add-AppxPackage -Path XboxIdentity.AppxBundle
cls
exit /b
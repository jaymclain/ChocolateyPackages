$ErrorActionPreference = 'Stop';

$packageName= 'azuredocumentdbemulator'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://aka.ms/documentdb-emulator'
$url64      = ''

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = $url
  url64bit      = $url64

  silentArgs    = "/qn /norestart /l*v `"$env:TEMP\chocolatey\$($packageName)\$($packageName).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)

  softwareName  = 'DocumentDB Emulator'
  checksum      = ''
  checksumType  = 'md5'
  checksum64    = ''
  checksumType64= 'md5'
}

if(! (test-path "${Env:ProgramFiles}\DocumentDB Emulator\DocumentDB.Emulator.exe")){
  Install-ChocolateyPackage @packageArgs
}

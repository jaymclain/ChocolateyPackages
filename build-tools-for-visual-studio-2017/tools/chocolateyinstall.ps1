$ErrorActionPreference = 'Stop';

$packageName = 'build-tools-for-visual-studio-2017'
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url         = 'https://download.microsoft.com/download/C/3/7/C37763CB-E533-4290-BE34-1DF89C218CFE/vs_BuildTools.exe'
$url64       = ''

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url
  url64bit      = $url64

  silentArgs    = "--quiet --norestart"
  validExitCodes= @(0, 3010, 1641)

  softwareName  = 'Build Tools for Visual Studio 2017'
  checksum      = ''
  checksumType  = 'md5'
  checksum64    = ''
  checksumType64= 'md5'
}

if (!(test-path "${Env:ProgramFiles(x86)}\Microsoft Visual Studio\2017\BuildTools\MSBuild\15.0\Bin\MSBuild.exe")) {
	Install-ChocolateyPackage @packageArgs
}

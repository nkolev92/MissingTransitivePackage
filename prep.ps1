Write-Host "Running restore to prime the Local Source." -ForegroundColor "green"
dotnet restore /p:RestorePackagesPath="LocalSource" /p:RestoreSources="https://api.nuget.org/v3/index.json"
Write-Host "Printing the nupkgs of local source." -ForegroundColor "green"
Get-ChildItem .\LocalSource\ -Filter "*.nupkg" -Recurse | ForEach-Object FullName
Write-Host "Note that System.Security.Cryptography.Pkcs 4.7.0 is in the local sources. We will now delete it." -ForegroundColor "green"
Remove-Item -R .\LocalSource\system.security.cryptography.pkcs\ -Force
Write-Host "Printing the nupkgs of local source again. Note System.Security.Cryptography.Pkcs is gone." -ForegroundColor "green"
Get-ChildItem .\LocalSource\ -Filter "*.nupkg" -Recurse | ForEach-Object FullName
Write-Host "The repro has been prepped. Feel free to validate the NuGet.Config and the content of the local folder manually. After you are done, run `dotnet restore` from the root of the repo." -ForegroundColor "green"


# README

This is a repo that is a repro per the customer feedback in <https://developercommunity.visualstudio.com/t/dotnet-restore-cannot-find-existing-pack/1689457>.

The project has 1 dependency to `<PackageReference Include="System.Security.Cryptography.Xml" Version="4.7.0" />`.

Per the instructions, we setup a local feed where a transitive package of `System.Security.Cryptography.Xml`, in particular `System.Security.Cryptography.Pkcs` is deleted.

To do this setup run `prep.ps1`. Feel free to inspect the setup after the prep.ps1 script has been run.

After that's done, run `dotnet restore` from the root of the repo.
You would get something like:

> C:\Code\Temp\MissingTransitivePackage\MissingTransitivePackage.csproj : error NU1101: Unable to find package System.Security.Cryptography.Pkcs. No packages exist with this id in source(s): local-source

## Steps

- .\prep.ps1
- dotnet restore

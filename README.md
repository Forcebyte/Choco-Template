# Chocolatey Quick Start Installer
Simple script that auto-installs programs using Chocolatey along with a bunch of other programs that someone who's just installed Windows might need

### Changing the Choco List

In order to change the list that Chocolatey fetches from, you'll need to edit the Package list from the main switch, i.e.
```
2  {$PackageList = @('x' ,'PACKAGE')}
```

You'll also want to specify the list package selection list similar to below
```
Switch ($UserChoice){
 ...
}
``` 


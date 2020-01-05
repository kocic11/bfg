$reponame = $args[0]
if ($null -eq $reponame) {
    $reponame = read-host -Prompt "Please enter a repo name" 
}
git clone --mirror "https://github.com/kocic11/$reponame"
C:\Users\AKOCIC\Software\AdoptOpenJDK\jdk-11.0.5.10-hotspot\bin\java.exe -jar C:\Users\AKOCIC\Software\bfg\bfg-1.13.0.jar --replace-text .\passwords.txt $reponame
Set-Location .\$reponame\
git reflog expire --expire=now --all
git gc --prune=now --aggressive
git push
Set-Location ..
Remove-Item .\$reponame\ -Recurse -Force -ErrorAction Ignore
Remove-Item .\$reponame.bfg-report\ -Recurse -Force -ErrorAction Ignore
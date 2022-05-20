(65..90) + (97..122) | Get-Random -Count 5 | % {[char]$_}  | Set-Content -Encoding utf8 ./data.txt


git add ./data.txt
git commit -m "off the local mac"

git pull
git push origin main    
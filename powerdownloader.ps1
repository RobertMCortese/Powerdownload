mkdir C:\games\tgcd
$WebResponse = Invoke-WebRequest "https://myrient.erista.me/files/Redump/NEC%20-%20PC%20Engine%20CD%20&%20TurboGrafx%20CD/"
$Results = $WebResponse.links.href | select-string -pattern ".zip"  -AllMatches  
$results | where-object {$_.line -notlike "*zip/"} | 
ForEach-Object -parallel {
$file = $_.line ; 
$filenouri = [uri]::UnescapeDataString($file.ToString());
write-host "Grabbing $filenouri" ; 
Invoke-WebRequest  "https://myrient.erista.me/files/Redump/NEC%20-%20PC%20Engine%20CD%20&%20TurboGrafx%20CD/$file" -OutFile "C:\games\tgcd\$filenouri"
}

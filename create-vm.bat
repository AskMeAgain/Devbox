@ECHO OFF

set firstPart=.\packer_cache\outputs\manjaro-i3\

set PACKER_LOG=1

echo.
echo --------------- Installing packer 
if NOT EXIST packer.exe (
    echo --------------- downloading packer.zip 
    powershell -Command "(New-Object Net.WebClient).DownloadFile('https://releases.hashicorp.com/packer/1.8.4/packer_1.8.4_windows_amd64.zip', 'packer.zip')"
    echo --------------- unzipping file 
    powershell -Command "Expand-Archive packer.zip -DestinationPath .
    echo --------------- removing zip file
    del packer.zip
    echo --------------- packer is ready 
) ELSE (
    echo --------------- packer already downloaded 
)

echo --------------- finding vm name from settings file 
for /f "tokens=2 delims=:" %%a in ('type settings.json^|find """vmname"": "') do (
  set dateid=%%a & goto :continue
)
:continue

set vmname=%dateid:~2,-2%

echo --------------- vm name is %vmname%
echo --------------- creating shared folder
if NOT EXIST ./shared-folders/%vmname%-shared\ (
    mkdir "./shared-folders/%vmname%-shared"
)

echo --------------- Building base i3 ovf 
if NOT EXIST %firstPart%%vmname%-temp1.ovf (
    .\packer.exe build -force -var-file="settings.json" manjaro-i3\manjaro-i3.json || @RD /S /Q %firstPart% && exit 1
) else (
    echo ---------------- base i3 ovf already exists
)

timeout /T 2 >NUL

pause

echo --------------- adding additions 
.\packer.exe build -force -var-file="settings.json" manjaro-i3\manjaro-i3-additions.json

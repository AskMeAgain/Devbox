@ECHO OFF

REM set PACKER_LOG=1

echo.
echo --- Installing packer ---
if NOT EXIST packer.exe (
    echo --- downloading packer.zip ---
    powershell -Command "(New-Object Net.WebClient).DownloadFile('https://releases.hashicorp.com/packer/1.8.4/packer_1.8.4_windows_amd64.zip', 'packer.zip')"
    echo --- unzipping file ---
    powershell -Command "Expand-Archive packer.zip -DestinationPath .
    echo --- removing zip file ---
    del packer.zip
    echo --- packer is ready ---
) ELSE (
    echo --- packer already downloaded ---
)

echo --- extracting all the json settings ---
for /f "tokens=1,2 delims=:{}, " %%A in (settings.json) do (
    set "%%~A=%%~B"
)

echo --- vm name is %vmname% ---
echo --- creating shared folder ---
if NOT EXIST ./shared-folders/%vmname%-shared\ (
    mkdir "./shared-folders/%vmname%-shared"
)

echo --- Building base ovf image ---
if NOT EXIST .\packer_cache\outputs\os\%vmname%-temp1.ovf (
    .\packer.exe build -debug -force -var-file="settings.json" "provisioning-os/%type%/installation.json" || @RD /S /Q .\packer_cache\outputs\os && exit 1
) else (
    echo --- base ovf already exists ---
)

timeout /T 2 >NUL

echo --------------- applying user configs
.\packer.exe build -debug -force -var-file="settings.json" provisioning-packages/package-provisioning.json

pause
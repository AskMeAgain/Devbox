set firstPart=.\output-virtualbox-iso\

for /f "tokens=2 delims=:" %%a in ('type settings.json^|find """baseimage"": "') do (
  set dateid=%%a & goto :continue
)
:continue

if NOT EXIST %firstPart%%dateid:~2,-2%.ovf (
    packer build -force -var-file="settings.json" manjaro-i3.json
)

timeout /T 1
packer build -var-file="settings.json" -force manjaro-i3-additions.json
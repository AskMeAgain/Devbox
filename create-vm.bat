set firstPart=.\output-i3\
set secondPart=.\output-updated\
set thirdPart=.\output-additions\

for /f "tokens=2 delims=:" %%a in ('type settings.json^|find """vmname"": "') do (
  set dateid=%%a & goto :continue
)
:continue

echo "--------------- Building base i3 ovf ---------------"
if NOT EXIST %firstPart%%dateid:~2,-2%-i3.ovf (
    @REM packer build -force -var-file="settings.json" manjaro-i3.json
)

timeout /T 1

echo "--------------- building up to date ovf ---------------"
if NOT EXIST %secondPart%%dateid:~2,-2%-updated.ovf (
    @REM packer build -force -var-file="settings.json" manjaro-i3-updated.json
)

timeout /T 1

echo "--------------- adding additions ---------------"
if NOT EXIST %thirdPart%%dateid:~2,-2%-additions.ovf (
    packer build -force -var-file="settings.json" manjaro-i3-additions.json
)
packer build -var-file="settings.json" -force manjaro-i3.json 
timeout /T 10
packer build -var-file="settings.json" -force manjaro-i3-additions.json 
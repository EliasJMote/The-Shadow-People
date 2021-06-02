cd "F:\C Drive Backup\Users\Elias\Desktop\Game Development\The Shadow People"
Compress-Archive -Path Font,"Helper Functions","Images","Music","SFX",conf.lua,main.lua -DestinationPath The_Shadow_People.zip
Rename-Item The_Shadow_People.zip The_Shadow_People.love
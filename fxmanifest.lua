fx_version 'adamant'
game 'gta5'

client_scripts {
    "configAC.lua",
    "client/*.lua"
}

server_scripts {
    "@mysql-async/lib/MySQL.lua",
    "configAC.lua",
    "configACS.lua",
    "server/*.lua"
}
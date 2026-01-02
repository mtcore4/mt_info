fx_version 'cerulean'
game 'gta5'

description 'mt_info - Open-source vRP HUD'
author 'MT Scripts'
version '1.0.0'

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/style.css',
    'html/script.js'
}

server_scripts {
    'version.lua',
    'server.lua'
}

client_script 'client.lua'

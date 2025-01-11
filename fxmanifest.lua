fx_version 'cerulean'
game 'gta5'
author 'Cadburry'
description 'Previewer'
version '1.0'

client_scripts {
    'module/client.lua',
    'config/client.lua',
}

server_scripts {
    'module/server.lua',
    'config/server.lua',
}

ui_page 'web/index.html'

files {
    'web/index.html',
    'web/**/*',
}

dependencies {
    '/onesync',
    '/native:0xA61C8FC6'
}

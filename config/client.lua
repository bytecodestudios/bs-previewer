Message = {
    visible = true,
    align = "top-middle",
    messages = { "[F5] vMenu", "[F6] Noclip", "[H] Showcase Menu" }
}

List = {
    cadcarry = {
        title = "Carry People Put In Trunk/Seat",
        description =
        "This is really awesome resource where you can carry people and put them in trunk or in nearby seat.",
        purchase = "https://cadburry.tebex.io/package/5700480",
        action = function()
            SpawnVehicle(`sultan`)
            ChatMessage('Carry a player and try putting inside trunk/seat using /carry or with target')
        end
    },
    cadplayerlist = {
        title = "Playerlist / Scoreboard",
        description = "Check list of players playing in server with their identifiers or names.",
        purchase = "https://cadburry.tebex.io/package/6098256",
        action = function()
            ChatMessage('Press [U] to try playerlist/scoreboard')
        end
    },
    cadnotepad = {
        title = "Notepad",
        description =
        "This is a notepad on which you can write anything and also share the note slip to others, you can also sign notepad by clicking the sign here text.",
        purchase = "https://cadburry.tebex.io/package/6266862",
        action = function()
            TriggerServerEvent("previewer:provideItems", "cadnotepad")
        end
    },
    cadpayments = {
        title = "Payments with Snappy Phone",
        description =
        "This script handles the payment requests for various businesses, jobs, card payments fee, tax, etc.",
        purchase = "https://cadburry.tebex.io/package/6488662",
        action = function()
            TriggerServerEvent("previewer:provideItems", "cadpayments")
        end
    },
    cadidentity = {
        title = "Identity",
        description =
        "Identification script to show your true identity to the people around you with some incredible designs and types.",
        purchase = "https://cadburry.tebex.io/package/6439920",
        action = function()
            TriggerServerEvent("previewer:provideItems", "cadidentity")
        end
    },
    snappyshadowmarket = {
        title = "Shadowmarket / Blackmarket",
        description = "Player run market, ablity to put items from your inventory for sale.",
        purchase = "https://snappy.tebex.io/package/6295138",
        action = function()
            SetCoords(vec4(996.37, 3576.01, 34.61, 229.74))
            ChatMessage('Target on the person and buy a tablet and explore')
        end
    },
    snappymulticharacter = {
        title = "Multicharacter & Spawn",
        description = "Multicharacter, Identity creator, Spawn selector.",
        purchase = "https://snappy.tebex.io/package/6315765",
        action = function()
            TriggerServerEvent("previewer:logout")
        end
    },
    snappyphone = {
        title = "Phone",
        description =
        "Phone, Messages, Camera, Settings, Calculator, Buzz, Services, Party, Garage, Bank, Store, Crypto, Ads, Property, Darkchat.",
        location = vec3(-58.0, -2520.0, 7.0),
        purchase = "https://snappy.tebex.io/package/6281000",
        action = function()
            TriggerServerEvent("previewer:provideItems", "snappyphone")
        end
    },
    snappylaptop = {
        title = "Laptop",
        description = "Party, Racing, Shadowmarket.",
        purchase = "https://snappy.tebex.io",
        action = function()
            TriggerServerEvent("previewer:provideItems", "snappylaptop")
        end
    },
    tigvapidstainer = {
        title = "Police Vapid Stainer",
        description = "",
        purchase = "https://exclusive-wheels.tebex.io/package/6451602",
        action = function()
            SpawnVehicle(`polstainer`)
        end
    },

    tigvapidscout = {
        title = "Police Vapid Scout",
        description = "",
        purchase = "https://exclusive-wheels.tebex.io/package/6464359",
        action = function()
            SpawnVehicle(`polscout`)
        end
    },

    tigocelotjugular = {
        title = "Police Ocelot Jugular",
        description = "",
        purchase = "https://exclusive-wheels.tebex.io/package/6501340",
        action = function()
            SpawnVehicle(`poljugular`)
        end
    },
    tigalbanyvstr = {
        title = "Police Albany V-STR",
        description = "",
        purchase = "https://exclusive-wheels.tebex.io/package/6495687",
        action = function()
            SpawnVehicle(`polvstr`)
        end
    },
    tigcanisterminus = {
        title = "Police Canis Terminus",
        description = "",
        purchase = "https://exclusive-wheels.tebex.io/package/6131822",
        action = function()
            SpawnVehicle(`polterminus`)
        end
    },
    tigbuffalos = {
        title = "Police Buffalo S",
        description = "",
        purchase = "https://exclusive-wheels.tebex.io/package/6131815",
        action = function()
            SpawnVehicle(`polbuffalos`)
        end
    },
    tigbuffalo4 = {
        title = "Police Buffalo STX",
        description = "",
        purchase = "https://exclusive-wheels.tebex.io/package/6131805",
        action = function()
            SpawnVehicle(`polbuffalo4`)
        end
    },
    tigkomoda = {
        title = "Police Komoda",
        description = "",
        purchase = "https://exclusive-wheels.tebex.io/package/6475089",
        action = function()
            SpawnVehicle(`polkomoda`)
        end
    },
    tigaleutian = {
        title = "Police Aleutian",
        description = "",
        purchase = "https://exclusive-wheels.tebex.io/package/6506017",
        action = function()
            SpawnVehicle(`polaleutian`)
        end
    },
    tigtorrence = {
        title = "Police Vapid Torrence",
        description = "",
        purchase = "https://exclusive-wheels.tebex.io/package/6507288",
        action = function()
            SpawnVehicle(`poltor`)
        end
    },
}

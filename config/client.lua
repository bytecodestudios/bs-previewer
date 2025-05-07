Message = {
    visible = true,
    align = "top-middle",
    messages = { "[F5] vMenu", "[F6] Noclip", "[H] Showcase Menu",  "[J] Job Menu" }
}

Categories = { "Kartik Scripts", "Cadburry Scripts", "Snappy Scripts", "Exclusive Wheels", "UT MODZ" }

List = {
    cadcarry = {
        title = "Carry People Put In Trunk/Seat",
        description =
        "This is really awesome resource where you can carry people and put them in trunk or in nearby seat.",
        category = "Cadburry Scripts",
        purchase = "https://cadburry.tebex.io/package/5700480",
        action = function()
            SpawnVehicle(`sultan`)
            ChatMessage('Carry a player and try putting inside trunk/seat using /carry or with target')
        end
    },
    cadplayerlist = {
        title = "Playerlist / Scoreboard",
        description = "Check list of players playing in server with their identifiers or names.",
        category = "Cadburry Scripts",
        purchase = "https://cadburry.tebex.io/package/6098256",
        action = function()
            ChatMessage('Press [U] to try playerlist/scoreboard')
        end
    },
    cadnotepad = {
        title = "Notepad",
        description =
        "This is a notepad on which you can write anything and also share the note slip to others, you can also sign notepad by clicking the sign here text.",
        category = "Cadburry Scripts",
        purchase = "https://cadburry.tebex.io/package/6266862",
        action = function()
            TriggerServerEvent("previewer:provideItems", "cadnotepad")
        end
    },
    cadpayments = {
        title = "Payments with Snappy Phone",
        description =
        "This script handles the payment requests for various businesses, jobs, card payments fee, tax, etc.",
        category = "Cadburry Scripts",
        purchase = "https://cadburry.tebex.io/package/6488662",
        action = function()
            TriggerServerEvent("previewer:provideItems", "cadpayments")
        end
    },
    cadidentity = {
        title = "Identity",
        description =
        "Identification script to show your true identity to the people around you with some incredible designs and types.",
        category = "Cadburry Scripts",
        purchase = "https://cadburry.tebex.io/package/6439920",
        action = function()
            TriggerServerEvent("previewer:provideItems", "cadidentity")
        end
    },
    -- snappyshadowmarket = {
    --     title = "Shadowmarket / Blackmarket",
    --     description = "Player run market, ablity to put items from your inventory for sale.",
    --     category = "Snappy Scripts",
    --     purchase = "https://snappy.tebex.io/package/6295138",
    --     action = function()
    --         SetCoords(vec4(996.37, 3576.01, 34.61, 229.74))
    --         ChatMessage('Target on the person and buy a tablet and explore')
    --     end
    -- },
    snappymulticharacter = {
        title = "Multicharacter & Spawn",
        description = "Multicharacter, Identity creator, Spawn selector.",
        category = "Snappy Scripts",
        purchase = "https://snappy.tebex.io/package/6315765",
        action = function()
            TriggerServerEvent("previewer:logout")
        end
    },
    snappyphone = {
        title = "Phone",
        description =
        "Phone, Messages, Camera, Settings, Calculator, Buzz, Services, Party, Garage, Bank, Store, Crypto, Ads, Property, Darkchat.",
        category = "Snappy Scripts",
        location = vec3(-58.0, -2520.0, 7.0),
        purchase = "https://snappy.tebex.io/package/6281000",
        action = function()
            TriggerServerEvent("previewer:provideItems", "snappyphone")
        end
    },
    snappyracing = {
        title = "Racing",
        description = "Addon APP for Phone & Laptop.",
        category = "Snappy Scripts",
        purchase = "https://snappy.tebex.io/package/6284648",
        action = function()
            TriggerServerEvent("previewer:provideItems", "snappyracing")
        end
    },
    snappylaptop = {
        title = "Laptop",
        description = "Party, Racing, Shadowmarket.",
        category = "Snappy Scripts",
        location = vec4(996.37, 3576.01, 34.61, 229.74),
        purchase = "https://snappy.tebex.io/package/6526782",
        action = function()
            TriggerServerEvent("previewer:provideItems", "snappylaptop")
        end
    },
    kartikmdt = {
        title = "MDT & Dispatch",
        description = "MDT with dispatch (Police, EMS, etc). Press J button for job selector",
        category = "Kartik Scripts",
        purchase = "https://kartik-scripts.tebex.io/package/6652876",
        action = function()
            TriggerServerEvent("previewer:provideItems", "kartikmdt")
            TriggerServerEvent("previewer:addJob", "police", 3)
            Wait(4000)
            TriggerServerEvent("previewer:addJob", "ambulance", 3)
            Wait(5000)
            TriggerServerEvent("previewer:addJob", "lawyer", 0)
        end
    },
    tigvapidstainer = {
        title = "Police Vapid Stainer",
        description = "",
        category = "Exclusive Wheels",
        purchase = "https://exclusive-wheels.tebex.io/package/6451602",
        action = function()
            SpawnVehicle(`expolstainer`)
        end
    },
    tigvapidscout = {
        title = "Police Vapid Scout",
        description = "",
        category = "Exclusive Wheels",
        purchase = "https://exclusive-wheels.tebex.io/package/6464359",
        action = function()
            SpawnVehicle(`expolscout`)
        end
    },
    tigocelotjugular = {
        title = "Police Ocelot Jugular",
        description = "",
        category = "Exclusive Wheels",
        purchase = "https://exclusive-wheels.tebex.io/package/6501340",
        action = function()
            SpawnVehicle(`expoljugular`)
        end
    },
    tigalbanyvstr = {
        title = "Police Albany V-STR",
        description = "",
        category = "Exclusive Wheels",
        purchase = "https://exclusive-wheels.tebex.io/package/6495687",
        action = function()
            SpawnVehicle(`expolvstr`)
        end
    },
    tigcanisterminus = {
        title = "Police Canis Terminus",
        description = "",
        category = "Exclusive Wheels",
        purchase = "https://exclusive-wheels.tebex.io/package/6131822",
        action = function()
            SpawnVehicle(`expolterminus`)
        end
    },
    tigbuffalos = {
        title = "Police Buffalo S",
        description = "",
        category = "Exclusive Wheels",
        purchase = "https://exclusive-wheels.tebex.io/package/6131815",
        action = function()
            SpawnVehicle(`expolbuffalos`)
        end
    },
    tigbuffalo4 = {
        title = "Police Buffalo STX",
        description = "",
        category = "Exclusive Wheels",
        purchase = "https://exclusive-wheels.tebex.io/package/6131805",
        action = function()
            SpawnVehicle(`expolbuff4`)
        end
    },
    tigkomoda = {
        title = "Police Komoda",
        description = "",
        category = "Exclusive Wheels",
        purchase = "https://exclusive-wheels.tebex.io/package/6475089",
        action = function()
            SpawnVehicle(`expolkomoda`)
        end
    },
    tigaleutian = {
        title = "Police Aleutian",
        description = "",
        category = "Exclusive Wheels",
        purchase = "https://exclusive-wheels.tebex.io/package/6506017",
        action = function()
            SpawnVehicle(`expolaleutian`)
        end
    },
    tigtorrence = {
        title = "Police Vapid Torrence",
        description = "",
        category = "Exclusive Wheels",
        purchase = "https://exclusive-wheels.tebex.io/package/6507288",
        action = function()
            SpawnVehicle(`expoltor`)
        end
    },
    tigomnisegt = {
        title = "Police Omnis E-GT",
        description = "",
        category = "Exclusive Wheels",
        purchase = "https://exclusive-wheels.tebex.io/package/6585799",
        action = function()
            SpawnVehicle(`expolomnisegt`)
        end
    },
    tiggranger = {
        title = "Police Granger 3600",
        description = "",
        category = "Exclusive Wheels",
        purchase = "https://exclusive-wheels.tebex.io/package/6620669",
        action = function()
            SpawnVehicle(`expolgranger`)
        end
    },
    tigcara = {
        title = "Police Caracara",
        description = "",
        category = "Exclusive Wheels",
        purchase = "https://exclusive-wheels.tebex.io/package/6620679",
        action = function()
            SpawnVehicle(`expolcara`)
        end
    },
    tigshinobi = {
        title = "Police Shinobi",
        description = "",
        category = "Exclusive Wheels",
        purchase = "https://exclusive-wheels.tebex.io/package/6595624",
        action = function()
            SpawnVehicle(`polshinobi`)
        end
    },
    tigregent = {
        title = "Police Brute Regent",
        description = "",
        category = "Exclusive Wheels",
        purchase = "https://exclusive-wheels.tebex.io/package/6652525",
        action = function()
            SpawnVehicle(`expolregent`)
        end
    },
    tigdom = {
        title = "Police Dominator GT",
        description = "",
        category = "Exclusive Wheels",
        purchase = "https://exclusive-wheels.tebex.io/package/6596945",
        action = function()
            SpawnVehicle(`expoldom`)
        end
    },
    tigvigero = {
        title = "Police Vigero Zx",
        description = "",
        category = "Exclusive Wheels",
        purchase = "https://exclusive-wheels.tebex.io/package/6596945",
        action = function()
            SpawnVehicle(`expolvigero`)
        end
    },
    tigschlagen = {
        title = "Police Schlagen GT",
        description = "",
        category = "Exclusive Wheels",
        purchase = "https://exclusive-wheels.tebex.io/package/6596945",
        action = function()
            SpawnVehicle(`expolschgt`)
        end
    },
    tiggauntlet4 = {
        title = "Police Bravado Gauntlet",
        description = "",
        category = "Exclusive Wheels",
        purchase = "https://exclusive-wheels.tebex.io/package/6585785",
        action = function()
            SpawnVehicle(`expolgauntlet`)
        end
    },
    tigr300 = {
        title = "Police Annis 300R",
        description = "",
        category = "Exclusive Wheels",
        purchase = "https://exclusive-wheels.tebex.io/package/6595681",
        action = function()
            SpawnVehicle(`expolr300`)
        end
    },
    tigbanshee = {
        title = "Police Banshee GTS",
        description = "",
        category = "Exclusive Wheels",
        purchase = "https://exclusive-wheels.tebex.io/package/6585776",
        action = function()
            SpawnVehicle(`expolbanshee`)
        end
    },
    tigcypher = {
        title = "Police Ubermatch Cypher",
        description = "",
        category = "Exclusive Wheels",
        purchase = "https://exclusive-wheels.tebex.io/package/6617021",
        action = function()
            SpawnVehicle(`expolcypher`)
        end
    },
    tigvectre = {
        title = "Police Vectre",
        description = "",
        category = "Exclusive Wheels",
        purchase = "https://exclusive-wheels.tebex.io/package/6706776",
        action = function()
            SpawnVehicle(`expolvectre`)
        end
    },
    tigcoqd6 = {
        title = "Police Coquette D6",
        description = "",
        category = "Exclusive Wheels",
        purchase = "https://exclusive-wheels.tebex.io/package/6679641",
        action = function()
            SpawnVehicle(`expolcoqd6`)
        end
    },
    tigdorado = {
        title = "Police Bravado Dorado",
        description = "",
        category = "Exclusive Wheels",
        purchase = "https://exclusive-wheels.tebex.io/package/6706668",
        action = function()
            SpawnVehicle(`expoldorado`)
        end
    },
    tigimpaler = {
        title = "Police Impaler",
        description = "",
        category = "Exclusive Wheels",
        purchase = "https://exclusive-wheels.tebex.io/package/6719581",
        action = function()
            SpawnVehicle(`expolimpaler`)
        end
    },
    tigcavalcade = {
        title = "Police Cavalcade XL",
        description = "",
        category = "Exclusive Wheels",
        purchase = "https://exclusive-wheels.tebex.io/package/6735427",
        action = function()
            SpawnVehicle(`expolcavalcade`)
        end
    },
    tigtailgater = {
        title = "Police Obey Tailgater",
        description = "",
        category = "Exclusive Wheels",
        purchase = "https://exclusive-wheels.tebex.io/package/6703899",
        action = function()
            SpawnVehicle(`expoltailgater`)
        end
    },
    tigchavos = {
        title = "Police Chavos V6",
        description = "",
        category = "Exclusive Wheels",
        purchase = "https://exclusive-wheels.tebex.io/package/6672351",
        action = function()
            SpawnVehicle(`expolchavos`)
        end
    },
    tigemsaleutian = {
        title = "EMS Vapid Aleutian",
        description = "",
        category = "Exclusive Wheels",
        purchase = "https://exclusive-wheels.tebex.io/package/6674197",
        action = function()
            SpawnVehicle(`emsaleutian`)
        end
    },
    tigemsbuffalo4 = {
        title = "EMS Buffalo STX",
        description = "",
        category = "Exclusive Wheels",
        purchase = "https://exclusive-wheels.tebex.io/package/6674198",
        action = function()
            SpawnVehicle(`emsbuffalo4`)
        end
    },
    tigemsbuffalos = {
        title = "EMS Buffalo-S",
        description = "",
        category = "Exclusive Wheels",
        purchase = "https://exclusive-wheels.tebex.io/package/6674201",
        action = function()
            SpawnVehicle(`emsbuffalos`)
        end
    },
    tigemsomnisegt = {
        title = "EMS Omnis EGT",
        description = "",
        category = "Exclusive Wheels",
        purchase = "https://exclusive-wheels.tebex.io/package/6674203",
        action = function()
            SpawnVehicle(`emsomnisegt`)
        end
    },
    tigemscara = {
        title = "EMS Vapid Caracara",
        description = "",
        category = "Exclusive Wheels",
        purchase = "https://exclusive-wheels.tebex.io/package/6674206",
        action = function()
            SpawnVehicle(`emscara`)
        end
    },
    tigemsgranger = {
        title = "EMS Granger Xl",
        description = "",
        category = "Exclusive Wheels",
        purchase = "https://exclusive-wheels.tebex.io/package/6674205",
        action = function()
            SpawnVehicle(`emsgranger`)
        end
    },
    tigemstorrence = {
        title = "EMS Vapid Torrence",
        description = "",
        category = "Exclusive Wheels",
        purchase = "https://exclusive-wheels.tebex.io/package/6674208",
        action = function()
            SpawnVehicle(`emstor`)
        end
    },
}

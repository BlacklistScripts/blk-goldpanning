return {
    GoldpanItem = 'gold_pan',

    Loot = {
        ['gold_flakes'] = {
            probability = 60,
            amount = { min = 10, max = 20}
        },
        ['goldnugget'] = {
            probability = 50,
            amount = { min = 10, max = 20}
        },
        ['goldnugget_large'] = {
            probability = 20,
            amount = { min = 10, max = 20}
        }
    },

    Blips = {
        {
            coords = vec3(-1855.1204, 1362.0991, 189.2848),
            sprite = 618,
            color = 46,
            label = 'Gold Panning'
        },
        {
            coords = vec3(-1635.5516, 1650.7812, 133.8741),
            sprite = 618,
            color = 46,
            label = 'Gold Panning'
        },
    },

    Zones = {
        ['zone1'] = {
            points = {
                vec(-1551.7896, 1695.8638, 150),
                vec(-1540.7710, 1634.1923, 150),
                vec(-1669.2273, 1618.5288, 150),
                vec(-1771.7068, 1697.4771, 150),
            },
            thickness = 100
        },
        ['zone2'] = {
            points = {
                vec(-1635.1663, 1349.4164, 210),
                vec(-2230.7549, 1396.2333, 210),
                vec(-2245.8857, 1286.7716, 210),
                vec(-1654.8871, 1304.2089, 210),
            },
            thickness = 170
        }
    }
}
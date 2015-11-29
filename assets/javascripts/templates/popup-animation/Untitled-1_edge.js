/*jslint */
/*global AdobeEdge: false, window: false, document: false, console:false, alert: false */
(function (compId) {

    "use strict";
    var im='images/',
        aud='media/',
        vid='media/',
        js='js/',
        fonts = {
        },
        opts = {
            'gAudioPreloadPreference': 'auto',
            'gVideoPreloadPreference': 'auto'
        },
        resources = [
        ],
        scripts = [
        ],
        symbols = {
            "stage": {
                version: "6.0.0",
                minimumCompatibleVersion: "5.0.0",
                build: "6.0.0.400",
                scaleToFit: "none",
                centerStage: "none",
                resizeInstances: false,
                content: {
                    dom: [
                        {
                            id: 'Chef01_Vector2',
                            type: 'image',
                            rect: ['-587px', '0', '2916px', '400px', 'auto', 'auto'],
                            fill: ["rgba(0,0,0,0)",im+"Chef01_Vector2.jpg",'-587px','0px']
                        },
                        {
                            id: 'hideLarme',
                            type: 'image',
                            rect: ['370px', '188px', '13px', '12px', 'auto', 'auto'],
                            fill: ["rgba(0,0,0,0)",im+"hideLarme.png",'0px','0px']
                        },
                        {
                            id: 'larme',
                            display: 'block',
                            type: 'image',
                            rect: ['373px', '227px', '7px', '9px', 'auto', 'auto'],
                            opacity: '0',
                            fill: ["rgba(0,0,0,0)",im+"larme.png",'0px','0px']
                        },
                        {
                            id: 'larmeCopy',
                            display: 'block',
                            type: 'image',
                            rect: ['373px', '227px', '7px', '9px', 'auto', 'auto'],
                            opacity: '0',
                            fill: ["rgba(0,0,0,0)",im+"larme.png",'0px','0px']
                        },
                        {
                            id: 'larmeCopy2',
                            display: 'block',
                            type: 'image',
                            rect: ['373px', '227px', '7px', '9px', 'auto', 'auto'],
                            opacity: '0',
                            fill: ["rgba(0,0,0,0)",im+"larme.png",'0px','0px']
                        }
                    ],
                    style: {
                        '${Stage}': {
                            isStage: true,
                            rect: [undefined, undefined, '547px', '398px'],
                            overflow: 'hidden',
                            fill: ["rgba(255,255,255,1)"]
                        }
                    }
                },
                timeline: {
                    duration: 3348.6731061489,
                    autoPlay: true,
                    labels: {
                        "loop": 0
                    },
                    data: [
                        [
                            "eid22",
                            "opacity",
                            0,
                            0,
                            "linear",
                            "${larme}",
                            '0',
                            '0'
                        ],
                        [
                            "eid23",
                            "opacity",
                            455,
                            0,
                            "linear",
                            "${larme}",
                            '0',
                            '0.017094017094017'
                        ],
                        [
                            "eid35",
                            "opacity",
                            500,
                            800,
                            "linear",
                            "${larme}",
                            '1',
                            '0.92307692307692'
                        ],
                        [
                            "eid36",
                            "opacity",
                            1300,
                            100,
                            "linear",
                            "${larme}",
                            '0.9230769872665405',
                            '0'
                        ],
                        [
                            "eid33",
                            "left",
                            1855,
                            0,
                            "linear",
                            "${larmeCopy}",
                            '373px',
                            '373px'
                        ],
                        [
                            "eid29",
                            "top",
                            955,
                            900,
                            "linear",
                            "${larmeCopy}",
                            '186px',
                            '227px'
                        ],
                        [
                            "eid27",
                            "left",
                            1400,
                            0,
                            "linear",
                            "${larme}",
                            '373px',
                            '373px'
                        ],
                        [
                            "eid50",
                            "left",
                            355,
                            0,
                            "linear",
                            "${Chef01_Vector2}",
                            '-587px',
                            '-587px'
                        ],
                        [
                            "eid45",
                            "display",
                            910,
                            0,
                            "linear",
                            "${larmeCopy2}",
                            'block',
                            'block'
                        ],
                        [
                            "eid30",
                            "opacity",
                            455,
                            0,
                            "linear",
                            "${larmeCopy}",
                            '0',
                            '0'
                        ],
                        [
                            "eid31",
                            "opacity",
                            910,
                            0,
                            "linear",
                            "${larmeCopy}",
                            '0',
                            '0.017094017094017'
                        ],
                        [
                            "eid37",
                            "opacity",
                            955,
                            785,
                            "linear",
                            "${larmeCopy}",
                            '1',
                            '0.93162393162393'
                        ],
                        [
                            "eid38",
                            "opacity",
                            1740,
                            115,
                            "linear",
                            "${larmeCopy}",
                            '0.9316239953041077',
                            '0'
                        ],
                        [
                            "eid39",
                            "top",
                            1410,
                            900,
                            "linear",
                            "${larmeCopy2}",
                            '186px',
                            '227px'
                        ],
                        [
                            "eid34",
                            "display",
                            455,
                            0,
                            "linear",
                            "${larmeCopy}",
                            'block',
                            'block'
                        ],
                        [
                            "eid40",
                            "opacity",
                            910,
                            0,
                            "linear",
                            "${larmeCopy2}",
                            '0',
                            '0'
                        ],
                        [
                            "eid41",
                            "opacity",
                            1365,
                            0,
                            "linear",
                            "${larmeCopy2}",
                            '0',
                            '0.017094017094017'
                        ],
                        [
                            "eid42",
                            "opacity",
                            1410,
                            785,
                            "linear",
                            "${larmeCopy2}",
                            '1',
                            '0.93162393162393'
                        ],
                        [
                            "eid43",
                            "opacity",
                            2195,
                            115,
                            "linear",
                            "${larmeCopy2}",
                            '0.9316239953041077',
                            '0'
                        ],
                        [
                            "eid5",
                            "background-position",
                            0,
                            0,
                            "linear",
                            "${Chef01_Vector2}",
                            [0,0],
                            [0,0],
                            {valueTemplate: '@@0@@px @@1@@px'}
                        ],
                        [
                            "eid18",
                            "background-position",
                            200,
                            0,
                            "linear",
                            "${Chef01_Vector2}",
                            [0,0],
                            [-587,0],
                            {valueTemplate: '@@0@@px @@1@@px'}
                        ],
                        [
                            "eid19",
                            "background-position",
                            355,
                            0,
                            "linear",
                            "${Chef01_Vector2}",
                            [-590,0],
                            [-1175,0],
                            {valueTemplate: '@@0@@px @@1@@px'}
                        ],
                        [
                            "eid20",
                            "background-position",
                            500,
                            0,
                            "linear",
                            "${Chef01_Vector2}",
                            [-1175,0],
                            [-1762,0],
                            {valueTemplate: '@@0@@px @@1@@px'}
                        ],
                        [
                            "eid47",
                            "background-position",
                            2440,
                            0,
                            "linear",
                            "${Chef01_Vector2}",
                            [-1762,0],
                            [-1175,0],
                            {valueTemplate: '@@0@@px @@1@@px'}
                        ],
                        [
                            "eid48",
                            "background-position",
                            2555,
                            0,
                            "linear",
                            "${Chef01_Vector2}",
                            [-1175,0],
                            [-588,0],
                            {valueTemplate: '@@0@@px @@1@@px'}
                        ],
                        [
                            "eid49",
                            "background-position",
                            2700,
                            0,
                            "linear",
                            "${Chef01_Vector2}",
                            [-588,0],
                            [0,0],
                            {valueTemplate: '@@0@@px @@1@@px'}
                        ],
                        [
                            "eid21",
                            "display",
                            0,
                            0,
                            "linear",
                            "${larme}",
                            'block',
                            'block'
                        ],
                        [
                            "eid44",
                            "left",
                            2310,
                            0,
                            "linear",
                            "${larmeCopy2}",
                            '373px',
                            '373px'
                        ],
                        [
                            "eid28",
                            "top",
                            500,
                            900,
                            "linear",
                            "${larme}",
                            '186px',
                            '227px'
                        ]
                    ]
                }
            }
        };

    AdobeEdge.registerCompositionDefn(compId, symbols, fonts, scripts, resources, opts);

    if (!window.edge_authoring_mode) AdobeEdge.getComposition(compId).load("Untitled-1_edgeActions.js");
})("EDGE-70268760");

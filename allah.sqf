

_allah = _this select 0;                                                        //selecciona el vehiculo
waituntil {count crew _grini > 0};                                              //espera que el vehiculo tenga tripulante
_allah addAction [
                    "<t color='#FF0000'>allah es grande</t>",                   //title
                    {
                      _vh = _this select 0;
                      _c4 = createvehicle [
                                          "SatchelCharge_Remote_Ammo_Scripted", //objeto
                                          [0,0,0],                              //POSICION
                                          [],                                   //MARKER
                                          0,                                    //RADIO
                                          "none"                                //STRING EZPEZIAL
                                          ];

                      _c4 attachto [_vh, [0,1.82,-0.39]];                       // define el vehiculo siendo el vehiculo del que llama el addaction
                      _vh addeventhandler ["dammaged",                          // agrega eventhandler
                      {
                      _Bomber =   _this select 0;                               //define el vehiculo
                      _posB   =   position _bomber;                             //saca la posicion del vehiculo
                      _nmy    =   _bomber findNearestEnemy _posB;               //busca enemigos
                      _tgt    =   position _nmy;                                //saca la posicion del enemigo
                      _dis    =   _tgt distance2d _posb;                        //mide la distancia entre enmeigos
                        if ( _dis < 10 || damage _bomber > 0.025 ) then {       //EXPLOTA
                          _c4 = createvehicle [
                                              "helicopterexplosmall",           //OBJETO
                                              [0,0,0],                          //POSICION
                                              [],                               //MARKER
                                              0,                                //RADIO
                                              "none"                            //STRING EZPEZIAL
                                              ];
                          _c4 attachto [ _bomber, [0,3,-1.2] ];                 //le pega la explosion al vehiculo
                          (driver _bomber) removeeventhandler ["dammaged",0];   //le saca el eventhandler
                        };
                      }];
                    },
                    nil,                                                        //nill
                    6,                                                          //priority
                    true,                                                       //showWindow
                    true,                                                       //hide on use
                    "",                                                         //shortcut
                    "true",                                                     //condicion
                    1,                                                          //radio
                    false,
                    "",
                    ""
                  ];
//by tarta

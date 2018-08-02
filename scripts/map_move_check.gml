/// map_move_check( direction )

iceLevel+=0.25;
var _drill = itemDrill && !(level>=990)

//Bail on Boundaries
if ( argument0 == -1 && xx = 0 ) {
    return 0;
    }

if ( argument0 == 1 && xx = mapSX-1 ) {
    return 0;
    }

audio_play_sound( sfxMove, 2, 0 );
    
//Up/Skip
if ( argument0 == 3 ) {
    //Hit Enemy
    if (ceil(  map_get( xx, yy-1 ) ) == 20 ){
        map_set( xx, yy-1, 0 );
        pY = -3;
        money++;
        audio_play_sound( sfxEnemy, 2, 0 );
        } else
    //Move Up (jets)
    if (!( ceil(  map_get( xx, yy-1 ) ) == 1 ) && !( floor(  map_get( xx, yy-1 ) ) == 2 )  && jetOn) {
        
        map_up();
        jetFill = 0;
            
        floating = 1;
        } else
    //idle
    if ( ceil( map_get( xx, yy+1 ) ) == 1 ) {
        air+=(pressure+1);
        } else {
        air+=(pressure);
        }
    pY = -3;
    }
    
//Left Check
if ( argument0 == -1 ) {
    
    //Hit Enemy
    if (ceil(  map_get( xx-1, yy ) ) == 20 ){
        map_set( xx-1, yy, 0 );
        pX = -3;
        money++;
        audio_play_sound( sfxEnemy, 2, 0 );
        } else
    if !(ceil(  map_get( xx-1, yy ) ) == 1 && !(floor( map_get(xx-1, yy) ) == 2 ) ) {
        
        xx--;
        if (floating == 0) && ( ceil( map_get(xx, yy+1) ) != 1 && floor( map_get(xx, yy+1) ) != 2 ) {
            map_update();
            }
            
        floating = max( 0, floating - 1);
        } else
    if ( floor( map_get( xx-1, yy ) ) == 2 ) {
        pY = 3;
        //NOTE: play bump sound
        }
    else {
        pX = -3;
        map_set( xx-1, yy, map_get( xx-1, yy ) - (0.5+(0.5*_drill)) );
        
        //possibly spawn bubbles
        if (map_get( xx-1, yy) == 0  && irandom(100)>=99) {
            map_set( xx-1, yy, 3);
            }
        
        floating = 1;
        audio_play_sound( sfxSmack, 2, 0 );
        }
    } else
    
//Right Check
if ( argument0 == 1 ) {

    //Hit Enemy
    if (ceil(  map_get( xx+1, yy ) ) == 20 ){
        map_set( xx+1, yy, 0 );
        pX = 3;
        money++;
        audio_play_sound( sfxEnemy, 2, 0 );
        } else
    if !( ceil( map_get( xx+1, yy ) ) == 1 && !(floor( map_get(xx+1, yy) ) == 2 ) ) {
        xx++;
        if (floating == 0) && ( ceil( map_get(xx, yy+1) ) != 1 && floor( map_get(xx, yy+1) ) != 2 ) {
            map_update();
            }
            
        floating = max( 0, floating - 1);
        } else
    if ( floor( map_get( xx+1, yy ) ) == 2 ) {
        pY = 3;
        //NOTE: play bump sound
        }
    else {
        pX = 3;
        map_set( xx+1, yy, map_get( xx+1, yy ) - (0.5+(0.5*_drill)) );
        
        //possibly spawn bubbles
        if (map_get( xx+1, yy) == 0  && irandom(100)>=99) {
            map_set( xx+1, yy, 3);
            }
        
        floating = 1;
        audio_play_sound( sfxSmack, 2, 0 );
        }
    } else
    
//Down Check
if ( argument0 == 2 ) {
    //Hit Enemy
    if (ceil(  map_get( xx, yy+1 ) ) == 20 ){
        map_set( xx, yy+1, 0 );
        pY = 3;
        money++;
        audio_play_sound( sfxEnemy, 2, 0 );
        } else
    if !( ceil( map_get( xx, yy+1 ) ) == 1 ) && !( floor( map_get( xx, yy+1 ) ) == 2 ) {
        floating = 0;
        map_update();
        } else
    if ( floor( map_get( xx, yy+1 ) ) == 2 ) {
        pY = 3;
        //NOTE: play bump sound
        }
    else {
        pY = 3;
        map_set( xx, yy+1, map_get( xx, yy+1 ) - (0.5+(0.5*_drill)) );
        
        //possibly spawn bubbles
        if (map_get( xx, yy+1) == 0  && irandom(100)>=99) {
            map_set( xx, yy+1, 3);
            }
        
        floating = 1;
        audio_play_sound( sfxSmack, 2, 0 );
        }
    }
    
//Update Variables
//Check if we hit an air bubble
if ( map_get( xx, yy ) == 3 ) {
    map_set( xx, yy, 0 );
    air+= (20 + pressure);
    audio_play_sound( sfxAir, 2, 0 );
    }

    //if we're at the end
    if (level+8>990) {
        air = max(1, air);
        hp = max(1, hp);
        }
    
if (air > 0) {
    air-=pressure;
    } else {
    hp--;
    audio_play_sound( sfxHurt, 2, 0 );
    deathCause = "ASPHYXIA";
    }
    
if ( ceil( map_get( xx, yy+1 ) ) == 1 ) {
    floating = 1;
    }
    
if (level+2 <= iceLevel) {
    hp--;
    audio_play_sound( sfxHurt, 2, 0 );
    deathCause = "ICE";
    }
    

    
//Find Flames
var _fireArr;
_fireArr[0] = 0;
for (var _i = 0; _i < ds_grid_width( map ); _i ++ ) {
    for (var _j = 0; _j < ds_grid_height( map ); _j ++ ) {
    
        var _val =  map_get( _i, _j);
        
        if ( _val >= 50 && _val <= 53 ) {
            _fireArr[0]++;
            _fireArr[ array_length_1d( _fireArr ) ] = vec3( _i, _j, _val%50 ); 
            }
        
        }
    
    }
    
//Move Flames
for ( var _i = 1; _i < array_length_1d( _fireArr ); _i++ ) {

        var _vec3 = _fireArr[@ _i ];
        var _xx = _vec3[0];
        var _yy = _vec3[1];
        var _dd = _vec3[2];
        
        if (_dd == 0 && (map_get(_xx+1, _yy)==0) ) {
            map_set( _xx+1, _yy, _dd+50);
            }
        if (_dd == 1 && (map_get(_xx, _yy-1)==0)) {
            map_set( _xx, _yy-1, _dd+50);
            }
        if (_dd == 2 && (map_get(_xx-1, _yy)==0)) {
            map_set( _xx-1, _yy, _dd+50);
            }
        if (_dd == 3 && (map_get(_xx, _yy+1)==0)) {
            map_set( _xx, _yy+1, _dd+50);
            }
        
        map_set( _xx, _yy, 0 );
            
    }
    
//Flame Blocks
for (var _i = 0; _i < ds_grid_width( map ); _i ++ ) {
    for (var _j = 0; _j < ds_grid_height( map ); _j ++ ) {
    
        //Find flame blocks and their current states
        if ( floor( map_get( _i, _j ) ) == 2 ) {
        
                if (map_get( _i, _j) == 2.) {
                    if (map_get(_i+1, _j)==0) { map_set( _i+1, _j, 50 ); }
                    if (map_get(_i, _j-1)==0) { map_set( _i, _j-1, 51 ); }
                    if (map_get(_i-1, _j)==0) { map_set( _i-1, _j, 52 ); }
                    if (map_get(_i, _j+1)==0) { map_set( _i, _j+1, 53 ); }
                    
                    if !( audio_is_playing( sfxFireball ) ) {
                        audio_play_sound(sfxFireball, 2, 0 );
                        }
                    
                    }
        
                var _val = map_get( _i, _j )+0.25;
                if (_val >= 3.) {
                    _val = 2.;
                    }
        
                map_set( _i, _j, _val);
            }
    
        }
    
    }
    
//Update Enemy Positions
var _enemyArr;
_enemyArr[0] = 0;
for (var _i = 0; _i < ds_grid_width( map ); _i ++ ) {
    for (var _j = 0; _j < ds_grid_height( map ); _j ++ ) {
    
        if (map_get( _i, _j ) == 20) {
            
            var _dir = 0;
            _enemyArr[0]++;
            
            var _pd = point_direction( _i, _j, xx, yy );
            
            //Right
            if (_pd <= 45 || _pd > 315) {
                if (_pd <= 45 ) {
                    _dir = 0.75;
                    } else {
                    _dir = 0.;
                    }
                } else
            
            //Up
            if (_pd > 45 && _pd <= 135) {
                _dir = 1 + clamp( (_pd-45)/90, 0, 0.99 );
                } else
                
            //Left
            if (_pd > 135 && _pd <= 225) {
                _dir = 2 + clamp( (_pd-135)/90, 0, 0.99);
                } else
                
            //Down
            if (_pd > 225 && _pd <= 315) {
                _dir = 3 + clamp( (_pd-225)/90, 0, 0.99);
                }
                
            _enemyArr[ _enemyArr[0] ] = vec3( _i, _j, _dir );
            
            }
        }
    }
    
//Move enemies
for ( var _i = 1; _i < array_length_1d( _enemyArr ); _i++ ) {
    var _vec3 = _enemyArr[@ _i ];
    var _xx = _vec3[0];
    var _yy = _vec3[1];
    var _dd = _vec3[2];
    
    var _rr = (_dd%1.0)-0.5;
    _dd = floor(_dd);
    
    var _moves = 3;
    
    while( _moves > 0 ) {
        switch( _dd ) {
            //Move Right
            case 0:
                //Hit Player
                if ( _xx+1 == xx  && _yy == yy ) {
                    hp--;
                    audio_play_sound( sfxHurt, 2, 0 );
                    _moves = 0;
                    deathCause = "A MONSTER";
                    } else
                //Move Right
                if (map_get( _xx+1, _yy ) == 0) {
                    map_set( _xx+1, _yy, 20 );
                    map_set( _xx, _yy, 0 );
                    _moves = 0;
                    } else
                if ( _rr >= 0 ) {
                    _dd = 1.;
                    } else {
                    _dd = 3.;
                    }
                break;
                
            case 1:
                //Hit Player
                if ( _xx == xx  && _yy-1 == yy ) {
                    hp--;
                    audio_play_sound( sfxHurt, 2, 0 );
                    _moves = 0;
                    deathCause = "A MONSTER";
                    } else
                //Move Up
                if (map_get( _xx, _yy-1 ) == 0) {
                    map_set( _xx, _yy-1, 20 );
                    map_set( _xx, _yy, 0 );
                    _moves = 0;
                    } else
                if ( _rr >= 0 ) {
                    _dd = 2.;
                    } else {
                    _dd = 0.;
                    }
                break;
                
            case 2:
                //Hit Player
                if ( _xx-1 == xx  && _yy == yy ) {
                    hp--;
                    audio_play_sound( sfxHurt, 2, 0 );
                    _moves = 0;
                    deathCause = "A MONSTER";
                    } else
                //Move Left
                if (map_get( _xx-1, _yy ) == 0) {
                    map_set( _xx-1, _yy, 20 );
                    map_set( _xx, _yy, 0 );
                    _moves = 0;
                    } else
                if ( _rr >= 0 ) {
                    _dd = 3.;
                    } else {
                    _dd = 1.;
                    }
                break;
                
            case 3:
                //Hit Player
                if ( _xx == xx  && _yy+1 == yy ) {
                    hp--;
                    audio_play_sound( sfxHurt, 2, 0 );
                    _moves = 0;
                    deathCause = "A MONSTER";
                    } else
                //Move Down
                if (map_get( _xx, _yy+1 ) == 0) {
                    map_set( _xx, _yy+1, 20 );
                    map_set( _xx, _yy, 0 );
                    _moves = 0;
                    } else
                if ( _rr >= 0 ) {
                    _dd = 0.;
                    } else {
                    _dd = 2.;
                    }
                break;
                
            }
            
        _moves--;
        
        }
    }
    
//Hurt from fireball
if ( map_get( xx, yy ) >= 50 && map_get( xx, yy) <= 53 ) {
    map_set( xx, yy, 0 );
    hp--;
    audio_play_sound( sfxHurt, 2, 0 );
    deathCause = "A MAGMA BALL";
    }

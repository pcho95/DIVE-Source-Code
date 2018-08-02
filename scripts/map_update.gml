/// map_update
// FUNCTION FOR oGAME ONLY
// updates the game map when the player moves down

var _w = ds_grid_width( map );
var _h = ds_grid_height( map );

for( var _i = 0; _i < _w; _i++ ) {
    for( var _j = 0; _j < _h-1; _j++ ) {
    
        map_set( _i, _j, map_get( _i, _j+1 ) );
        
        }
        
    //randomly select tile
    map_set( _i, _h-1, clamp( 1 - irandom(9), 0, 1 ) );
    
    if (irandom(75) == 0) {
        map_set( _i, _h-1, 20 );
        }
        
    //Fireblock
    if (level > 500) {
    
        if (irandom(65) == 0) {
        map_set( _i, _h-1, 20 );
        }
    
        if (level < 750) {
            if (irandom(100) == 0) {
                map_set( _i, _h-1, 2 );
                }
            } else {
            if (irandom(50) == 0) {
                map_set( _i, _h-1, 2 );
                }
            }
        }
        
    if (level+8>990) {
        map_set(_i, _h-1, 0 );
        }
        
    if (level+8 == 999) {
        map_set( -1 + floor(mapSX/2), _h-1, 99 );
        }
        
    if (level+8 >= 1000) {
        map_set(_i, _h-1, 1 );
        }
        
    if ( map_get(_i,_h-2) == 99 && (map_get(_i,_h-1)) == 99) {
           map_set(_i,_h-2,0);
           }

    
    //Block under merchant
    if (map_get( _i, _h-2 ) == 10 ) {
        map_set( _i, _h-1, 1 );
        }

        
    }
    
if ( (level+15)%50 == 0 && (level+15)!=0 ) {

    shop_randomize();
    
    var _merchant = 0;
    for( var _i = 0; _i < _w; _i++ ) {
        if (_merchant) {
            break;
            }
        if (irandom(_w)==0) || (_i == _w-1 && !_merchant) {
            _merchant = 1;
            map_set( _i, _h-1, 10);
            }
        }
    }
    
level++;

//Jet Refill
jetFill++;


/* GUIDE
0 - nothing
1 - block
2 - nothing
3 - bubbles
10 - trader
20 - enemy
*/

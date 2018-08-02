/// map_up
// FUNCTION FOR oGAME ONLY
// updates the game map when the player moves up using the jet

var _w = ds_grid_width( map );
var _h = ds_grid_height( map );

for( var _i = _w-1; _i >= 0; _i-- ) {
    for( var _j = _h-1; _j > 0; _j-- ) {
    
        map_set( _i, _j, map_get( _i, _j-1 ) );
    
        }
    
    //randomly select tile
    map_set( _i, 0, 1 );
        
    }
    
level--;

/* GUIDE
0 - nothing
1 - block
2 - nothing
3 - bubbles
10 - trader
20 - enemy
*/

/// draw_map_tile( _ix, _iy, x, y, depth, frame )

var _ix = argument0;
var _jx = argument1;

var _xx = argument2;
var _yy = argument3;

var _d = argument4;

var _ff = argument5;

//Sky
if ( _d == 0) {
    draw_sprite( tileSky, 4, _xx, _yy);
    }else
    
//Water Top
if ( _d == 10) {
    draw_sprite( tileSky, _ff, _xx, _yy);
    }
    
//Grave
if ( map[# _ix, _jx] == 99) {
    draw_sprite( tileGrave, _ff, _xx, _yy);
    } else
    
//Ice
if ( _d <= iceLevel*10 ) {
    draw_sprite( tileIce, _d==(floor(iceLevel)*10), _xx, _yy);
    if ( _d==(floor(iceLevel)*10) && ( (iceLevel%1.) == 0.75 ) ) {
        draw_sprite( tileIce, 2, _xx, _yy);
        }
    } else
    
//Block 
if ( ceil( map[# _ix, _jx] ) == 1) {
    draw_sprite( tileBlock, 2. * (map[# _ix, _jx]%1), _xx, _yy);
    if (level+8>= 999) {
        map[# _ix, _jx] = 1;
        }
    }else
    
//Burner Block 
if ( floor( map[# _ix, _jx] ) == 2) {
    draw_sprite( tileBurner, _ff + 4*(map[# _ix, _jx] == 2), _xx, _yy);
    }else
    
//Fire Ball
if ( map[# _ix, _jx] >= 50 && map[# _ix, _jx] <= 53 ) {
    var _rr = (map[# _ix, _jx]%50)
    draw_sprite_ext( sprFireball, _ff, _xx+8, _yy+8, 1, 1, _rr*90, c_white, 1.0);
    }else
    
//Enemy
if ( map[# _ix, _jx] == 20) {
    draw_sprite( sprEnemy, _ff, _xx, _yy);
    } else
    
//Air Bubbles
if ( map[# _ix, _jx] == 3) {
    draw_sprite( tileAir, _ff, _xx, _yy);
    }
    
//Merchant
if ( map[# _ix, _jx] == 10) {
    draw_sprite( sprMerchant, _ff, _xx, _yy);
    
    draw_sprite( sprMarker, 1, mapX, _yy);
    draw_set_color( c_yellow );
    draw_set_halign( fa_right );
    draw_text( mapX - 9, _yy + 8, "TRADER" );
    draw_set_color( c_white );
    /*
    if ( ( abs(xx - _ix) == 1 && abs(yy - _jx) == 0)
        ^^ ( abs(xx - _ix) == 0 && abs(yy - _jx) == 1) ) {
        draw_set_halign( fa_center );
        d3d_transform_add_translation( 0, 0, -10);
        draw_set_color(c_blue);
        draw_rectangle( _xx-13, _yy-8, _xx+27, _yy-0, 0 );
        draw_set_color(c_white);
        draw_text( _xx + 8, _yy - 8, "SPACE" );
        d3d_transform_set_identity();
        }
    */
    }
    
//Depth marker
if ( (_d%50) == 0 ) {
    draw_sprite( sprMarker, 0, mapX, _yy);
    draw_set_halign( fa_right );
    draw_text( mapX - 9, _yy, string(_d)+".FT" );
    }
    
//Pressure marker
if ( level<900 && ( (_d/10)%250) == 0 && _d!=0 ) || ( global.hardMode &&_d == 10) {
    draw_sprite( sprMarker, 2, mapX + tileSize*mapSX, _yy);
    draw_set_halign( fa_left );
    draw_set_color(c_red);
    draw_text( mapX + tileSize*mapSX + 9, _yy, "PRESSURE #INCREASE" );
    draw_set_color(c_white);
    }
    
//Death markers
for (var _i=0; _i < ds_list_size( global.deathList); _i++) {
    if ( (_d) == global.deathList[| _i] ) {
        draw_sprite( sprMarker, 3, mapX + tileSize*mapSX, _yy);
        if ( _i == ds_list_size( global.deathList ) - 1 ) {
            draw_set_halign( fa_left );
            draw_text( mapX + tileSize*mapSX + 9, _yy + 8, "BEST" );
            }
        }
    }

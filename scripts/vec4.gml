/// vec3

var _arr;
_arr[3] = 0;

if ( argument_count == 1 ) {
    _arr[@ 0] = argument[0];
    _arr[@ 1] = argument[0];
    _arr[@ 2] = argument[0];
    _arr[@ 3] = argument[0];
    return _arr;
    }
    
for (var _i = 0; _i < 4; _i ++ ) {
    _arr[@ _i] = argument[_i];
    }
    
return _arr;

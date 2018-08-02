shopList[@ 0] = 0 //irandom( 8 );
shopList[@ 1] = 5 + airTank;
shopList[@ 2] = 1 + irandom(3) //irandom( 8 );
shopList[@ 3] = 1 + irandom(3) //irandom( 8 );
while ( shopList[ 3 ] == shopList[ 2 ] ) {
    shopList[@ 3] = 1 + irandom(3) //irandom( 8 );
    }

for ( var _i = 0; _i < array_length_1d( shopList ); _i++ ) {
    
    var _val = shopList[ _i];
    
    //Goggles
    if ( _val == 1 && itemGoggles ) {
        shopList[@ _i] = -1;
        }
     
    //Drill 
    if ( _val == 2 && itemDrill ) {
        shopList[@ _i] = -1;
        }
        
    //Jet 
    if ( _val == 3 && itemJet ) {
        shopList[@ _i] = -1;
        }
        
    //Suit 
    if ( _val == 4 && itemSuit ) {
        shopList[@ _i] = -1;
        }
        
    //Full Tank   
    if ( _val == 9 ) {
        shopList[@ _i] = -1;
        }

        
    }
    
if (airTank == 4 && !itemFlowers) {
    shopList[@ 1] = 9;
    }
//shopList[@ 4] = 3 + irandom( 5 );

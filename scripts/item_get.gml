/// item_get( item number );

switch( argument0 ) {

    //HP Refill
    case 0:
        hp = 5;
        air = 100;
        return 0;
     
    //Goggles   
    case 1:
        itemGoggles = true;
        return 0;
     
    //Drill   
    case 2:
        itemDrill = true;
        return 0;
        
    //Jets
    case 3:
        itemJet = true;
        jetFill = 5;
        jetOn = false;
        return 0;
        
    //Hi-P Suit    
    case 4:
        itemSuit = true;
        return 0;
        
    //Air Tank 1
    case 5:
        airTank = 1;
        air = 99;
        return 0;
        
    //Air Tank 2
    case 6:
        airTank = 2;
        air = 99;
        return 0;
        
    //Air Tank 3
    case 7:
        airTank = 3;
        air = 99;
        return 0;
        
    //Air Tank 4
    case 8:
        airTank = 4;
        air = 99;
        return 0;
        
    //Air Tank 4
    case 9:
        itemFlowers = true;
        global.goodEnd = true;
        return 0;
        
        }
        

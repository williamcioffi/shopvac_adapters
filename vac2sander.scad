
$fn = 100;

// small overlap
overlap = 0.2;

// dims for random orbital
id1 = 32;
id2 = 32; // no taper

wallthickness = 2;
height = 32; // 5 longer than original

od1 = id1 + 2*wallthickness;
od2 = id2 + 2*wallthickness;

// vacuum dims
vac_od1 = 49.5/2;
vac_od2 = 48.5/2;

module tube() {
difference() {
    cylinder(d1 = od1, d2 = od2, h = height);
    translate([0, 0, -0.5]) cylinder(d1 = id1, d2 = id2, h = height + 1);
}
}


n1w = 4;
n1h = 9;
n1d = 4;

n2w = 13;
n2h = 4;
n2d = 10;


module tubecutout() {
    difference() {
        tube();
        translate([-n1w, (id1/2 - 2), height - n1h]) cube([n1w, n1d, n1h + 1]);
        translate([-n2w, (id1/2 - 8), height - n1h]) cube([n2w, n2d, n2h]); 
        
        translate([0, -id2/2 - 3, height - n1h]) cube([n1w, n1d, n1h + 1]);
        translate([0, -id2/2 - 3, height - n1h]) cube([n2w, n2d, n2h]); 
    }
}


// add on a bigger tube

module vacadapter() {    
    difference() {
        cylinder(height, vac_od2, vac_od1, center = true);
        cylinder(height + overlap, vac_od2 - wallthickness, vac_od1 - wallthickness, center = true);
    }
}

module adaptadapt() {
    difference() {
        cylinder(height/2, vac_od1, od1/2, center = true);
        cylinder(height/2 + overlap, vac_od1 - wallthickness, od1/2 - wallthickness, center = true);
    }
}


tubecutout();

translate([0, 0, -height + 0.01]) vacadapter();

translate([0, 0, -height/4 + 0.01]) 
    adaptadapt();

$fn = 100;
id1 = 32;
id2 = 32; // no taper

wallthickness = 2;
height = 65; // 5 longer than original

od1 = id1 + 2*wallthickness;
od2 = id2 + 2*wallthickness;

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


difference() {
    tube();
    translate([-n1w, (id1/2 - 2), height - n1h]) cube([n1w, n1d, n1h + 1]);
    translate([-n2w, (id1/2 - 8), height - n1h]) cube([n2w, n2d, n2h]); 
    
    translate([0, -id2/2 - 3, height - n1h]) cube([n1w, n1d, n1h + 1]);
    translate([0, -id2/2 - 3, height - n1h]) cube([n2w, n2d, n2h]); 
}



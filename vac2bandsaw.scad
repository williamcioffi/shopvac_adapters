$fn = 100; // make higher before render

joint_length = 32;
overlap = 0.2;


vac_od1 = 49.5/2;
vac_od2 = 48.5/2;
vac_thick = 2;

adp_od1 = 58.5/2;
adp_od2 = 57.5/2;




module outer() {
// fits on vacuum
cylinder(joint_length, vac_od2, vac_od1, center = true);

// adapts between vacuum and saw
translate([0, 0, joint_length - overlap]) cylinder(joint_length + overlap, vac_od1, adp_od1, center = true);

// fits on saw
translate([0, 0, joint_length*2 - overlap]) cylinder(joint_length + overlap, adp_od1, adp_od2, center = true);
}

module inner() {
    cylinder(joint_length + overlap, vac_od2 - vac_thick, vac_od1 - vac_thick, center = true);

// adapts between vacuum and saw
translate([0, 0, joint_length - overlap]) cylinder(joint_length + overlap, vac_od1 - vac_thick, adp_od1 - vac_thick, center = true);

// fits on saw
translate([0, 0, joint_length*2 - overlap]) cylinder(joint_length + overlap*2, adp_od1 - vac_thick, adp_od2 - vac_thick, center = true);
}
//
difference() {
    outer();
    inner();
}
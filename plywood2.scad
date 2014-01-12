radius = 175; // pretty close to 150/cos(30)
radius2 = radius/cos(30);
extralength = 20;
belt_gap = 28;
offset = 0;
thickness = 9;
h2 = thickness*2+1;
boardwidth=150;
radius_c = boardwidth/(2*cos(30));

module single_board(bottom) {
boardlength=radius+extralength;
	difference() {
		translate([boardlength/2,0,thickness/2])
		  cube([boardlength,boardwidth,thickness],center=true);
		//Corners to cut
		rotate([0,0,-30]) translate([-40,-5,-1])
		  cube([40,boardwidth,thickness+2]);
		rotate([0,0,30]) translate([-40,5-boardwidth,-1]) 
		  cube([40,boardwidth,thickness+2]);
		//holes for motor_end
		translate([radius-8, -30, 0])
		  cylinder(r=2.2, h=h2, center=true, $fn=12);
		translate([radius-8, 30, 0])
		  cylinder(r=2.2, h=h2, center=true, $fn=12);
		//slot for belts
		translate([radius+11,0,0])
		  cube([22,belt_gap,h2],center=true);
		//holes for center_board
		translate([radius_c/2,30,0])
		  cylinder(r=2.2, h=h2, center=true, $fn=12);
		translate([radius_c/2,-30,0])
		  cylinder(r=2.2, h=h2, center=true, $fn=12);

		if (bottom) {
			//holes for idler_end
			translate([radius-44, -30, 0])
			  cylinder(r=2.2, h=h2, center=true, $fn=12);
			translate([radius-44, 30, 0])
			  cylinder(r=2.2, h=h2, center=true, $fn=12);
			//holes for rods
			translate([radius+4,-30,0])
			  cylinder(r=4.5,h=h2,center=true, $fn=12);
			translate([radius+4,30,0])
			  cylinder(r=4.5,h=h2,center=true, $fn=12);
			//mount holes for baseplate
			translate([radius-26,0,0])
			  cylinder(r=2.2,h=h2,center=true, $fn=20);
		}
	}
}

module center_board() {
	difference() {
		translate([0,0,-thickness/2])
		  cylinder(r=radius_c, h=thickness, center=true, $fn=6);
	for(a=[-120,0,120]) {
			rotate([0,0,a]) {
			translate([radius_c/2,30,0])
			  cylinder(r=2.2, h=h2, center=true, $fn=12);
			translate([radius_c/2,-30,0])
			  cylinder(r=2.2, h=h2, center=true, $fn=12);
		}}
	}
}

single_board(1);
rotate([0,0,120]) single_board(1);
rotate([0,0,-120]) single_board(1);
center_board();

//projection(cut=false) center_board();
//projection(cut=false) single_board(0);
//projection(cut=false) single_board(1);
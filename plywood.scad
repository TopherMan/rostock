radius = 175; // pretty close to 150/cos(30)
radius2 = radius/cos(30);
radius3 = radius2/cos(30)/2;
//offset = 150-radius;
offset = 0;
thickness = 9;
h = 450;
w = 283;
corner = 40;

module plywood(bottom) {
  difference() {
    //intersection() {
//      cube([2*radius, 300, 9], center=true);
//      translate([0, offset, 0]) rotate([0, 0, 30])
//	cylinder(r=2*radius, h=20, center=true, $fn=3);
//    }
    translate([0, offset, 0]) cylinder(r=radius2+20, h=thickness, center=true, $fn=6);
    for (a = [0, 120, 240]) {
      translate([0, offset, 0]) rotate([0, 0, a]) {
	translate([-30, radius-8, 0])
	  cylinder(r=2.2, h=20, center=true, $fn=12);
	translate([30, radius-8, 0])
	  cylinder(r=2.2, h=20, center=true, $fn=12);
	if (bottom) {
		translate([-30, radius-44, 0])
		  cylinder(r=2.2, h=20, center=true, $fn=12);
		translate([30, radius-44, 0])
		  cylinder(r=2.2, h=20, center=true, $fn=12);
	}
   translate([0,radius2,0])
     cube([80,60,thickness+1],center=true);
   translate([0,-170,0])
     cube([400,60,thickness+1],center=true);
      }
    }
  }
}

module frontpanel() {
   difference() {
	cube([w,thickness,h]);
	difference(){
	translate([w*.125,-.5,h*.125]) cube([w*.75,thickness+1,h*.75]);
	translate([w*.125,5,h*.125]) rotate([0,45,0]) translate([0,-1,0]) cube([corner,thickness+2,corner],center=true);
	translate([w*(.125+.75),5,h*.125]) rotate([0,45,0]) translate([0,-1,0]) cube([corner,thickness+2,corner],center=true);
	translate([w*.125,5,h*(.125+.75)]) rotate([0,45,0]) translate([0,-1,0]) cube([corner,thickness+2,corner],center=true);
	translate([w*(.125+.75),5,h*(.125+.75)]) rotate([0,45,0]) translate([0,-1,0]) cube([corner,thickness+2,corner],center=true);
	}
	}
}

module sidepanel() {
	cube([113,thickness,h]);
}

//use <motor_end.scad>;
//% rotate([180,0,0]) translate([0,-radius-4,0]) motor_end();


translate([0, 0, h-thickness/2]) plywood(0);
translate([0, 0, thickness/2]) plywood(1);

for (a = [0, 120, 240]) {
rotate([0,0,a]) translate([-w/2,-140-thickness,0]) frontpanel();
rotate([0,0,a]) translate([w/2+thickness/2,-140-thickness,0]) rotate([0,0,60]) sidepanel();
}

%translate([0,0,thickness]) cylinder(r=125,h=thickness,center=true);

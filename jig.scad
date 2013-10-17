radius = 175; // pretty close to 150/cos(30)
radius2 = radius/cos(30);
radius3 = radius2/cos(30)/2;
radius4 = radius3*0.37;
h=9;

use <plywood.scad>;

module jig() {
	union() {
		difference() {
			rotate([0,0,30]) cylinder(r=20,h=h,$fn=3,center=true);
			cylinder(r=3.5,h=2*h,center=true);
		}
		translate([0,70,0]) cube([10,130,h],center=true);
		difference() {
			plywood(1);
			translate([-250,-225,-h]) cube([500,350,2*h]);
			translate([0,150,0])cube([40,30,2*h],center=true);
			translate([60,150,0]) difference() {
				cube([30,30,2*h],center=true);
				translate([20,0,0]) rotate([0,0,30]) cube([30,60,2*h],center = true);
			}
			translate([-60,150,0]) difference() {
				cube([30,30,2*h],center=true);
				translate([-20,0,0]) rotate([0,0,-30]) cube([30,60,2*h],center = true);
			}
		}
	}
}
%translate([0,0,-4.5]) plywood(1);

translate([0, 0, h/2]) jig();

// capot long pour Phantom v1.5

*%translate([-27.4, -19, 0]) import("capot_seul.stl");

/**************************/
//logos
use <dji.scad>;
use <phantom.scad>;

it=[-1,1];
$fn=20;
fn1=60;
fn2=30;

x_top=23.25;
x_bottom=26;
y_top=6.25;
y_bottom=-10.25;

usb_w=42;
usb_x=4.75;
led_z=6.5;
/**************************/


thickness=2;	// thinchness of the wall
height=30;		// height of the cover mini 25mm
logo=1;			// 0: no logo, 1: DJI, 2: Phantom


capot();

module capot()
{
	difference()
	{
		capot_plain();
		capot_void();
		if(logo==1) translate([0, 9, -5.1]) scale(.15) rotate([0, 0, 180]) mirror([0, 1, 0]) dji(8);
		if(logo==2) translate([0, 4, -5.1]) scale(.3) rotate([0, 0, 180]) mirror([0, 1, 0]) phantom(3);
	}
	
	/*
	 * top fixation
	 */
	translate([0, 18.4, height+1.5]) difference()
	{
		patte();
		patte_void(c=false);
	}
	
	/*
	 * bottom fixation
	 */
	translate([0, -19+1.4, height+1.8+.25]) for(i=it) translate([i*(38.7/2-5), 0, 0]) patte(w=10, m=1, r=false);

	/*
	 * Lipo
	 */
	*rotate([0, 0, 90]) beez2B();
}

module capot_plain()
{
	*%cube([77.5, 43.5, 1], true);
	*%cube([75, 43.5, 1], true);
	
	/*
	 * External
	 */
	hull()
	{
		translate([0, 0, -4.95]) hull() for(i=it) {
			translate([i*x_bottom, y_bottom, 0]) cylinder(r=8.5-.5, h=.2, center=true, $fn=fn1);
			translate([i*x_top, y_top, 0]) cylinder(r=12.5-.5, h=.2, center=true, $fn=fn1);
		}
		translate([0, 0, -3.95-.5]) hull() for(i=it) {
			translate([i*x_bottom, y_bottom, 0]) cylinder(r=8.5, h=.2, center=true, $fn=fn1);
			translate([i*x_top, y_top, 0]) cylinder(r=12.5, h=.2, center=true, $fn=fn1);
		}
		translate([0, 0, .05]) hull() for(i=it) {
			translate([i*x_bottom, y_bottom, 0]) cylinder(r=11.5, h=.1, center=true, $fn=fn1);
			translate([i*x_top, y_top, 0]) cylinder(r=15.5, h=.1, center=true, $fn=fn1);
		}
	}
	hull()
	{
		translate([0, 0, .05]) hull() for(i=it) {
			translate([i*x_bottom, y_bottom, 0]) cylinder(r=11.5, h=.1, center=true, $fn=fn1);
			translate([i*x_top, y_top, 0]) cylinder(r=15.5, h=.1, center=true, $fn=fn1);
		}
		translate([0, 0, height+1]) hull() for(i=it) {
			translate([i*x_bottom, y_bottom, 0]) cylinder(r=11.5, h=.1, center=true, $fn=fn1);
			translate([i*x_top, y_top, 0]) cylinder(r=15.5, h=.1, center=true, $fn=fn1);
		}
	}
	/*
	 * usb / Led
	 */
	*translate([0, -18.75, 0]) hull()
	{
		translate([0, 0, -5]) cube([usb_w-2, 5, .1], true);
		translate([0, 0, -2]) cube([usb_w, 6, 5], true);
	}
	translate([0, -10.75+1, -5.05]) cylinder(r=12, h=5, $fn=60);
	*%translate([0, -10.75+1, -4.95]) cylinder(r=22/2, h=1, center=true, $fn=60);
}

module capot_void()
{
	/*
	 * External
	 */
	hull()
	{
		translate([0, 0, -4.95+thickness+.5]) hull() for(i=it) {
			translate([i*x_bottom, y_bottom, 0]) cylinder(r=8.5-thickness, h=.2, center=true, $fn=fn1);
			translate([i*x_top, y_top, 0]) cylinder(r=12.5-thickness, h=.2, center=true, $fn=fn1);
		}
		translate([0, 0, .05]) hull() for(i=it) {
			translate([i*x_bottom, y_bottom, 0]) cylinder(r=11.5-thickness, h=.1, center=true, $fn=fn1);
			translate([i*x_top, y_top, 0]) cylinder(r=15.5-thickness, h=.1, center=true, $fn=fn1);
		}
	}
	hull()
	{
		translate([0, 0, .05]) hull() for(i=it) {
			translate([i*x_bottom, y_bottom, 0]) cylinder(r=11.5-thickness, h=.1, center=true, $fn=fn1);
			translate([i*x_top, y_top, 0]) cylinder(r=15.5-thickness, h=.1, center=true, $fn=fn1);
		}
		translate([0, 0, height+1+thickness]) hull() for(i=it) {
			translate([i*x_bottom, y_bottom, 0]) cylinder(r=11.5-thickness, h=.1, center=true, $fn=fn1);
			translate([i*x_top, y_top, 0]) cylinder(r=15.5-thickness, h=.1, center=true, $fn=fn1);
		}
	 }
	
	/*
	 * usb
	 */
	*translate([0, -21.75+usb_x, -5]) cube([8.5, 3.5, 6], true);
	translate([0, -1.75-1, 1.7+3.5]) translate([0, -21.75+usb_x, -5]) rotate([90, 0, 0]) hull()
	{
		translate([0, .75, 0]) cube([8.5, 2, 6], true);
		translate([0, -1.7, ]) cube([5.5, .1, 6], true);
	}
	
	/*
	 * Led
	 */
	translate([0, -10.75+1, -5.1]) cylinder(r=13/2, h=6, $fn=60);
	translate([0, -10.75+1, -5.1]) hull() for(i=it) translate([i*8, 0, 0]) cylinder(r=3.7/2, h=6, center=true, $fn=fn2);
	
	/*
	 * top fixation clearance
	 */
	translate([0, 18.75, height+1.5]) difference() patte_void();

}

module patte(w=20.7,m=0,r=true)
{
	mirror([0, m*1, 0])
	{
		/*
		 * top
		 */
		cube([w, 1.5, 2], true);
		hull()
		{
			translate([0, 1.25, 1.5]) cube([w, 4, 1], true);
			translate([0, -.25, 5]) cube([w, 1, 1], true);
		}
		
		/*
		 * bottom
		 */ 
		
		if(r)
		{
			hull()
			{
				translate([0, 1.5, -1.05]) cube([w, 4.5, .1], true);
				translate([0, 2.25, -height-1.5+4]) cube([w, 1.8, .1], true);
			}

			translate([w/2-.5, 0, 0]) for(i=[0, 3, 6, 9.9, 13.7, 16.7, 19.7]) translate([-i, 0, 0])  hull()
			{
				translate([0, 3.24, -1.1]) cube([1, 1, .1], true);
				translate([0, 3, -16.5]) cube([1, 2, .1], true);
			*	translate([0, 3.5, -height-1.5+13]) cube([1, 2, .1], true);
				translate([0, 2.8, -height-1.5+4]) cube([1, 1, .1], true);
			}
	
			/*
			 * support
			 */
			color("red") hull() {
				translate([0, 3.05, -.8]) cube([w, .6, .1], true);
				translate([0, 3.05, .8]) cube([w, .4, .1], true);
			}
		}
		else
		{
			hull()
			{
				translate([0, .75, -1.05]) cube([w, 3, .1], true);
				translate([0, 2.5, -height/2-1.5]) cube([w, .8, .1], true);
			}
	
			/*
			 * support
			 */
			color("red") hull() {
				translate([0, 3.05, -.8]) cube([w, .6, .1], true);
				translate([0, 3.05, .8]) cube([w, .4, .1], true);
			}
		}
	}
}

module patte_void(w=20.7,m=0,c=true)
{
	mirror([0, m*1, 0])
	{
		*for(i=[2, 4, 6, 8]) translate([0, 4.6, -i]) rotate([45, 0, 0]) cube([w+.2, 2, 2], true);
		for(i=it) translate([i*w/2+(i*.5), 2, -9.5+2.5]) cube([1, 4, 24-4], true);
		if(c) translate([0, 1.5, -.5]) cube([w+.2, 3, 1], true);
	}
}


module beez2B()
{
	color([.1, .1, .1]) cube([45, 30, 100], true);
}

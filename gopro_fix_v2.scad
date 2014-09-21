// gopro fix ti phantom for moving

$fn=60;

it=[-1,1];

rotate ([90,0,0]) fixer();
translate ([0,15,0]) rotate ([-90,0,0]) fixer(ext=true);
translate([0, -60, -2.65]) rotate([90, 0, 0]) color("orange") ribbon(); 

// simulation
*translate([-6.5, -28, 8]) color("orange") ribbon(); 

module fixer(ext) {
	difference () 
	{
		fixer_plain(ext);
		fixer_void(ext);
	}
}

module fixer_plain(ext)
{
	intersection () 
	{
		union()
		{
			cube ([80,10,9],center=true);
			if(ext)
			{
				translate ([-30, 0, -3]) rotate ([90,0,0]) cylinder (r=10, h=10, center=true);
			}
		}
		scale ([42,13,14]) cylinder (r=1, h=1, center=true,$fn=100);
	}
	if(!ext)
	{
		// join
		translate([-6.5, 0, 0]) for(j=it) translate([j*43/2, 0, 0]) 
		{
			translate ([0, 0, 9]) cube([4, 10, 14], true);
			for(i=it) translate ([i*2, 0, 4.4]) rotate([0, 45, 0]) cube([5, 10, 5], true);
			translate ([j*-2, 0, 15.5-2.5]) rotate([0, 45, 0]) cube([4, 10, 4], center=true);
		}
		
		// gopro
		%translate ([-12.75, 0, 14.5]) cube([24.5, 10, 3], center=true);
		translate ([-6.5, 0, 14.5]) cube([47, 10, 3], center=true);
		translate ([-28.5, 0, 28]) cube([3, 10, 24], center=true);
		translate ([15.5, 0, 28]) cube([3, 10, 24], center=true);
		translate ([-6.5, -3.5, 28]) cube([41, 3, 24], center=true);
		%translate ([-6.5, 8.5, 28]) cube([41, 21, 24], center=true);
	}
}

module fixer_void(ext)
{
	translate ([-40+38,0,-4]) rotate ([90,0,0]) cylinder (r=3.75,h=11,center=true,$fn=100);
	translate ([22,0,-5]) rotate ([0,-10,0]) cube ([45,11,10],center=true);
	translate ([-22,0,-7.65]) rotate ([0,3,0]) cube ([40,11,10],center=true);

	if(ext)
	{
		translate ([-30, 0, -3]) rotate ([90,0,0]) cylinder (r=5.5, h=11, center=true);
	}
	else
	{
		translate([-6.5, -3, 28]) scale([1, 1, 1.3]) hull() for(i=it) translate([i*10, 0, 0]) rotate([90, 0, 0]) cylinder(r=7, h=6, center=true);
		
		intersection()
		{
			translate ([-30, 0, -3]) rotate ([90,0,0]) cylinder (r=5.5, h=11, center=true);
			translate ([-30, 0, -1.5]) cube([11, 12, 5], true);
		}
		translate([-6.5, -3.6, 28]) for(i=it) translate([i*44.1/2, 0, 0]) cube([3, 3, 6], true);
		translate([-6.5, -3.6, 28]) for(i=it) translate([i*46.1/2, 0, 0]) cube([1, 20, 6], true);
	}

	translate ([-18,0,5]) rotate ([90,0,0]) cylinder(r=2, h=11, center=true);
}


module ribbon()
{
	difference()
	{
		ribbon_plain();
		ribbon_void();
	}
}
module ribbon_plain()
{
	translate([0, 0, 12.75]) cube([45.5, 4.7, 3], true);
	for(i=it) 
	{
		translate([i*43.9/2, 0, 4.3]) cube([2, 4.7, 13.9], true);
		hull()
		{
			translate([i*43.9/2, 0, 14.2]) cube([2, 4.7, .1], true);
			translate([i*46.85/2, 0, -1]) cube([2.4, 4.7, .1], true);
		}
		translate([i*47.25/2, 0, -6]) cube([2, 4.7, 10], true);
		*%translate([i*45.25/2, 0, -11.75]) cube([4, 4.7, 3], true);
		hull()
		{
			translate([i*49/2, 0, -12.75]) cube([.25, 4.7, 5], true);
			translate([i*44.25/2, 0, -11.75]) rotate([90, 0, 0]) cylinder(r=3/2, h=4.7, center=true);
			translate([i*42.05/2, 0, -10.65]) rotate([90, 0, 0]) cylinder(r=.4, h=4.7, center=true);
		}
	}
}

module ribbon_void()
{
	hull()
	{
		translate([45.5/2-5.5-13/2, 0, 11.2]) cube([13, 5, .1], true);
		translate([45.5/2-5.5-13/2, 0, 12.2]) cube([11, 5, .1], true);
	}
}


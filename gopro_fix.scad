// gopro fix ti phantom for moving

$fn=60;

//Set to false for simpler version that does not need support but is less stable
spine=false;

rotate ([90,0,0]) fixer();
translate ([0,15,0]) rotate ([-90,0,0]) fixer(ext=true);

module fixer(ext) {
	difference () 
	{
		fixer_plain(ext);
		fixer_void(ext);
	}

	if (spine==true) 
	{
		translate ([-40+28,-1.775,-1.5]) cube ([6,3.45,10.5],center=true);
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
		translate ([1.5, 0, 23.5]) cube([4, 10, 38], center=true);
		translate ([3.5, 0, 4.5]) rotate([0, 45, 0]) cube([5, 10, 5], center=true);
		translate ([-.5, 0, 4.5]) rotate([0, 45, 0]) cube([5, 10, 5], center=true);
		translate ([1.5, 11, 30.5]) cube([4, 12, 24], center=true);
		*translate ([1.5, 5, 30.5]) rotate([0, 0, 45]) cube([2.8, 2.8, 24], center=true);
		
		translate ([9, 0, 32.5]) cube([3, 10, 6], center=true);
		translate ([6, 0, 32.5]) cube([5, 3, 6], center=true);
		translate ([3.5, -1, 32.5]) rotate([0, 0, 45]) cube([2, 2, 6], center=true);
		translate ([7.5, -1, 32.5]) rotate([0, 0, 45]) cube([2, 2, 6], center=true);
		translate ([3.5, 1, 32.5]) rotate([0, 0, 45]) cube([2, 2, 6], center=true);
		translate ([7.5, 1, 32.5]) rotate([0, 0, 45]) cube([2, 2, 6], center=true);
		
		translate ([-12.75, 0, 17]) cube([24.5, 10, 3], center=true);
		translate ([-.5, 0, 15.5]) rotate([0, 45, 0]) cube([4, 10, 4], center=true);
		translate ([-23.5, 0, 30.5]) cube([3, 10, 24], center=true);
		translate ([-23.5, 11, 30.5]) cube([3, 12, 24], center=true);
		*translate ([-24, 5, 30.5]) rotate([0, 0, 45]) cube([1.4, 1.4, 24], center=true);
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
		intersection()
		{
			translate ([-30, 0, -3]) rotate ([90,0,0]) cylinder (r=5.5, h=11, center=true);
			translate ([-30, 0, -1.5]) cube([11, 12, 5], true);
		}
		translate ([-25, 6, 32.5]) cube([2, 23, 6], center=true);
		translate ([-22.3, 0, 31]) cube([.8, 12, 14], center=true);
		translate ([-22.3, 6, 31]) rotate([0, 90, 0]) cylinder(r=7, h=.8, center=true);
	}

	translate ([-18,0,5]) rotate ([90,0,0]) cylinder(r=2, h=11, center=true);
	
	if (spine==true) 
	{
		translate ([-40+28,+1.775,-1.5]) cube ([8,3.65,8],center=true);
	}
}



$fn=50;

def_h=5;
cable=true;		//true vs false

cale(def_h);
translate([0, 22, 0]) mirror([1, 0, 0]) cale(def_h);

module cale()
{
	difference()
	{
		cale_plain(def_h);
		cale_void(def_h);
	}
}

module cale_plain(h)
{
	hull()
	{
		translate([-17/2, 0, 0]) cylinder(r=18/2, h=h);
		translate([15/2, 0, 0]) cylinder(r=18/2, h=h);
	}
}

module cale_void(h)
{
	for(i=[-1,1])
	{
		translate([i*17/2, 0, -0.05]) cylinder(r=3.7/2, h=h+.1);
	}
	translate([0, 0, -0.05])
	{
		cylinder(r=8.4/2, h=h+.1);
		linear_extrude(height=h+.1) polygon([[10, 9], [16.55, 4], [17, 5], [17, 10]]);
	}
	translate([25, -15, 12.25+h]) sphere(r=20, center=true);
	
	if(cable)
	{
		translate([0, -6.5, (h+.05)/2]) cube([3, 6, h+.1], true);
	}
}

// XT60 dual plug cap for phantom 1.5

thickness=.7;
tol=.5;
it=[-1,1];

rotate([90, 0, 0]) cap();

module cap()
{
	difference()
	{
		cap_plain();
		cap_void();
	}
	translate([-27.9/2+thickness+8+1.4, 0, -5]) cube([3, 15, 3.5], true);
	translate([-27.9/2+thickness+8+1.4, 0, 9.1]) hull()
	{
		cube([7, 15, .1], true);
		translate([0, 0, -2.2]) cube([3, 15, .1], true);
	}
	for(i=it) translate([i*27.9/2-i*.3, 5.65, 0]) cube([.4, 3.8, 8], true);
}

module cap_plain()
{
	hull()
	{
		cube([27.9+thickness*2, 15, 13+tol/2+thickness*2], true);
		translate([0, 0, (13+tol/2)/2+(2+tol/2)/2]) cube([22.9+thickness*2, 15, 2+tol/2+thickness*2], true);
	}
}

module cap_void()
{
	translate([0, 5, 0])hull()
	{
		cube([27.7, 5.2, 13+tol/2], true);
		translate([0, 0, (13+tol/2)/2+(2+.95/2)/2]) cube([22.9, 5.2, 2+tol/2], true);
	}
	translate([0, thickness, 0])hull()
	{
		cube([27.9-thickness*2, 15, 13+tol/2-thickness*2], true);
		translate([0, 0, (13+tol/2)/2+(2+tol/2)/2]) cube([22.9-thickness*2, 15, 2+.95/2-thickness*2], true);
	}
}


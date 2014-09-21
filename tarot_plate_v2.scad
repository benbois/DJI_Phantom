// Tarot plate pour Phantom v1.5

$fn=30;
it=[-1,1];

plate_diam=10;
plate_thickness=3;

p2_w_top=44;
p2_w_bottom=34;
p2_l=29.5;
p2_diam=3.2;

t_offset=10;
t_w=23;
t_l=61;

tx_offset=7;
tx_w=55;
tx_l=26;
tx_h=3.5;
tx_rubban_w=4;

tplate();

module tplate()
{
	difference()
	{
		union()
		{
			tplate_plain();
			translate([0, -t_l-tx_l/2-tx_offset, 0]) tx();
		}
		tplate_void();
		translate([0, -t_l-tx_l/2-tx_offset, 0]) tx_void();
	}
}

module tplate_plain()
{
	hull() for(i=it)
	{
		translate([i*t_w/2, t_offset, 0]) cylinder(r=plate_diam/2, h=plate_thickness, center=true);
		translate([i*p2_w_top/2, 0, 0]) cylinder(r=plate_diam/2, h=plate_thickness, center=true);
		**translate([i*p2_w_bottom/2, -p2_l, 0]) cylinder(r=plate_diam/2, h=plate_thickness, center=true);
		translate([i*t_w/2, -t_l+t_offset, 0]) cylinder(r=plate_diam/2, h=plate_thickness, center=true);
	}
}

module tplate_void()
{
	for(i=it)
	{
		// p2 fixation
		translate([i*p2_w_top/2, 0, 0]) cylinder(r=p2_diam/2, h=plate_thickness+.5, center=true);
		translate([i*p2_w_bottom/2, -p2_l, 0]) cylinder(r=p2_diam/2, h=plate_thickness+.5, center=true);
		
		// tarot fixation
		translate([i*t_w/2, t_offset, 0]) chanfrain();
		translate([i*t_w/2, -t_l+t_offset, 0]) chanfrain();
		
		// cables holes
		translate([0, -24, 0]) translate([0, i*15, 0]) scale([1, 1.1, 1]) cylinder(r=20/2, h=plate_thickness+.5, center=true, $fn=80);
	}
}

module chanfrain()
{
	translate([0, 0, -1.55]) cylinder(r1=5.5/2, r2=2.7/2, h=1.55);
	translate([0, 0, -1.45]) cylinder(r=2.7/2, h=3);
}

module tx()
{
	hull() for(i=it) for(j=it) translate([i*(tx_w-3)/2, 0, 0]) translate([0, j*(tx_l-3)/2, 0]) cylinder(r=1.5, h=3, center=true);
	
	translate([0, tx_l/2+4, 0])  cube([(24.7-8)*2, 8+20, 3], true);
	for(i=it) translate([i*24.7, tx_l/2+7.9, 0]) difference()
	{
		translate([i*-8/2, -8/2, 0]) cube([8, 8, 3], true);
		cylinder(r=8, h=3.1, center=true);
	}
	
	// support IC
	translate([-tx_w/2+5, tx_l/2-3.5, 1.5+tx_h/2]) cube([8, 5, tx_h], true);
	translate([tx_w/2-13.5, 0, 1.5+(tx_h-1)/2]) cube([5, tx_l-4, tx_h-1], true);
}

module tx_void()
{
	// left rubban
	translate([tx_w/2-tx_rubban_w/2-16.5, 0, 0]) 
	{
		translate([0, 0, -1]) cube([tx_rubban_w, tx_l+.5, 1.05], true);
		translate([0, tx_l/2+1.7, 0]) cube([tx_rubban_w, 3, 3.5], true);
		translate([0, tx_l/2+.2, -1]) rotate([45, 0, 0]) cube([tx_rubban_w, 2, 2], true);
		translate([0, -tx_l/2, -1]) rotate([45, 0, 0]) cube([tx_rubban_w, 2, 2], true);
	}
	// right rubban
	translate([-tx_w/2+tx_rubban_w/2+2, 0, 0]) 
	{
		translate([0, 0, -1]) cube([tx_rubban_w, tx_l+.5, 1.05], true);
		translate([0, tx_l/2+1.5, 0]) cube([tx_rubban_w, 3, 3.5], true);
		translate([0, tx_l/2+.2, -1]) rotate([45, 0, 0]) cube([tx_rubban_w, 2, 2], true);
		translate([0, -tx_l/2, -1]) rotate([45, 0, 0]) cube([tx_rubban_w, 2, 2], true);
	}
}

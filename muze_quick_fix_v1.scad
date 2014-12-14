// Quick fix for muze

$fn=20;
it=[-1,1];

g_length=41.4;
g_width=17;
g_height=6.5;
g_th=3;

s_length=6;
s_width=4.5;
s_height=12;
s_th=3;

quickfix();

module quickfix()
{
	difference()
	{
		quickfix_plain();
		quickfix_void();
	}
	
	//gopro
	*%translate([0, -21/2-2, 3]) cube([41+6, 3, 59+6], true);
	%translate([7, -21/2+7, 17]) rotate([0, 90, 0]) gg_gopro_camera_H3();
	*%translate([.25, 78.6, -3.25]) rotate([0, 0, -90]) import("gopro-h32d-mount.stl");
}

module quickfix_plain()
{
	// gopro
	cube([g_length+g_th*2, g_width+g_th, g_height], true);
	
	//screw fix
	for(i=it) translate([i*(g_length+g_th*2)/2, -(s_width+s_th*2)/2-(g_width+g_th)/2+2.45, 0])
	{
		translate([0, 0, (s_height+s_th)/2-g_height/2]) cube([s_length, s_width+s_th*2, s_height+s_th], true);
		translate([0, (s_width+s_th*2)/2, 0]) rotate([0, 0, 45]) cube([s_length/1.5, s_length/1.5, g_height], true);
		hull()
		{
			translate([i==1?s_length/2+2:-(s_length/2+2), -(s_width+s_th)/2, -(s_height+s_th)/2+10]) cube([4, s_th, 7], true);
			translate([i*2, -(s_width+s_th)/2, (s_height+s_th)/2-g_height/2-s_height/2-s_th/2+.05]) cube([s_length, s_th, .1], true);
			translate([0, -(s_width+s_th)/2, (s_height+s_th)/2]) cube([s_length, s_th, .1], true);
		}
	}
}

module quickfix_void()
{
	// gopro
	translate([0, -g_th/2-.02, 0]) cube([g_length, g_width, g_height+1], true);
	for(i=it) translate([i*(g_length+g_th*2)/2, (g_width+g_th)/2, 0]) rotate([0, 0, 45]) cube([3, 3, g_height+1], true);
	
	//screw fix
	for(i=it) translate([i*(g_length+g_th*2)/2, -(s_width+s_th*2)/2-(g_width+g_th)/2+2.4, (s_height+s_th)/2-g_height/2])
	{
		difference()
		{
			translate([0, 0, -g_th/2-.02]) cube([s_length+10, s_width, s_height], true);
			
			translate([i*1.25, -1, -s_height/2-s_th/22-3/2+.1365+3]) rotate([90, 0, 0]) cylinder(r=3/2, h=2, center=false, $fn=10);
			translate([i*1.25, -1.8, -s_height/2-s_th/22-3/2+.1365+3]) rotate([90, 0, 0]) cylinder(r1=3/2, r2=3.5/2, h=.8, center=false, $fn=10);
			
			translate([i*s_length/4, 2, -s_height/2+5.8]) cube([s_length/2, 2, 3], true);
			hull()
			{
				translate([i*s_length/4, 2, -s_height/2+8.8]) cube([s_length/2, 2, 3], true);
				translate([0, 2, s_height/2-2]) cube([s_length, 2, 3], true);
			}
			translate([0, -s_width/2, (s_height-s_th)/2]) rotate([45, 0, 0]) cube([s_length, 1, 1], true);
			translate([0, s_width/2-1.25, (s_height-s_th)/2]) rotate([45, 0, 0]) cube([s_length, 1, 1], true);
		}
		for(i=it) translate([0, i*(s_width+s_th*2)/2, (s_height+s_th)/2]) rotate([45, 0, 0]) cube([s_length+1, 2.5, 2.5], true);
	}
}

module gg_gopro_camera_H3() 
{
    //main body
	translate([-15.2,-10.5,-27.5]) cube([59,21,41]);
	
    //lens
	translate([0,20,0]) rotate(a=[90,0,0]) cylinder(h=25, r=11.5, $fn=64);
}

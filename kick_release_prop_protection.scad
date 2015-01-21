$fn=20;
fn1=100;
it=[-1,1];
holes_angle=-44.75;

*%translate([0, -13/2, 0])rotate([-90, 0, 0]) translate([0, -40.375, -.32]) import("kickremove_prop_protect_female.stl");

kickr();

module kickr()
{
  difference()
  {
    kickr_plain();
    kickr_void();
  }
}

module kickr_plain()
{
  // click
  hull()
  {
    translate([0, 0, .5]) cube([29, 12, 1], true);
    translate([0, 0, 1.5]) cube([31, 13, 1], true);
    for(i=it) translate([i*(31/2-4), 0, 11]) rotate([90, 0, 0]) cylinder(r=4, h=13, center=true);
    translate([0, 0, 18]) cube([19, 13, 1], true);
  }
  translate([-.5, 0, 26]) cube([23, 13, 20], true);
  hull()
  {
    translate([0, 0, 32]) cube([19, 13, 1], true);
    for(i=it) translate([i*(31/2-4), 0, 39]) rotate([90, 0, 0]) cylinder(r=4, h=13, center=true);
  }
  
  // motor
  intersection()
  {
    union()
    {
      translate([0, 7.5+2.5, 41.2/2+3.4]) rotate([90, 0, 0]) cylinder(r1=47/2, r2=48/2, h=1, center=true, $fn=fn1);
      translate([0, 7, 41.2/2+3.4]) rotate([90, 0, 0]) cylinder(r=48/2, h=5, center=true, $fn=fn1);
    }
    translate([0, 7.5, 3]) cube([54, 6.1, 42], true);
  }
  // screw head
  translate([0, 7.5, 25.8-1.75]) rotate([0, holes_angle, 0]) for(i=it) 
  {
    translate([-19/2, 0, 0]) rotate([90, 0, 0]) cylinder(r=5.3/2, h=2, center=true);
    translate([0, 0, i*16/2]) rotate([90, 0, 0]) cylinder(r=5.3/2, h=2, center=true);
  }
  hull()
  {
    translate([0, 7, 20]) cube([48, 5, 8], true);
    translate([0, 10, 20]) cube([46, 1, 8], true);
    translate([0, 7, 17]) cube([42.5, 5, 8], true);
    translate([0, 10, 17]) cube([40.5, 1, 8], true);
  }
  hull()
  {
    translate([0, 7.5, 3.25]) cube([20, 6, 1], true);
    translate([0, 7.5, 1]) cube([15, 6, 2], true);
  }

  hull()
  {
    translate([0, 5.5, 23]) cube([48, 2, 1], true);
    translate([0, 5.5, 30]) cube([31, 2, 1], true);
  }

  hull()
  {
    translate([0, 5.5, 30]) cube([31, 2, 1], true);
    translate([0, 5.5, 36.5]) cube([29.5, 2, 1], true);
  }
  
  // holes
  translate([0, -5.5, 25.8-1.75]) rotate([0, holes_angle, 0]) for(i=it) 
  {
    translate([-19/2, 0, 0]) rotate([0, -holes_angle, 0]) rotate([90, 0, 0]) cylinder(r=9/2, h=2, center=true);
    translate([0, 0, i*16/2]) rotate([0, -holes_angle, 0]) rotate([90, 0, 0]) cylinder(r=9/2, h=2, center=true);
  }
}

module kickr_void()
{
  // click
  difference()
  {
    hull()
    {
      translate([0, .4, .045]) cube([28, 8.2, .1], true);
      translate([0, .4, 1]) cube([25, 8.2, 1], true);
    }
    for(i=it) translate([i*5.25, 3, 8])cube([3, 3, 16], true);
  }
  difference()
  {
    translate([0, .4, 20]) cube([25, 8.2, 41], true);
    for(i=it) translate([i*5.25, 3, 8]) cube([3, 3, 16], true);
  }
  translate([0, 0, 42]) cube([32, 13.1, 4], true);
  for(i=it) translate([i*16, 0, 41]) rotate([0, 45, 0]) cube([4, 20, 4], true);
  for(i=it) translate([i*15.5, 0, 41.15]) mirror([i==1?0:1, 0, 0]) for(j=it) translate([0, j*7, 0]) rotate([0, 45, j*45]) cube([4, 4, 4], true);

    
  // motor
  difference()
  {
    union()
    {
      translate([0, 7.5+2, 41.2/2+3.54]) rotate([90, 0, 0]) cylinder(r=41.2/2, h=6, center=true, $fn=fn1);
      translate([0, 10.05, 41.2/2+3.54]) rotate([90, 0, 0]) cylinder(r1=42/2, r2=41.2/2, h=1, center=true, $fn=fn1);
    }
    // screw head
    translate([0, 7.5, 25.8-1.75]) rotate([0, holes_angle, 0])
    {
      for(i=it) translate([i*19/2, 0, 0]) difference()
      {
        rotate([90, 0, 0]) cylinder(r=5.3/2, h=2, center=true);
        rotate([0, -holes_angle, 0]) translate([0, .4, -1.19])  rotate([45, 0, 0]) translate([0, 0, -2]) cube([6, 4, 4], true);
      }
      for(i=it) translate([0, 0, i*16/2]) difference()
      {
        rotate([90, 0, 0]) cylinder(r=5.3/2, h=2, center=true);
        rotate([0, -holes_angle, 0]) translate([0, .4, -1.19])  rotate([45, 0, 0]) translate([0, 0, -2]) cube([6, 4, 4], true);
      }
    }
  }
  for(i=it) translate([i*20, 8.55, 25]) rotate([0, 45, 0]) cube(4.1, true);
  translate([0, -5, 42]) rotate([90, 0, 0]) cylinder(r=8, h=5, center=true, $fn=fn1);
  translate([0, 4.5, 42]) scale([1, 1, .96]) rotate([90, 0, 0]) cylinder(r=11, h=8, center=true, $fn=fn1);
  difference()
  {
    translate([0, 5.8, 42]) rotate([3, 0, 0]) scale([1, 1, 1.2]) rotate([90, 0, 0]) cylinder(r=11, h=1.2, center=true, $fn=fn1);
    // screw head
    translate([0, 7.5, 25.8-1.75]) rotate([0, holes_angle, 0]) translate([0, 0, 16/2]) rotate([90, 0, 0]) cylinder(r=5.3/2, h=5, center=true);
  }

  // holes
  translate([0, 0, 25.8-1.75]) rotate([0, holes_angle, 0]) for(i=it)
  {
    translate([-19/2, 0, 0]) rotate([90, 0, 0]) cylinder(r=3.1/2, h=30, center=true);
    translate([0, 0, i*16/2]) rotate([90, 0, 0]) cylinder(r=3.1/2, h=30, center=true);
  }
  // screw head
  translate([0, 5.09, 25.8-1.75]) rotate([0, holes_angle, 0]) for(i=it) 
  {
    translate([-19/2, 0, 0]) rotate([90, 0, 0]) cylinder(r=5.6/2, h=1.21, center=true);
    translate([0, 0, i*16/2]) rotate([90, 0, 0]) cylinder(r=5.6/2, h=1.2, center=true);
  }
  translate([0, 3.1, 25.8-1.75]) rotate([0, holes_angle, 0])
  {
    translate([-19/2, 0, 0]) rotate([90, 0, 0]) cylinder(r=5.6/2, h=4, center=true);
    translate([0, 0, -16/2]) rotate([90, 0, 0]) cylinder(r=5.6/2, h=4, center=true);
  }
  translate([0, -5, 25.8-1.75]) rotate([0, holes_angle, 0]) for(i=it)
  {
    translate([-19/2, 0, 0]) rotate([90, 0, 0]) cylinder(r=5.8/2, h=5.3, center=true);
    translate([0, 0, i*16/2]) rotate([90, 0, 0]) cylinder(r=5.8/2, h=5.3, center=true);
  }
}

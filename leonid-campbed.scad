tubelen = 45;
toprad = 45;
btmrad = 10;

ringsz = 2;


module tubes() {
color("green")
translate([0,-13-ringsz,0])
rotate([-90,0,0])
union() {
    difference() {
        cylinder(tubelen+ringsz+4, 22/2, 22/2);
        cylinder(tubelen+tubelen, 16/2, 16/2);

    }
    // inner ring
    translate([0,0,-1+ringsz])
    difference() {
    cylinder(ringsz, 22/2, 22/2);
    cylinder(ringsz, 9/2, 9/2);
    }
}

module bottomDiff() {
    // bottom diff
    rotate([-90-toprad,0,0])
    translate([0,0,-50])
    cylinder(100, 16/2, 16/2);
}

color("gray")
translate([0,tubelen/2*.8/*tubelen%toprad*/,0])
rotate([toprad,0,0])
difference()
{
    union() {
        difference() {
            cylinder(tubelen, 22/2, 22/2);
            cylinder(tubelen, 16/2, 16/2);
            
        }
        //inner ring
        translate([0,0,20])
        difference() {
            cylinder(ringsz, 22/2, 22/2);
            cylinder(ringsz, 13/2, 16/2);
        }
    }
    bottomDiff();
}
}


module bottomcolumn() {
color("red") {
    difference() {
        union()
        {        
            //center
            translate([-5/2,-10,-25])
            cube([5, tubelen-ringsz, 25]);
            
            //edges
            cnt = 3;
            w = 17;
            gap = (tubelen+13 - cnt*w) / (cnt -1);
            
            for (i = [0:cnt-1])
            {
                translate([-w/2, i*(w + gap)-12,-25])
                cube([w, 4, 25]); 
            }
        }
        
    rotate([-90,0,0])
    translate([0,0,-60])
    cylinder(100, 16/2, 16/2);
    }
}
}



module bottom() {
//bottom
color("yellow")
//translate([30,0,-0])
translate([-27/2,-13,-28])
difference() {
cube([27, tubelen+5, 5]);

cnt = 8;
w = 1;
gap = (tubelen - cnt*w) / (cnt -1);

for (i = [0:cnt-1])
{
    translate([-tubelen, i*(w + gap)+3,0])
    rotate([0,90,0])
    cylinder(tubelen*2, w,w); 
}
}
}

bottom();
rotate([2,0,0]) {
bottomcolumn();
tubes();
}





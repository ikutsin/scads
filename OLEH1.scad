scale(2.1) 

{
linear_extrude(1.6)
text("OՈӘΧ", font="courier new:style=Bold");


    color("red")
   translate([0,0,0.3])
   {
    scale([6, .4, 1])
    translate([-1.5,5,0])
    linear_extrude(1)
    text("ϟ", font="courier new:style=Bold");
    
    
    linear_extrude(1)
    translate([-8,0,0])
    text("ꝏ", font="tahoma");
    }

}

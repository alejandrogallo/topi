include <constants.scad>;

module ThinkpadUSB() {
  // src: https://support.lenovo.com/de/en/solutions/pd026745
  echo("Drawing ThinkpadUSB");
  keyboard_length = 305.5;
  keyboard_width = 164;
  keyboard_height = 13.5;
    union(){
      color("black")
        cube([keyboard_length, keyboard_width, keyboard_height]);
      // Trackpoint
      color("red")
        translate([keyboard_length/2, 0.2*keyboard_width, 0])
        cylinder(h=keyboard_height+1, r=4, center = [0, 0]);
    }
}

ThinkpadUSB();

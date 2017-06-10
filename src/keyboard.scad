include <constants.scad>;

module ThinkpadUSB() {
  // src: https://support.lenovo.com/de/en/solutions/pd026745
  keyboard_length = 305.5;
  keyboard_width = 164;
  keyboard_height = 13.5;
  translate([0.5 * (basis_width - keyboard_length), 0, 0])
    union(){
      color("black")
        translate([0, 0, main_body_thickness])
        cube([keyboard_length, keyboard_width, keyboard_height]);
      // Trackpoint
      color("red")
        translate([keyboard_length/2, 0.2*keyboard_width, main_body_thickness])
        cylinder(h=keyboard_height+1, r=4, center = [0, 0]);
    }
}

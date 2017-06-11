use <basis.scad>;
use <top.scad>;
use <rpi.scad>;
use <sides.scad>;
use <keyboard.scad>;
include <constants.scad>;

Basis();
RaspberryPi();

translate([-thickness_1, 0, 0])
  LeftSide();
translate([basis_width, 0, 0])
  RightSide();
translate([-thickness_1, -thickness_1, 0])
  BackSide();
translate([-thickness_1, -thickness_1, 0])
  translate([0, basis_depth + thickness_1, 0])
  FrontSide();
translate([0, 0, main_body_thickness])
  translate([-thickness_1, -thickness_1, 0])
  Top();

translate([0.5 * (basis_width - keyboard_length), 0, 0])
  translate([0, 0, main_body_thickness])
  ThinkpadUSB();


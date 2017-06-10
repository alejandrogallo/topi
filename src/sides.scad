include <constants.scad>;

module PrimitiveLeftRightSide(args) {
  cube([thickness_1, basis_depth, main_body_thickness]);
}

module PrimitiveBackFrontSide(args) {
  cube([basis_width + 2*thickness_1, thickness_1, main_body_thickness]);
}

module LeftSide() {
  translate([-thickness_1, 0, 0])
    PrimitiveLeftRightSide();
}

module RightSide() {
  translate([basis_width, 0, 0])
    PrimitiveLeftRightSide();
}

module BackSide() {
  translate([-thickness_1, -thickness_1, 0])
    PrimitiveBackFrontSide();
}

module FrontSide() {
  translate([-thickness_1, -thickness_1, 0])
    translate([0, basis_depth + thickness_1, 0])
    PrimitiveBackFrontSide();
}

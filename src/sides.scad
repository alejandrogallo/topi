include <constants.scad>;

module PrimitiveLeftRightSide(args) {
  cube([thickness_1, basis_depth, main_body_thickness]);
}

module PrimitiveBackFrontSide(args) {
  cube([basis_width + 2*thickness_1, thickness_1, main_body_thickness]);
}

module LeftSide() {
  echo("Drawing left side");
  PrimitiveLeftRightSide();
}

module RightSide() {
  echo("Drawing right side");
  PrimitiveLeftRightSide();
}

module BackSide() {
  echo("Drawing back side");
  PrimitiveBackFrontSide();
}

module FrontSide() {
  echo("Drawing front side");
  PrimitiveBackFrontSide();
}

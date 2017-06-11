include <constants.scad>;

module PrimitiveLeftRightSide(args) {
  cube([thickness_1, basis_depth, main_body_thickness]);
}

module PrimitiveBackFrontSide(args) {
  cube([basis_width + 2*thickness_1, thickness_1, main_body_thickness]);
}

module LeftSide() {
  PrimitiveLeftRightSide();
}

module RightSide() {
  PrimitiveLeftRightSide();
}

module BackSide() {
  PrimitiveBackFrontSide();
}

module FrontSide() {
  PrimitiveBackFrontSide();
}

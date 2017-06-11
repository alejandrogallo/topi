include <constants.scad>;

module GridArray(args) {
  for (i = [1:10]) {
    for (j = [1:10]) {
      translate([i*20, j*20, 0]) 
        cylinder(h = 250, d = basis_grid_screw_diameter, center = [0, 0]);
    }
  }
}

module Basis() {
  echo("Rendering the basis");
  difference() {
    cube([basis_width, basis_depth, basis_height]);
    GridArray();
  };
}

Basis();

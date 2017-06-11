use <common.scad>;

module LeftSide() {
  echo("Drawing left side");
  PrimitiveLeftRightSide();
}

PROJECTION = false;

if (PROJECTION == "x") {
  projection(cut=false)
    rotate(90, [0, 1, 0])
    LeftSide();
} else if (PROJECTION == "z") {
  projection(cut=false)
    LeftSide();
} else if (PROJECTION == "y") {
  projection(cut=false)
      rotate(90, [1, 0, 0])
      rotate(180, [0, 1, 0])
      LeftSide();
} else {
  LeftSide();
}

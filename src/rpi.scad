
module RaspberryPi() {
  mirror()
  translate([0, 0, 5])
  translate([50, 0, 0])
  translate([0, -40, 0])
  color("red")
    import("../lib/raspberry_pi_b_board/B+_Model_v4.stl", center=false);
}

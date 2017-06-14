module LcdPanel(lcd_size = 14) {
  lcd_thickness = 10;
  // src https://en.wikipedia.org/wiki/Display_size
  lcd_width = 280;
  lcd_height = 220;
  cube([lcd_width, lcd_height, lcd_thickness]);
}

LcdPanel();

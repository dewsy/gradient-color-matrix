class Cell {
  String colorValue = "255,255,255";
  int size = 30;
  String message = null;

  Cell();
  Cell.withColor(this.colorValue);
  Cell.withMessage(this.message);
}

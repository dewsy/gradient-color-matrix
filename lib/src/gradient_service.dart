import 'package:angular_app/src/model/cell.dart';

class GradientService {
  static final int PRIMARYCOLOR = 255;

  int _calculateSteps(int n) {
    return (n * 2) - 2;
  }

  List<String> _getColors(int n) {
    List<String> colorValues = [];
    int steps = _calculateSteps(n);
    for (int i = 0; i <= steps; i++) {
      String gradientValue = (PRIMARYCOLOR * (i / steps)).toString();
      String value = '${PRIMARYCOLOR.toString()},$gradientValue,$gradientValue';
      colorValues.add(value);
    }
    return colorValues;
  }

  List<Cell> createGradient(int n) {
    List<Cell> gradient = List();
    List<String> colorValues = _getColors(n);
    for (String value in colorValues) {
      gradient.add(Cell(value));
    }
    return gradient;
  }
}

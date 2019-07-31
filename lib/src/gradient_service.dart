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

  List<List<Cell>> createGradient(int n) {
    List<List<Cell>> gradient = List(n);
    List<String> colorValues = _getColors(n);
    for (int i = 0; i < n; i++) {
      List<Cell> row = List(n);
      for (int k = 0; k < n; k++) {
        row[k] = Cell(colorValues[k + i]);
      }
      gradient[i] = row;
    }
    return gradient;
  }
}

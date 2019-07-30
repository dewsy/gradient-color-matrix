import 'package:angular_app/src/model/cell_component.dart';

class GradientService {
  static final int PRIMARYCOLOR = 255;

  int _calculateSteps(int n) {
    return n * 2 - 2;
  }

  List<String> _getColors(int n) {
    List<String> colorValues = [];
    int steps = _calculateSteps(n);
    for (int i = 0; i <= steps; i++) {
      String gradientValue = (PRIMARYCOLOR / i / steps).toString();
      String value = '${PRIMARYCOLOR.toString()},$gradientValue,$gradientValue';
      print(value);
      colorValues.add(value);
    }
    return colorValues;
  }

  List<List<CellComponent>> createGradient(int n) {
    int counter = 0;
    List<List<CellComponent>> gradient = List.filled(n, List(n));
    List<String> colorValues = _getColors(n);
    gradient.forEach((row) {
      for (int i = 0; i < n; i++) {
        row[i] = CellComponent(colorValues[i + counter]);
      }
      counter++;
    });
    return gradient;
  }
}

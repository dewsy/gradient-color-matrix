import 'package:angular_app/src/model/cell.dart';

class GradientService {
  static final int PRIMARYCOLOR = 255;

  int _calculateSteps(int n) {
    return (n * 2) - 2;
  }

  List<String> _getColors(int n) {
    List<String> colorValues = [];
    int steps = _calculateSteps(n);
    for (int i = steps; i >= 0; i--) {
      String gradientValue = (PRIMARYCOLOR * (i / steps)).toString();
      String value = '${PRIMARYCOLOR.toString()},$gradientValue,$gradientValue';
      colorValues.add(value);
    }
    return colorValues;
  }

  List<List<Cell>> createGradient(int n) {
    List<int> horC = [64];
    List<List<Cell>> gradient = List(n + 1);
    gradient[0] = _createVerticalMarkers(n);
    List<String> colorValues = _getColors(n);
    for (int i = 0; i < n; i++) {
      List<Cell> row = List(n + 1);
      horC = _createHorizontalMarkerCodes(horC);
      row[0] = Cell.withMessage(String.fromCharCodes(horC.reversed.toList()));
      for (int k = 0; k < n; k++) {
        row[k + 1] = Cell.withColor(colorValues[k + i]);
      }
      gradient[i + 1] = row;
    }
    return gradient;
  }

  List<Cell> _createVerticalMarkers(int n) {
    List<Cell> marker = List(n + 1);
    marker[0] = Cell();
    for (int i = 1; i < marker.length; i++) {
      marker[i] = Cell.withMessage(i.toString());
    }
    return marker;
  }

  List<int> _createHorizontalMarkerCodes(List<int> horizontalCharCodes) {
    for (int i = 0; i < horizontalCharCodes.length; i++) {
      if (horizontalCharCodes[i] < 90) {
        horizontalCharCodes[i]++;
        break;
      } else {
        horizontalCharCodes[i] = 65;
        if (i + 1 == horizontalCharCodes.length) {
          horizontalCharCodes.add(65);
          break; //the add(65) makes it run one extra time without this
        }
      }
    }
    return horizontalCharCodes;
  }
}

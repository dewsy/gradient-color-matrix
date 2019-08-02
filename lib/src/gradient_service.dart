import 'package:angular_app/src/model/cell.dart';

class GradientService {
  static final int PRIMARYCOLOR = 255;
  List<int> horizontalCharCodes = [64];

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
    List<List<Cell>> gradient = List(n + 1);
    gradient[0] = _createVerticalMarker(n);
    List<String> colorValues = _getColors(n);
    for (int i = 0; i < n; i++) {
      List<Cell> row = List(n + 1);
      row[0] = Cell.withMessage(_createHorizontalMarkerString());
      for (int k = 0; k < n; k++) {
        row[k + 1] = Cell.withColor(colorValues[k + i]);
      }
      gradient[i + 1] = row;
    }
    horizontalCharCodes = [64];
    return gradient;
  }

  List<Cell> _createVerticalMarker(int n) {
    List<Cell> marker = List(n + 1);
    marker[0] = Cell();
    for (int i = 1; i < marker.length; i++) {
      marker[i] = Cell.withMessage(i.toString());
    }
    return marker;
  }

  String _createHorizontalMarkerString() {
    bool gotIncremented = false;
    for (int i = 0; i < horizontalCharCodes.length; i++) {
      if (gotIncremented) {
        break;
      }
      if (horizontalCharCodes[i] < 90) {
        horizontalCharCodes[i]++;
        gotIncremented = true;
      } else {
        horizontalCharCodes[i] = 65;
      }
    }
    if (!gotIncremented) {
      horizontalCharCodes.add(65);
    }
    return String.fromCharCodes(horizontalCharCodes.reversed.toList());
  }
}

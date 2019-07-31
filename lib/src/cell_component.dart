import 'package:angular/core.dart';
import 'model/cell.dart';

@Component(selector: 'cell', template: '''
<div style="width:{{getSizeProperty()}};height:{{getSizeProperty()}};background-color: {{getColorProperty()}};">{{message}}</div>
''')
class CellComponent {
  int size = 30;

  String message = null;

  @Input()
  Cell cell;

  String getSizeProperty() => size.toString() + "px";
  String getColorProperty() => "rgb(${cell.colorValue})";
}

import 'package:angular/core.dart';

@Component(selector: 'cell', template: '''
<div style="width:{{getSizeProperty()}};height:{{getSizeProperty()}};background-color: {{getColorProperty()}};">{{message}}</div>
''')
class CellComponent {
  int size = 30;
  String colorValue;
  String message = null;

  CellComponent(this.colorValue);

  String getSizeProperty() => size.toString() + "px";
  String getColorProperty() => "gb($colorValue)";
}

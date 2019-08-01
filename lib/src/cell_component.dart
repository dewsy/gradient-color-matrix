import 'package:angular/core.dart';
import 'model/cell.dart';

@Component(selector: 'cell', template: '''
<div style="width:{{getSizeProperty()}};height:{{getSizeProperty()}};background-color: {{getColorProperty()}};text-align: center; vertical-align: middle; line-height: {{cell.size}}px;">{{cell.message}}</div>
''')
class CellComponent {
  @Input()
  Cell cell;

  String getSizeProperty() => cell.size.toString() + "px";
  String getColorProperty() => "rgb(${cell.colorValue})";
}

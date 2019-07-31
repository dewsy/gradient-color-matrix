import 'package:angular/angular.dart';
import 'package:angular_app/src/gradient_service.dart';
import 'package:angular_app/src/cell_component.dart';
import 'package:angular_app/src/model/cell.dart';

@Component(
    selector: 'gradient',
    templateUrl: "gradient_component.html",
    directives: [coreDirectives, CellComponent],
    providers: [ClassProvider(GradientService)])
class GradientComponent implements OnInit {
  final GradientService _gradientService;
  GradientComponent(this._gradientService);

  int n = 20;

  List<List<Cell>> gradient;
  void ngOnInit() => _getGradient();

  void _getGradient() {
    gradient = _gradientService.createGradient(n);
  }
}

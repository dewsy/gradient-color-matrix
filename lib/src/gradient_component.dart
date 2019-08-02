import 'package:angular/angular.dart';
import 'package:angular_app/src/gradient_service.dart';
import 'package:angular_app/src/cell_component.dart';
import 'package:angular_app/src/model/cell.dart';

@Component(
    selector: 'gradient',
    templateUrl: "gradient_component.html",
    directives: [coreDirectives, CellComponent],
    providers: [ClassProvider(GradientService)])
class GradientComponent implements OnInit, AfterChanges {
  final GradientService _gradientService;
  GradientComponent(this._gradientService);

  @Input()
  int size;

  List<List<Cell>> gradient;
  void ngOnInit() => _getGradient();

  void ngAfterChanges() => _getGradient();

  void _getGradient() {
    gradient = _gradientService.createGradient(size);
  }
}

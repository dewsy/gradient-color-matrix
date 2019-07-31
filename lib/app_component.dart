import 'package:angular/angular.dart';
import 'package:angular_app/src/gradient_service.dart';
import 'package:angular_app/src/cell_component.dart';
import 'package:angular_app/src/model/cell.dart';

@Component(
    selector: 'my-app',
    templateUrl: "app_component.html",
    directives: [coreDirectives, CellComponent],
    providers: [ClassProvider(GradientService)])
class AppComponent implements OnInit {
  final GradientService _gradientService;
  AppComponent(this._gradientService);
  int n = 10;
  List<Cell> gradient;
  void ngOnInit() => _getGradient();
  
  void _getGradient() {
    gradient = _gradientService.createGradient(n);
    gradient.forEach((cell) => print(cell.colorValue));
  }
}

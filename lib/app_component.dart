import 'package:angular/angular.dart';
import 'package:angular_app/src/gradient_service.dart';
import 'package:angular_app/src/model/cell_component.dart';

@Component(
    selector: 'my-app',
    templateUrl: "app_component.html",
    directives: [coreDirectives, CellComponent],
    providers: [ClassProvider(GradientService)])
class AppComponent implements OnInit {
  final GradientService _gradientService;
  AppComponent(this._gradientService);
  int n = 20;
  List<List<CellComponent>> gradient;
  void ngOnInit() => _getGradient();

  List<List<CellComponent>> _getGradient() => _gradientService.createGradient(n);
}

import 'package:angular/angular.dart';
import 'package:angular_app/src/gradient_service.dart';
import 'package:angular_app/src/cell_component.dart';
import 'package:angular_app/src/input_component.dart';
import 'src/gradient_component.dart';

@Component(
    selector: 'my-app',
    templateUrl: "app_component.html",
    directives: [coreDirectives, CellComponent, GradientComponent, InputComponent],
    providers: [ClassProvider(GradientService)])
class AppComponent {}

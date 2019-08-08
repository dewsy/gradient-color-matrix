import 'package:angular/angular.dart';
import 'package:angular_app/src/cell_component.dart';
import 'package:angular_forms/angular_forms.dart';
import 'src/gradient_component.dart';

@Component(selector: 'my-app', templateUrl: "app_component.html", directives: [
  coreDirectives,
  formDirectives,
  CellComponent,
  GradientComponent,
])
class AppComponent {
  int size = 20;
  int sizeInput = null;
  bool isSizeRight = true;

  void onSubmit() {
    if (sizeInput < 2 || sizeInput > 100) {
      isSizeRight = false;
    } else {
      isSizeRight = true;
      size = sizeInput;
    }
  }
}

import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';

@Component(
  selector: 'size-input',
  template: '''
      <input [(ngModel)]="size" placeholder="20">
  ''',
  directives: [formDirectives],
)
class InputComponent {
  int size = 20;
}

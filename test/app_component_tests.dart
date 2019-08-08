import 'package:angular_app/app_component.dart';
import 'dart:html';
import 'package:test/test.dart';

void main() {
  AppComponent appComponent = AppComponent();

/*
  final testBed =
      NgTestBed.forComponent<AppComponent>(ng.AppComponentNgFactory);
  NgTestFixture<AppComponent> fixture;

  setUp(() async {
    fixture = await testBed.create();
  });

  tearDown(disposeAnyRunningTest);

  */

  test('template test', () {
    appComponent.sizeInput = 1;
    appComponent.onSubmit();
    expect(appComponent.size, equals(20));
  });
}

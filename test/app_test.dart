@TestOn('browser')

import 'package:angular_test/angular_test.dart';
import 'package:angular_app/app_component.dart';
import 'package:angular_app/app_component.template.dart' as ng;
import 'package:test/test.dart';

void main() {
  final testBed =
      NgTestBed.forComponent<AppComponent>(ng.AppComponentNgFactory);
  NgTestFixture<AppComponent> fixture;

  setUp(() async {
    fixture = await testBed.create();
  });

  tearDown(disposeAnyRunningTest);

  test('Check for default size', () {
    expect(fixture.assertOnlyInstance.size, 20);
  });

  test('Check for too low input value', () async {
    await fixture.update((c) => c.size = 1);
    fixture.assertOnlyInstance.onSubmit();
    expect(fixture.assertOnlyInstance.isSizeRight, false);
  });

  test('Check for too high input value', () async {
    await fixture.update((c) => c.size = 101);
    fixture.assertOnlyInstance.onSubmit();
    expect(fixture.assertOnlyInstance.isSizeRight, false);
  });
}

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
    expect(fixture.assertOnlyInstance.size, equals(20));
  });

  test('Check validation on too low input value', () async {
    await fixture.update((c) => c.sizeInput = 1);
    await fixture.assertOnlyInstance.onSubmit();
    expect(fixture.assertOnlyInstance.isSizeRight, equals(false));
  });

  test('Check validation on right low input value', () async {
    await fixture.update((c) => c.sizeInput = 30);
    await fixture.assertOnlyInstance.onSubmit();
    expect(fixture.assertOnlyInstance.isSizeRight, equals(true));
  });
  test('Check validation on too high input value', () async {
    await fixture.update((c) => c.sizeInput = 101);
    await fixture.assertOnlyInstance.onSubmit();
    expect(fixture.assertOnlyInstance.isSizeRight, equals(false));
  });
}

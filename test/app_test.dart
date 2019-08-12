@TestOn('browser')
import 'package:angular_app/src/gradient_service.dart';
import 'package:angular_app/src/model/cell.dart';
import 'package:angular_test/angular_test.dart';
import 'package:angular_app/app_component.dart';
import 'package:angular_app/app_component.template.dart' as ng;
import 'package:test/test.dart';

// pub run build_runner test -- -p chrome
void main() {
  final GradientService gradientService = GradientService();

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

  test('Check validation on correct input value', () async {
    await fixture.update((c) => c.sizeInput = 30);
    await fixture.assertOnlyInstance.onSubmit();
    expect(fixture.assertOnlyInstance.isSizeRight, equals(true));
  });
  test('Check validation on too high input value', () async {
    await fixture.update((c) => c.sizeInput = 101);
    await fixture.assertOnlyInstance.onSubmit();
    expect(fixture.assertOnlyInstance.isSizeRight, equals(false));
  });

  test('GradinetService list of lists size check', () {
    var list = gradientService.createGradient(5);
    expect(list.length, 6);
  });

  test('GradinetService list of cells size check', () {
    var list = gradientService.createGradient(5);
    expect(true, list.every((listOfCell) => listOfCell.length == 6));
  });

  test('Checking for correct primary color', () {
    var list = gradientService.createGradient(5);
    expect(true, list.every((listOfCell) {
      return listOfCell.every((cell) => cell.colorValue.startsWith('255,'));
    }));
  });

  test('Vertical marker correct messages test', () {
    bool areMessagesGood = true;
    var list = gradientService.createVerticalMarkers(5);
    areMessagesGood = list[0].message == null ? true : false;
    for (int i = 1; i < list.length; i++) {
      if (list[i].message != i.toString()) {
        areMessagesGood == false;
      }
    }
    expect(true, areMessagesGood);
  });

  test("Step calculator test on lowest number", () {
    expect(2, gradientService.calculateSteps(2));
  });

  test("Step calculator test on highest number", () {
    expect(198, gradientService.calculateSteps(100));
  });

  test("Step calculator test on default number", () {
    expect(38, gradientService.calculateSteps(20));
  });

  test("Calculating gradient colors test", () {
    var list = gradientService.getColors(4);
    expect(list.toString(),
        "[255,255,255, 255,212.5,212.5, 255,170,170, 255,127.5,127.5, 255,85,85, 255,42.5,42.5, 255,0,0]");
  });

  test("Check first horizontal marker", () {
    var list = gradientService.createHorizontalMarkerCodes([64]);
    expect(list.toString(), "[65]");
  });

  test("Check second horizontal marker", () {
    var list = gradientService.createHorizontalMarkerCodes([65]);
    expect(list.toString(), "[66]");
  });

  test("Check stepping up to two letters", () {
    var list = gradientService.createHorizontalMarkerCodes([90]);
    expect(list.toString(), "[65, 65]");
  });

  test("Check incrementing two letters", () {
    var list = gradientService.createHorizontalMarkerCodes([65, 65]);
    expect(list.toString(), "[66, 65]");
  });
}

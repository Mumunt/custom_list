import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:table_new/table_new.dart';

void main() {
  const MethodChannel channel = MethodChannel('table_new');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  // test('getPlatformVersion', () async {
  //   expect(await TableNew.platformVersion, '42');
  // });
}

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:app_groups/app_groups.dart';

void main() {
  const MethodChannel channel = MethodChannel('dev.jackmoseley.app_groups');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      if (methodCall.method == 'getSharedDirectory') {
        final group = methodCall.arguments as String;
        return '/shared/$group';
      }
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getSharedDirectory', () async {
    expect(
      await AppGroups.sharedDirectory('group.dev.jackmoseley.app_groups'),
      '/shared/group.dev.jackmoseley.app_groups',
    );
  });
}

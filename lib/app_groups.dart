import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

class AppGroups {
  static const MethodChannel _channel =
      const MethodChannel('dev.jackmoseley.app_groups');

  static Future<String> sharedDirectory(String group) async {
    if (Platform.isIOS || Platform.isMacOS) {
      return _channel.invokeMethod('getSharedDirectory', group);
    } else {
      final directory = await getApplicationDocumentsDirectory();
      return directory.path;
    }
  }
}

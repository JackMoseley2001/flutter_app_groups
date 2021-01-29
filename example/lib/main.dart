import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:app_groups/app_groups.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _sharedDirectory = 'Unknown Path';

  @override
  void initState() {
    super.initState();
    initDirectoryState();
  }

  Future<void> initDirectoryState() async {
    String sharedDirectory;

    try {
      sharedDirectory =
          await AppGroups.sharedDirectory('group.dev.jackmoseley.app_groups');
      if (sharedDirectory == null) {
        sharedDirectory = 'Failed to get shared directory';
      }
    } on PlatformException {
      sharedDirectory = 'Failed to get shared directory.';
    }

    if (!mounted) return;

    setState(() {
      _sharedDirectory = sharedDirectory;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('App\'s shared directory'),
        ),
        body: Center(
          child: Text('Shared directory:\n$_sharedDirectory'),
        ),
      ),
    );
  }
}

# App Groups

A Flutter package to access iOS app group features such as a shared directory

## Installation

Add this to your `pubspec.yaml`:

```yaml
app_groups:
  git:
    url: git://github.com/JackMoseley2001/flutter_app_groups.git
```

and import it into a dart file

```dart
import 'package:app_groups/app_groups.dart';
```

## Getting Started

Firstly, setup an app group via Xcode by going to your project, Signing and Capabilities, add a capability and search for app groups. A prompt will appear to create an app group - this typically always starts with `group.` and follows with your reverse domain and project. e.g. `group.dev.jackmoseley.app_groups`

Get the specified shared directory for an app group using the `sharedDirectory` function, passing in your app group identifier.

```dart
  final Future<String> directory = AppGroups.sharedDirectory('group.dev.jackmoseley.app_groups');

  // Or await for it using a function
  getSharedDirectory() async {
    final String directory = await AppGroups.sharedDirectory('group.dev.jackmoseley.app_groups');
    print(directory);
  }
```

On Android, this function currently returns the default application directory.

# REST API Client demo

Simple REST API Client demo using package from pub.dev `rest_api_client`. This app shows a problem where `rest_api_client` fails to initialise on web platform, when the web-server is not 127.0.0.1. It would be great to solve this issue, as the package is otherwise very nice to use. However this problem prevents it from being usable in a production scenario.

## What works

- `flutter run -d chrome`
- `flutter run -d web-server --web-hostname 127.0.0.1 --web-port 8001`

as evidenced by reaching progress of `afterInit` at <http://127.0.0.1:8001>

## What doesn't work

- `flutter run -d web-server --web-hostname 192.168.86.23 --web-port 8001`

as evidenced by progress halting at `afterAssign` at <http://192.168.86.23:8001> (replace that IP number with your LAN IP - or deploy to any real web-server and point your browser at it). This shows that the instance `.init()` call is not completing.

## What we know so far

In the Chrome Javascript console we see this in the successful case:

```Got object store box in database ___rest_api_client:storage_repository.
dart_sdk.js:29464 Got object store box in database ___rest_api_client:cached_storage_repository.```

Whereas in the failed case we see:

```Uncaught (in promise) TypeError: Cannot read properties of undefined (reading 'generateKey')
    at _getEncryptionKey (flutter_secure_storage_web.dart.js:120:103)
    at _getEncryptionKey.next (<anonymous>)
    at runBody (dart_sdk.js:40421:34)
    at Object._async [as async] (dart_sdk.js:40453:7)
    at [_getEncryptionKey] (flutter_secure_storage_web.dart.js:105:20)
    at flutter_secure_storage_web.FlutterSecureStorageWeb.new.write (flutter_secure_storage_web.dart.js:134:59)
    at write.next (<anonymous>)
    at runBody (dart_sdk.js:40421:34)
    at Object._async [as async] (dart_sdk.js:40453:7)
    at flutter_secure_storage_web.FlutterSecureStorageWeb.new.write (flutter_secure_storage_web.dart.js:131:20)
    at flutter_secure_storage.FlutterSecureStorage.new.write (flutter_secure_storage.dart.js:222:252)
    at secure_storage_repository.SecureStorageRepository.new.init (secure_storage_repository.dart.js:72:43)
    at init.next (<anonymous>)
    at dart_sdk.js:40402:33
    at _RootZone.runUnary (dart_sdk.js:40235:59)
    at _FutureListener.thenAwait.handleValue (dart_sdk.js:35449:29)
    at handleValueCallback (dart_sdk.js:36010:49)
    at _Future._propagateToListeners (dart_sdk.js:36048:17)
    at [_completeWithValue] (dart_sdk.js:35883:23)
    at async._AsyncCallbackEntry.new.callback (dart_sdk.js:35917:35)
    at Object._microtaskLoop (dart_sdk.js:40532:13)
    at _startMicrotaskLoop (dart_sdk.js:40538:13)
    at dart_sdk.js:36272:9```

## Environment used

The above results were achieved with this evironment:

```% flutter doctor -v
[✓] Flutter (Channel master, 3.6.0-2.0.pre.7, on macOS 12.6 21G115 darwin-arm64, locale en-NZ)
    • Flutter version 3.6.0-2.0.pre.7 on channel master at /Users/richard/development/flutter
    • Upstream repository https://github.com/flutter/flutter.git
    • Framework revision bf906e6cec (15 hours ago), 2022-11-12 23:51:17 -0500
    • Engine revision 2bdeaf7d76
    • Dart version 2.19.0 (build 2.19.0-394.0.dev)
    • DevTools version 2.19.0

[✓] Android toolchain - develop for Android devices (Android SDK version 32.1.0-rc1)
    • Android SDK at /Users/richard/Library/Android/sdk
    • Platform android-32, build-tools 32.1.0-rc1
    • Java binary at: /Applications/Android Studio.app/Contents/jre/Contents/Home/bin/java
    • Java version OpenJDK Runtime Environment (build 11.0.11+0-b60-7772763)
    • All Android licenses accepted.

[✓] Xcode - develop for iOS and macOS (Xcode 14.1)
    • Xcode at /Applications/Xcode.app/Contents/Developer
    • Build 14B47b
    • CocoaPods version 1.11.3

[✓] Chrome - develop for the web
    • Chrome at /Applications/Google Chrome.app/Contents/MacOS/Google Chrome

[✓] Android Studio (version 2021.1)
    • Android Studio at /Applications/Android Studio.app/Contents
    • Flutter plugin can be installed from:
      🔨 https://plugins.jetbrains.com/plugin/9212-flutter
    • Dart plugin can be installed from:
      🔨 https://plugins.jetbrains.com/plugin/6351-dart
    • Java version OpenJDK Runtime Environment (build 11.0.11+0-b60-7772763)

[✓] VS Code (version 1.73.1)
    • VS Code at /Applications/Visual Studio Code.app/Contents
    • Flutter extension version 3.52.0

[✓] Connected device (2 available)
    • macOS (desktop) • macos  • darwin-arm64   • macOS 12.6 21G115 darwin-arm64
    • Chrome (web)    • chrome • web-javascript • Google Chrome 107.0.5304.110

[✓] HTTP Host Availability
    • All required HTTP hosts are available

• No issues found!```


## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

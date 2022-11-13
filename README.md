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

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# REST API Client demo

Simple REST API Client demo using package from pub.dev rest_api_client. This app shows a problem where rest_api_client fails to initialise on web platform, when the web-server is not 127.0.0.1. It would be great to solve this issue, as the package is otherwise very nice to use. However this problem prevents it from being usable in a production scenario.

## What works

- `flutter run -d chrome`
- `flutter run -d web-server --web-hostname 127.0.0.1 --web-port 8001`

as evidenced by reaching progress of `afterInit` at <http://127.0.0.1:8001>

## What doesn't work

- `flutter run -d web-server --web-hostname 192.168.86.23 --web-port 8001`

as evidenced by progress halting at `afterAssign` at <http://192.168.86.23:8001>. This shows that the instance `.init()` call is not completing.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

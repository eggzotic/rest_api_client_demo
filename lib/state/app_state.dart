import 'package:flutter/foundation.dart';
import 'package:rest_api_client/rest_api_client.dart';

class AppState with ChangeNotifier {
  late final RestApiClient _apiClient;
  InitProgress _progress = InitProgress.begin;
  InitProgress get progress => _progress;
  //
  AppState() {
    _init();
  }
  //
  void _init() async {
    await RestApiClient.initFlutter();
    _progress = InitProgress.afterInitFlutter;
    notifyListeners();
    //
    _apiClient = RestApiClient(options: RestApiClientOptions());
    //
    _progress = InitProgress.afterAssign;
    notifyListeners();
    //
    // when run from non-127.0.0.1, this call fails on web platform
    await _apiClient.init();
    _progress = InitProgress.afterInit;
    notifyListeners();
  }
}

enum InitProgress {
  begin,
  afterInitFlutter,
  afterAssign,
  afterInit;
}

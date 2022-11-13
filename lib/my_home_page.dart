import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rest_api_client_demo/state/app_state.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('REST API Client Demo'),
      ),
      body: Center(
        child: Text('AppState progress: ${appState.progress.name}'),
      ),
    );
  }
}

import 'package:flaskextensions/data/provider/mock_provider.dart';
import 'package:flutter/material.dart';

import 'data/repository/extension_repository.dart';
import 'ui/screen/home_screen.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flask Extensions',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[100],
        primaryColor: Colors.indigo,
        brightness: Brightness.light,
      ),
      home: HomeScreen(
        repository: ExtensionRepository(
          provider: MockProvider(),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/game_screen/game_provider.dart';
import './screens/game_screen/game_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: GameScreen.routeName,
      routes: {
        GameScreen.routeName: ((context) {
          return ChangeNotifierProvider(
            create: ((context) => GameProvider()),
            child: const GameScreen(),
          );
        }),
      },
    );
  }
}

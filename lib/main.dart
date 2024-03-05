import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_db/pages/home_page.dart';
import 'package:hive_db/pages/user_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  await Hive.initFlutter();
  await Hive.openBox('emailPassword');
  await Hive.openBox('user');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
      routes: {
        HomePage.id: (context) => const HomePage(),
        UserPage.id: (context) => const UserPage(),
      },
    );
  }
}

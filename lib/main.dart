import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quotes_api_app/view/home/spl.dart';

import 'provider/detail_provider.dart';
import 'view/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => DataProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(useMaterial3: false),

        initialRoute: 'spl',
        routes: {
          '/': (context) => const Homepage(),
          'spl': (context) => const spl(),
        },
      ),
    );
  }
}

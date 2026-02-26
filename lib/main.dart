import 'package:flutter/material.dart';
import 'package:my_sample_app/controllers/dashboard_controller.dart';
import 'package:my_sample_app/controllers/login_controller.dart';
import 'package:my_sample_app/screens/loginScreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginController()),
        ChangeNotifierProvider(create: (_) => DashboardController()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Loginscreen(),
    );
  }
}

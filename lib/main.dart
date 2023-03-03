import 'package:booqui/config.dart';
import 'package:booqui/pages/book_registration_page.dart';
import 'package:booqui/pages/feed_page/feed_page.dart';
import 'package:booqui/pages/initial_page.dart';
import 'package:booqui/pages/login_page.dart';
import 'package:booqui/pages/register_page.dart';
import 'package:booqui/widgets/checkauth.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await initConfigurations();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Booqui',
        routes: {
          '/initial': (context) => const InitialPage(),
          '/login': (context) => const LoginPage(),
          '/register': (context) => const RegisterPage(),
          '/feed': (context) => const FeedPage(),
          '/bookRegistration': (context) => const BookRegistrationPage(),
        },
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: CheckAuth());
  }
}

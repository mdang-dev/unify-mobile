import 'package:flutter/material.dart';
import 'package:unify/screens/login_sreen.dart';
import 'package:unify/screens/home_screen.dart';
import 'package:unify/screens/sign_up_screen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async{
  await dotenv.load(fileName: ".env");
  runApp(const Unify());
}

class Unify extends StatelessWidget {
  const Unify({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Unify',
      themeMode: ThemeMode.system,
      theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.blue,
          appBarTheme: const AppBarTheme(backgroundColor: Colors.blueAccent),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent))),
      darkTheme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.grey,
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.grey[800],
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.grey[800]))),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/home': (context) => HomeScreen(),
        '/sign-up': (context) => const SignUpScreen()
      },
    );
  }
}

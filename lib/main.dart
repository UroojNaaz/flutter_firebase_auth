import 'package:flutter/material.dart';
import 'package:flutter_firebase/auth_provider.dart';
import 'package:flutter_firebase/screens/forgot_password_screen/forgot_password_screen.dart';
import 'package:flutter_firebase/screens/home_screen/home_screen.dart';
import 'package:flutter_firebase/screens/login_screen/login_screen.dart';
import 'package:flutter_firebase/screens/signup_screen/signup_screen.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: MaterialApp(
        title: 'Login App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
          useMaterial3: true,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const HomeScreen(),
          '/signup': (context) => const SignUpScreen(),
          '/login': (context) => const LoginScreen(),
          '/forgot_password': (context) => const ForgotPasswordScreen(),
        },
      ),
    );
  }
}



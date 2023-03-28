import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _active = false;
  final String _activeKey = 'ONBOARDING';

  @override
  void initState() {
    _initAppVerificaSeEstaAtivo();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Money Manager',
      theme: ThemeData(
          backgroundColor: const Color.fromRGBO(18, 20, 29, 1)
      ),
      debugShowCheckedModeBanner: false,
      home: _active ? getHome() : const OnboardingScreen(),
    );
  }

  _initAppVerificaSeEstaAtivo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final ativo = prefs.getBool(_activeKey) ?? false;

    setState(() {
      _active = ativo;
    });
  }

  Widget getHome() {
    var user = FirebaseAuth.instance.currentUser;
    if (user == null || user.isAnonymous == true) {
      return const WelcomeScreen();
    } else {
      return const HomeScreen();
    }
  }
}

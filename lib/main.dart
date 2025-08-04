import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // <-- import this for orientation lock
import 'screens/splashScreen.dart';
import 'services/audio_service.dart'; // <-- import your audio service
import 'screens/loginScreen.dart';
import 'screens/lobbyScreen.dart'; // <-- import your lobby screen
import 'package:firebase_core/firebase_core.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // Lock orientation to landscape only
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    _startBgm();
  }

  void _startBgm() async {
    await AudioService.init();       // Load mute preference
    await AudioService().playBgm();  // Start background music
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Card Table Game',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      routes: {
      '/login': (context) => const LoginScreen(),
      '/lobby': (context) => const LobbyScreen(),
    },
    );
  }
}

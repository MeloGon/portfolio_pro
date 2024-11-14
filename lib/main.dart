import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/config/config.dart';
import 'package:portfolio/presentation/providers/state.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: "AIzaSyAb5aby0k1uTudlJVEKTbUqHqhlLTg6Gy4",
    appId: "1:173175341099:web:33e6dada6b8e3d56ad6a6e",
    messagingSenderId: "173175341099",
    projectId: "portfolio-266cc",
  ));
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = ref.watch(appRouterProvider);
    final darkMode = ref.watch(darkModeProvider);
    return MaterialApp.router(
      title: 'Kevyn Melo Portfolio',
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      theme: AppTheme(isDarkmode: darkMode).getTheme(),
    );
  }
}

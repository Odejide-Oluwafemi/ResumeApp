import 'package:flutter/material.dart';
import 'package:resume_app/home_page.dart';
import 'package:resume_app/misc/app_theme.dart';
import 'package:resume_app/misc/config.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

// The base of our entire app
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    currentTheme.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('en', 'UK'),
        Locale('es', ''),
        Locale('zh', ''),
        Locale('he', 'IL'),
      ],

      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.appTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: currentTheme.currentTheme(),
      // The First Page loaded to the Screen
      home: const HomePage(),
    );
  }
}

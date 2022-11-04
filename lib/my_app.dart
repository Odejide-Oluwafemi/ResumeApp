import 'package:flutter/material.dart';
import 'package:resume_app/home_page.dart';
import 'package:resume_app/misc/app_theme.dart';
import 'package:resume_app/misc/config.dart';

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
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.appTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: currentTheme.currentTheme(),
      home: const HomePage(),
    );
  }
}

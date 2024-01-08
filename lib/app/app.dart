import 'package:flutter/material.dart';
import 'package:flutter_memer/themes.dart';
import 'package:flutter_memer/views/home_view.dart';
import 'package:google_fonts/google_fonts.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Memer App',
      theme: ThemeData(
        colorScheme: MyTheme.lightColorScheme,
        fontFamily: GoogleFonts.dmSans().fontFamily,
      ),
      darkTheme: ThemeData(
        colorScheme: MyTheme.lightColorScheme,
        fontFamily: GoogleFonts.dmSans().fontFamily,
      ),
      themeMode: ThemeMode.system,
      home: const HomeView(),
    );
  }
}

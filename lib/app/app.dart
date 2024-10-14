import 'package:flutter/material.dart';
import 'package:memelab/themes.dart';
import 'package:memelab/views/home.view.dart';
import 'package:google_fonts/google_fonts.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "MemeLab",
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: Themes.lightColorScheme,
        fontFamily: GoogleFonts.inter().fontFamily,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: Themes.darkColorScheme,
        fontFamily: GoogleFonts.inter().fontFamily,
      ),
      themeMode: ThemeMode.system,
      home: const Home(),
    );
  }
}

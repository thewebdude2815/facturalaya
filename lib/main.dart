import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pos_ui/screens/bottomNavBar.dart';
import 'package:pos_ui/screens/dashboard.dart';
import 'package:pos_ui/screens/splash.dart';

void main() {
  runApp(const POSUI());
}

class POSUI extends StatelessWidget {
  const POSUI({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(textTheme: GoogleFonts.poppinsTextTheme()),
      home: SplashScreen(),
    );
  }
}

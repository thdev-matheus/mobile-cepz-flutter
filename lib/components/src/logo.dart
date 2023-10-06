import 'package:cepz/styles/global_styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Cepz',
      style: GoogleFonts.permanentMarker(
        fontSize: 100,
        color: primary,
      ),
    );
  }
}

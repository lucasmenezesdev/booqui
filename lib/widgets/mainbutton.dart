import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../styles.dart';

class MainButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color color;
  const MainButton(
      {super.key,
      required this.text,
      required this.color,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      width: 320,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: green),
        onPressed: onPressed,
        child: Text(
          text,
          style: GoogleFonts.montserrat(
              textStyle:
                  const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              color: color),
        ),
      ),
    );
  }
}

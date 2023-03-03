import 'package:flutter/material.dart';

import '../styles.dart';

class ReturnButton extends StatelessWidget {
  const ReturnButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 20,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(30), color: green),
      child: const BackButton(),
    );
  }
}

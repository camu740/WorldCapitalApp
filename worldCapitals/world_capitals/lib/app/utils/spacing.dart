import 'package:flutter/material.dart';

class Espaciado extends StatelessWidget {
  final double num;

  const Espaciado({super.key, required this.num});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: num,
    );
  }}
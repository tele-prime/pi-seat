import 'dart:ui';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GlassmorphismScreen(),
    );
  }
}

class GlassmorphismScreen extends StatelessWidget {
  const GlassmorphismScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // A colorful background is necessary to see the glass effect
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple, Colors.teal],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: const Center(
          child: StadiumGlassWidget(
            text: 'Glass Stadium',
          ),
        ),
      ),
    );
  }
}

class StadiumGlassWidget extends StatelessWidget {
  final String text;

  const StadiumGlassWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    // ClipPath ensures the blur effect doesn't bleed outside the stadium shape
    return ClipPath(
      clipper: const ShapeBorderClipper(shape: StadiumBorder()),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0), // Adjust blur intensity
        child: Container(
          // Padding determines the overall size around the text
          padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
          decoration: ShapeDecoration(
            shape: StadiumBorder(
              side: BorderSide(
                color: Colors.white.withOpacity(0.3), // Light border for reflection
                width: 1.5,
              ),
            ),
            // The semi-transparent tint of the glass
            color: Colors.white.withOpacity(0.15),
          ),
          // Center the text inside the container
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
        ),
      ),
    );
  }
}
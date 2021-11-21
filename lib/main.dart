import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:glassmorphism_product_card/widgets/custom_clipper.dart';
import 'package:glassmorphism_product_card/widgets/glassmorphism.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Glassmorphism Product Card',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.8),
      body: SafeArea(
        child: Stack(
          children: [
            ClipPath(
              clipper: BottomClipper(),
              child: Container(
                height: double.infinity,
                width: double.infinity,
                color: Colors.blue[400],
              ),
            ),
            ClipPath(
              clipper: TopClipper(),
              child: Container(
                height: double.infinity,
                width: double.infinity,
                color: Colors.red[600],
              ),
            ),
            // Add GridView
            Center(
              child: GridView.count(
                shrinkWrap: true, // fixed center
                crossAxisCount: 4,
                childAspectRatio: 0.6,
                padding: const EdgeInsets.all(32),
                crossAxisSpacing: 32,
                mainAxisSpacing: 32,
                children: [
                  Card(
                    color: Colors.transparent,
                    child: Stack(
                      children: const [
                        // add glassmorphism effect
                        Glassmorphism(),
                      ],
                    ),
                  ),
                  Card(),
                  Card(),
                  Card(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

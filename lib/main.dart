import 'package:flutter/material.dart';
import 'package:glassmorphism_product_card/data.dart';
import 'package:glassmorphism_product_card/responsive.dart';
import 'package:glassmorphism_product_card/widgets/custom_clipper.dart';
import 'package:glassmorphism_product_card/widgets/shoes_card.dart';

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
    int crossAxisCount = 1;
    double kPadding = 64;

    if (Responsive.isDesktop(context)) {
      crossAxisCount = 4;
    } else if (Responsive.isLargeTablet(context)) {
      crossAxisCount = 2;
    } else if (Responsive.isTablet(context)) {
      crossAxisCount = 2;
      kPadding = 32;
    } else {
      crossAxisCount = 1;
    }

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
                crossAxisCount: crossAxisCount,
                childAspectRatio: 0.6,
                padding: EdgeInsets.all(kPadding),
                crossAxisSpacing: kPadding,
                mainAxisSpacing: kPadding,
                children: [
                  ...shoesImageUrls.map((e) => ShoesCard(shoesImageUrl: e)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

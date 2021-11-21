import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  const Responsive({
    Key? key,
    required this.mobile,
    required this.tablet,
    required this.largeTablet,
    required this.desktop,
  }) : super(key: key);

  final Widget mobile;
  final Widget tablet;
  final Widget largeTablet;
  final Widget desktop;

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 550;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 550 &&
      MediaQuery.of(context).size.width < 800;

  static bool isLargeTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 800 &&
      MediaQuery.of(context).size.width < 1200;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width > 1200;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrants) {
        if (constrants.maxWidth >= 1200) {
          return desktop;
        } else if (constrants.maxWidth >= 800 && constrants.maxWidth < 1200) {
          return largeTablet;
        } else if (constrants.maxWidth >= 550 && constrants.maxWidth < 800) {
          return tablet;
        } else {
          return mobile;
        }
      },
    );
  }
}

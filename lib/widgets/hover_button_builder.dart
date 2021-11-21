import 'package:flutter/material.dart';

class HoverButtonBuilder extends StatefulWidget {
  final Widget Function(bool isHovered) builder;

  const HoverButtonBuilder({Key? key, required this.builder}) : super(key: key);

  @override
  _HoverButtonBuilderState createState() => _HoverButtonBuilderState();
}

class _HoverButtonBuilderState extends State<HoverButtonBuilder> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => onEntered(true),
      onExit: (event) => onEntered(false),
      child: widget.builder(isHovered),
    );
  }

  void onEntered(bool isHovered) {
    setState(() {
      this.isHovered = isHovered;
    });
  }
}

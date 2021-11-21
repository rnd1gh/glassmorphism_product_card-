import 'package:flutter/material.dart';

class ColorButton extends StatelessWidget {
  final Color color;
  final VoidCallback onTap;
  const ColorButton({
    Key? key,
    required this.color,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 18.0,
        width: 18.0,
        margin: const EdgeInsets.symmetric(horizontal: 4.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            width: 2,
            color: Colors.white,
          ),
          color: color,
        ),
      ),
    );
  }
}

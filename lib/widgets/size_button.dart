import 'package:flutter/material.dart';
import 'package:glassmorphism_product_card/widgets/hover_button_builder.dart';

class SizeButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const SizeButton({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: HoverButtonBuilder(
          builder: (isHovered) {
            return Container(
              height: 25.0,
              width: 25.0,
              child: Center(
                child: Text(
                  title,
                  style: const TextStyle(color: Colors.black),
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: isHovered ? Colors.greenAccent : Colors.white,
              ),
            );
          },
        ),
      ),
    );
  }
}

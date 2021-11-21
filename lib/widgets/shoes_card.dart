import 'dart:math';

import 'package:flutter/material.dart';
import 'package:glassmorphism_product_card/data.dart';
import 'package:glassmorphism_product_card/widgets/buynow_button.dart';
import 'package:glassmorphism_product_card/widgets/color_button.dart';
import 'package:glassmorphism_product_card/widgets/glassmorphism.dart';
import 'package:glassmorphism_product_card/widgets/size_button.dart';

class ShoesCard extends StatelessWidget {
  final String shoesImageUrl;
  const ShoesCard({
    Key? key,
    required this.shoesImageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      child: Stack(
        children: [
          // add glassmorphism effect
          const Glassmorphism(),
          Column(
            children: [
              Transform(
                alignment: AlignmentDirectional.center,
                transform: Matrix4.identity()..rotateY(pi),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                  ),
                  child: Image.asset(shoesImageUrl),
                ),
              ),
              const Text(
                'Nike Shoes',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              // Add size button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'SIZE : ',
                    style: TextStyle(color: Colors.white),
                  ),
                  ...sizeButtons.map(
                    (e) => SizeButton(
                      title: e,
                      onTap: () {},
                    ),
                  ),
                ],
              ),
              // Add color button
              const SizedBox(height: 20),
              // Add size button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'COLOR : ',
                    style: TextStyle(color: Colors.white),
                  ),
                  ...colorButtons.map(
                    (e) => ColorButton(
                      onTap: () {},
                      color: e,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Add Buy Now Button
              BuyNowButton(
                onTap: () {},
              ),
            ],
          )
        ],
      ),
    );
  }
}

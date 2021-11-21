import 'dart:math';

import 'package:flutter/material.dart';
import 'package:glassmorphism_product_card/data.dart';
import 'package:glassmorphism_product_card/widgets/buynow_button.dart';
import 'package:glassmorphism_product_card/widgets/color_button.dart';
import 'package:glassmorphism_product_card/widgets/glassmorphism.dart';
import 'package:glassmorphism_product_card/widgets/hover_button_builder.dart';
import 'package:glassmorphism_product_card/widgets/size_button.dart';

class ShoesCard extends StatefulWidget {
  final String shoesImageUrl;
  const ShoesCard({
    Key? key,
    required this.shoesImageUrl,
  }) : super(key: key);

  @override
  State<ShoesCard> createState() => _ShoesCardState();
}

class _ShoesCardState extends State<ShoesCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animationShoes;

  void setupAnimation() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animationShoes = CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.0, 1.0),
    );
  }

  @override
  void initState() {
    setupAnimation();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // add hover event and add animation
    return AnimatedBuilder(
        animation: _animationController,
        builder: (context, _) {
          return HoverButtonBuilder(
            builder: (isHovered) {
              if (isHovered) {
                _animationController.forward();
              } else {
                _animationController.reverse();
              }
              return Card(
                color: Colors.transparent,
                child: Stack(
                  children: [
                    // add glassmorphism effect
                    const Glassmorphism(),
                    Column(
                      children: [
                        Transform.translate(
                          offset: Offset(
                            -30 * _animationShoes.value,
                            -60 * _animationShoes.value,
                          ),
                          child: Transform.rotate(
                            angle: -0.436332313 *
                                _animationShoes.value, // rotate -25 degree
                            child: Transform.scale(
                              scale: 1 +
                                  0.5 *
                                      _animationShoes
                                          .value, // scale from 1 to 1.5
                              child: Transform(
                                alignment: AlignmentDirectional.center,
                                transform: Matrix4.identity()..rotateY(pi),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0,
                                  ),
                                  child: Image.asset(widget.shoesImageUrl),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(0, -40 * _animationShoes.value),
                          child: const Text(
                            'Nike Shoes',
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Add size button
                        Transform.translate(
                          offset: Offset(0, 20 + (-30 * _animationShoes.value)),
                          child: AnimatedOpacity(
                            opacity: _animationShoes.value,
                            duration: const Duration(milliseconds: 300),
                            child: Column(
                              children: [
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
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              );
            },
          );
        });
  }
}

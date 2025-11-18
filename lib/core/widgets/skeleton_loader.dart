import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SkeletonLoader extends StatelessWidget {
  const SkeletonLoader({super.key, this.height = 16, this.width = double.infinity, this.radius = 12});
  final double height;
  final double width;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(radius),
      ),
    ).animate(onComplete: (controller) => controller.repeat(reverse: true)).fadeIn(duration: 400.ms).shimmer(duration: 1200.ms);
  }
}

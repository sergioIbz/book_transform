import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class PageBook extends StatelessWidget {
  final Color? color;
  final double degrees;
  const PageBook({
    this.degrees = 0,
    this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: matrix4Custom(degrees),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.horizontal(
            right: Radius.circular(12),
          ),
          image: color == null
              ? const DecorationImage(
                  image: AssetImage('assets/portada2.jpeg'),
                  fit: BoxFit.cover,
                )
              : null,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
      ),
    );
  }
}

Matrix4 matrix4Custom(double radians) => Matrix4.identity()
  ..setEntry(3, 2, 0.001)
  ..rotateY(
    vector.radians(radians),
  );

import 'package:book_transform/page.dart';
import 'package:flutter/material.dart';

class Book extends StatefulWidget {
  const Book({
    super.key,
  });

  @override
  State<Book> createState() => _BookState();
}

class _BookState extends State<Book> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  bool isOpen = false;
  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 1800,
      ),
    );
    animation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
          parent: controller,
          // curve: Curves.easeInOutBack,
          curve: Curves.elasticOut),
    );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget? child) {
        return GestureDetector(
          onTap: () {
            isOpen ? controller.reverse() : controller.forward();
            isOpen = !isOpen;
          },
          child: Transform.scale(
            scale: 1 + 0.2 * animation.value,
            child: Transform.translate(
              offset: Offset(70 * animation.value, 0),
              child: SizedBox(
                height: 240,
                width: 160,
                child: Stack(
                  children: [
                    const PageBook(
                      color: Color(0xffFFF3C7),
                    ),
                    PageBook(
                      color: Color.lerp(
                        const Color(0xffDACFA6),
                        const Color(0xffFFF3C7),
                        animation.value,
                      ),
                      degrees: 45 * animation.value,
                    ),
                    PageBook(
                      degrees: 135 * animation.value,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

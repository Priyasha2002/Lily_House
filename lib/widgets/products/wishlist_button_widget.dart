import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class WishlistButtonWidget extends StatefulWidget {
  final double size;
  final Color colors;
  const WishlistButtonWidget({
    super.key,
    this.size = 22,
    this.colors= Colors.transparent,
  });

  @override
  State<WishlistButtonWidget> createState() => _WishlistButtonWidgetState();
}
class _WishlistButtonWidgetState extends State<WishlistButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: widget.colors,
      ),
      child: IconButton(
        style: IconButton.styleFrom(
          shape: const CircleBorder(),
        ),
          onPressed: (){},
          icon: Icon(
            IconlyLight.heart,
            size: widget.size,
          )
      ),
    );
  }
}

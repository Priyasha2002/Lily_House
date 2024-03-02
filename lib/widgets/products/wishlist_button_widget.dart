import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:lily_house/consts/providers/wishlist_provider.dart';
import 'package:provider/provider.dart';

class WishlistButtonWidget extends StatefulWidget {
  final double size;
  final Color colors;
  final String productId;
  const WishlistButtonWidget({
    super.key,
    this.size = 22,
    this.colors= Colors.transparent, required this.productId,
  });

  @override
  State<WishlistButtonWidget> createState() => _WishlistButtonWidgetState();
}
class _WishlistButtonWidgetState extends State<WishlistButtonWidget> {
  @override
  Widget build(BuildContext context) {
    final wishlistprovider = Provider.of<WishListProvider>(context);
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: widget.colors,
      ),
      child: IconButton(
        style: IconButton.styleFrom(
          shape: const CircleBorder(),
        ),
          onPressed: (){
          wishlistprovider.addOrRemoveFromWishlist(productId: widget.productId);
          },
          icon: Icon(
            wishlistprovider.isProductInWishlist(productId: widget.productId)
            ? IconlyBold.heart
            : IconlyLight.heart,
            size: widget.size,
            color: wishlistprovider.isProductInWishlist(productId: widget.productId)
              ? Colors.red
                : Colors.grey
          )
      ),
    );
  }
}

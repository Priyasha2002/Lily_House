import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../consts/providers/wishlist_provider.dart';
import '../services/assets_manager.dart';
import '../services/my_app_methods.dart';
import '../widgets/empty_widget_bag.dart';
import '../widgets/products/products_widget.dart';
import '../widgets/titles_text.dart';

class WishlistScreen extends StatelessWidget {
  static const routeName = "/WishlistScreen";
  const WishlistScreen({super.key});
  final bool isEmpty = true;
  @override
  Widget build(BuildContext context) {
    final wishlistProvider = Provider.of<WishListProvider>(context);

    return wishlistProvider.getwishlistItems.isEmpty
        ? Scaffold(
      body: EmptyBagWidget(
        imagePath: AssetsManager.bagWish,
        title: "Nothing in ur wishlist yet",
        subtitle:
        "Looks like your cart is empty add something and make me happy",
        buttonText: "Shop now",
      ),
    )
        : Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            AssetsManager.shoppingCart,
          ),
        ),
        title: TitleTextWidget(
            label: "Wishlist (${wishlistProvider.getwishlistItems.length})"),
        actions: [

        ],
      ),
      body: DynamicHeightGridView(
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        builder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ProductWidget(
              productId: wishlistProvider.getwishlistItems.values
                  .toList()[index]
                  .productId,
            ),
          );
        },
        itemCount: wishlistProvider.getwishlistItems.length,
        crossAxisCount: 2,
      ),
    );
  }
}
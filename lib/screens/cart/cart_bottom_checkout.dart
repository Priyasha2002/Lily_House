import 'package:flutter/material.dart';
import 'package:lily_house/consts/providers/cart_provider.dart';
import 'package:lily_house/consts/providers/product_provider.dart';
import 'package:lily_house/widgets/subtitles_text.dart';
import 'package:lily_house/widgets/titles_text.dart';
import 'package:provider/provider.dart';

class CartBottomCheckout extends StatelessWidget {
  const CartBottomCheckout({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        border: const Border(
          top: BorderSide(
            width: 1,
            color: Colors.grey,
          ),
        ),
      ),
      child: SizedBox(
        height: kBottomNavigationBarHeight+10,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          child: SingleChildScrollView(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FittedBox(
                        child: TitleTextWidget(
                            label: "Total (${cartProvider.getCartItems.length} products/ ${cartProvider.getQty()}) Items"
                        ),
                      ),
                      SubtitleTextWidget(
                          label: "₹${cartProvider.getTotal(productProvider: productProvider)}",
                          color: Colors.blue
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                    onPressed: (){},
                    child:const Text("Checkout")
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

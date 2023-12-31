import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:lily_house/consts/providers/cart_provider.dart';
import 'package:lily_house/consts/providers/cart_provider.dart';
import 'package:lily_house/screens/cart/cart_bottom_checkout.dart';
import 'package:lily_house/screens/cart/cart_widget.dart';
import 'package:lily_house/widgets/empty_widget_bag.dart';
import 'package:lily_house/widgets/titles_text.dart';
import 'package:provider/provider.dart';
import '../../consts/providers/cart_provider.dart';
import '../../consts/providers/cart_provider.dart';
import '../../services/assets_manager.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  final bool isEmpty = false;

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return cartProvider.getCartItems.isEmpty
        ? Scaffold(
      body: EmptyBagWidget(
        imagePath: AssetsManager.shoppingCart,
        title: "Your cart is empty",
        subtitle: "Looks like your cart is empty.\nShop now and give yourself a treat",
        buttonText: "Shop Now",
      ),
    ) : Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: (){},
              icon: Icon(
                IconlyLight.delete,
              ),
          ),
        ],
        title: TitleTextWidget(label: "${cartProvider.getCartItems.length}"),
        leading: Image.asset(AssetsManager.shoppingCart),
      ),
      body: ListView.builder(
          itemCount: cartProvider.getCartItems.length,
          itemBuilder: (context, index){
            return ChangeNotifierProvider.value(
                value: cartProvider.getCartItems.values.toList()[index],
                child :const CartWidget()
            );
            },
      ),
      bottomSheet: const CartBottomCheckout(),
    );
  }
}

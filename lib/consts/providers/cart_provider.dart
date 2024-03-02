import 'package:flutter/material.dart';
import 'package:lily_house/consts/providers/product_provider.dart';
import 'package:lily_house/models/cart_model.dart';
import 'package:lily_house/models/products_model.dart';
import 'package:uuid/uuid.dart';


class CartProvider with ChangeNotifier {
  final Map<String, CartModel> _cartItems = {};

  Map<String, CartModel> get getCartItems {
    return _cartItems;
  }

  bool isProductInCart({required String productId}) {
    return _cartItems.containsKey(productId);
  }
  // Add to Cart
  void addProductToCart({required String productId}) {
    _cartItems.putIfAbsent(
      productId,
        () => CartModel(
            cartId: const Uuid().v4(),
            productId: productId,
            quantity: 1
        ),
    );
    notifyListeners();
  }

  // Updating the quantity of products
  void updateQuantity({
    required String productId, required int quantity
}) {
    _cartItems.update(productId, (item) => CartModel(
        cartId: item.cartId,
        productId: productId,
        quantity: quantity
    ),);
    notifyListeners();
  }

  // Total price and checkout
  double getTotal({required ProductProvider productProvider}) {
    double total = 0.0;
      _cartItems.forEach((key, value) {
        final ProductModel? getCurrProduct = productProvider.findByProdId(value.productId);
        // if cart is null , make the total price is equal to 0 or else multiply the cost of 1 item to the no of items
        if(getCurrProduct == null) {
          total += 0;
        }else {
          total += double.parse(getCurrProduct.productPrice) * value.quantity;
        }
      });
      return total ;
    }

  // Whatever quantity user selects that is to be shown in the display
    int getQty() {
    int total = 0;
    _cartItems.forEach((key, value) {
      total += value.quantity;
    });
    return total;
    }

    // Delete items from cart
    void removeOneItem({required String productId}) {
    _cartItems.remove(productId);
    notifyListeners();
    }

   // Clear cart screen
   void clearLocalCart() {
    _cartItems.clear();
    notifyListeners();
   }
    }





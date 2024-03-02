import 'package:flutter/material.dart';
import 'package:lily_house/consts/providers/product_provider.dart';
import 'package:lily_house/models/cart_model.dart';
import 'package:lily_house/models/products_model.dart';
import 'package:lily_house/models/wishlist_model.dart';
import 'package:uuid/uuid.dart';

class WishListProvider with ChangeNotifier {
  final Map<String, WishlistModel> _wishlistItems = {};
  Map<String, WishlistModel> get getwishlistItems {
    return _wishlistItems;
  }
  bool isProductInWishlist({required String productId}) {
    return _wishlistItems.containsKey(productId);
  }

  // Add to Cart
  void addOrRemoveFromWishlist(
  {
    required String productId
}
      ){
    if (_wishlistItems.containsKey(productId)){
      _wishlistItems.remove(productId);
    } else {
      _wishlistItems.putIfAbsent(
          productId,
          () => WishlistModel(
              id: const Uuid().v4(),
              productId: productId
          ),
      );
    }
    notifyListeners();
  }
  void clearLocalWishlist(){
    _wishlistItems.clear();
    notifyListeners();
  }
}


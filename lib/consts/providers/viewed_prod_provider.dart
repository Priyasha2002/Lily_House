import 'package:flutter/material.dart';
import 'package:lily_house/models/wishlist_model.dart';
import 'package:uuid/uuid.dart';

import '../../models/view_prod_model.dart';

class ViewedProdProvider with ChangeNotifier {
  final Map<String, ViewProdModel> _viewedprodItems = {};
  Map<String, ViewProdModel> get getviewedprodItems {
    return _viewedprodItems;
  }
  //bool isProductInWishlist({required String productId}) {
    //return _viewedprodItems.containsKey(productId);
  //}

  void addProductToHistory(
      {
        required String productId
      }
      ){
    if (_viewedprodItems.containsKey(productId)){
      _viewedprodItems.remove(productId);
    } else {
      _viewedprodItems.putIfAbsent(
        productId,
            () => ViewProdModel(
            id: const Uuid().v4(),
            productId: productId
        ),
      );
    }
    notifyListeners();
  }
  //void clearLocalWishlist(){
  //  _viewedprodItems.clear();
  //  notifyListeners();
  //}
}

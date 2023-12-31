import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CartModel with ChangeNotifier{
  final String cartId;
  final String productId;
  final int quantity;

  CartModel({
    required this.cartId,
    required this.productId,
    required this.quantity

  } );
}
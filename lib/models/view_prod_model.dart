import 'package:flutter/material.dart';

class ViewProdModel with ChangeNotifier {
  final String id, productId;

  ViewProdModel ({
    required this.id,
    required this.productId
  } );
}

import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:lily_house/consts/app_constants.dart';
import 'package:lily_house/consts/providers/viewed_prod_provider.dart';
import 'package:lily_house/models/products_model.dart';
import 'package:lily_house/widgets/products/wishlist_button_widget.dart';
import 'package:lily_house/widgets/subtitles_text.dart';
import 'package:provider/provider.dart';

import '../../screens/product_details.dart';
class LatestarrivalProductsWidget extends StatelessWidget {
  const LatestarrivalProductsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final productsModel = Provider.of<ProductModel>(context);
    final viewedrovider = Provider.of<ViewedProdProvider>(context);
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: ()async{
          viewedrovider.addProductToHistory(
              productId: productsModel.productId
          );
          await Navigator.pushNamed(
              context,
              ProductDetails.routeName,
              arguments: productsModel.productId
          );
        },
        child: SizedBox(
          width: size.width * 0.5,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: FancyShimmerImage(
                      imageUrl: productsModel.productImage,
                    width: size.width * 0.25,
                    height: size.height * 0.25,
                
                  ),
                ),

              const SizedBox(
                width: 7,
              ),
              Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productsModel.productTitle,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      FittedBox(
                        child: Row(
                          children: [
                            WishlistButtonWidget(
                                productId: productsModel.productId
                            ),
                            IconButton(
                              onPressed: (){},
                              icon: const Icon(
                                Icons.add_shopping_cart_rounded,
                                size: 25,
                              ),
                            ),
                          ],
                        ),
                      ),
                      FittedBox(
                        child: SubtitleTextWidget(
                          label: " ₹${ productsModel.productPrice}",
                          color: Colors.blue,
                        ),
                      )
                    ],
                  )
              )
            ],
          ),
        ),

      ),
    );
  }
}

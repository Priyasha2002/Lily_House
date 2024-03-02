import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:lily_house/consts/providers/cart_provider.dart';
import 'package:lily_house/consts/providers/product_provider.dart';
import 'package:lily_house/screens/product_details.dart';
import 'package:lily_house/widgets/products/wishlist_button_widget.dart';
import 'package:lily_house/widgets/subtitles_text.dart';
import 'package:lily_house/widgets/titles_text.dart';
import 'package:provider/provider.dart';
class ProductWidget extends StatefulWidget {
  final String productId;
  const ProductWidget({super.key, required this.productId});

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final productProvider = Provider.of<ProductProvider>(context);
    final getCurrentProduct = productProvider.findByProdId(widget.productId);
    final cartProvider = Provider.of<CartProvider>(context);

    return getCurrentProduct== null
        ? SizedBox.shrink()
        :Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
          onTap: () async {
          await Navigator.pushNamed(
              context,
              ProductDetails.routeName,
            arguments: getCurrentProduct.productId,
          );
        },
        child: Column(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: FancyShimmerImage(
                    imageUrl: getCurrentProduct!.productImage,
                  height: size.height *0.3,
                  width: double.infinity,
                ),
              ),
            const SizedBox(
              height: 15.0,
            ),
            Row(
              children: [
                Flexible(
                  flex: 5,
                    child: TitleTextWidget(
                        label: getCurrentProduct.productTitle,
                      maxLines: 2,
                      fontSize: 18,
                    ),
                ),
                 Flexible(
                  flex: 2,
                  child: WishlistButtonWidget(
                    productId: getCurrentProduct.productId,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 15.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 3,
                      child: SubtitleTextWidget(label: "${getCurrentProduct.productPrice}\$")
                  ),
                  Material(
                    borderRadius: BorderRadius.circular(16.0),
                    child: IconButton(
                      splashColor: Colors.red,
                        splashRadius: 27.0,
                        onPressed: (){
                        if (cartProvider.isProductInCart(
                            productId: getCurrentProduct.productId)){
                          return;
                        }
                        cartProvider.addProductToCart(productId:getCurrentProduct.productId );
                        },
                        icon: Icon(
                          cartProvider.isProductInCart(
                              productId: getCurrentProduct.productId)
                              ? Icons.check
                              : Icons.add_shopping_cart_rounded,
                        ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

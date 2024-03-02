import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:lily_house/consts/app_constants.dart';
import 'package:lily_house/consts/providers/cart_provider.dart';
import 'package:lily_house/consts/providers/product_provider.dart';
import 'package:lily_house/services/assets_manager.dart';
import 'package:lily_house/widgets/app_name_text.dart';
import 'package:lily_house/widgets/products/wishlist_button_widget.dart';
import 'package:lily_house/widgets/subtitles_text.dart';
import 'package:lily_house/widgets/titles_text.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatefulWidget {
  static const routeName = "/ProductDetails";

  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final productProvider = Provider.of<ProductProvider>(context , listen: false);
    final productId = ModalRoute.of(context)!.settings.arguments as String;
    final getCurrentProduct = productProvider.findByProdId(productId);
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const AppNameTextWidget(
          fontSize: 22,
        ),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child:IconButton(
            onPressed: (){
              Navigator.canPop(context) ? Navigator.pop(context) : null;
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 18,
            )
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FancyShimmerImage(
              imageUrl: getCurrentProduct!.productImage,
              height: size.height * 0.38,
              width:  double.infinity,
              boxFit: BoxFit.contain ,
         ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                          child: Text(
                            getCurrentProduct.productTitle,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SubtitleTextWidget(
                          label: "${getCurrentProduct.productPrice}\$",
                        color: Colors.blue,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        WishlistButtonWidget(
                          productId: getCurrentProduct.productId,
                          colors: Colors.purple.shade300,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: SizedBox(
                            height: kBottomNavigationBarHeight,
                            child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.purple.shade300,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                                onPressed: (){
                                if (cartProvider.isProductInCart(productId: getCurrentProduct.productId)) {
                                  return;
                                }
                                cartProvider.addProductToCart(productId: getCurrentProduct.productId);
                          
                                },
                              icon: Icon(
                                cartProvider.isProductInCart(productId: getCurrentProduct.productId)
                                    ? Icons.check
                                    : Icons.add_shopping_cart_rounded
                              ),
                                label: Text(
                                  cartProvider.isProductInCart(productId: getCurrentProduct.productId)
                                      ?"In Cart"
                                      : "Add to Cart"

                                ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TitleTextWidget(label: "Description of item :"),
                      SubtitleTextWidget(label: getCurrentProduct.productCategory)
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  SubtitleTextWidget(
                      label:getCurrentProduct.productDescription),
                ],
        
              ),
            )
        ],
             ),
      ),
    );
  }
}


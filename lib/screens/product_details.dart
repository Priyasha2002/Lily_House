import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:lily_house/consts/app_constants.dart';
import 'package:lily_house/services/assets_manager.dart';
import 'package:lily_house/widgets/app_name_text.dart';
import 'package:lily_house/widgets/products/wishlist_button_widget.dart';
import 'package:lily_house/widgets/subtitles_text.dart';
import 'package:lily_house/widgets/titles_text.dart';

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
              imageUrl: AppConstants.productImageUrl,
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
                            "Title" * 5,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const SubtitleTextWidget(
                          label: "Rs 3000",
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
                          
                                },
                                icon: const Icon(Icons.add_shopping_cart),
                                label: const Text
                                  ("Add to cart",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  )
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
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TitleTextWidget(label: "Description of item :"),

                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  SubtitleTextWidget(label: "Product Dimensions (IN)-11.2, 4, 8.5 Closure Type - This hobo bag comes with a long removable and adjustable shoulder strap, which can be used as a women shoulder bag or hobo cross-body bag for women/Girls")
                ],
        
              ),
            )
        ],
             ),
      ),
    );
  }
}


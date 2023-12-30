import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:lily_house/consts/app_constants.dart';
import 'package:lily_house/widgets/products/wishlist_button_widget.dart';
import 'package:lily_house/widgets/subtitles_text.dart';
import 'package:lily_house/widgets/titles_text.dart';
class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: (){
          print("Navigate to product Detail Screen");
        },
        child: Column(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: FancyShimmerImage(
                    imageUrl: AppConstants.productImageUrl,
                  height: size.height *0.3,
                  width: double.infinity,
                ),
              ),
            Row(
              children: [
                Flexible(
                  flex: 5,
                    child: TitleTextWidget(
                        label: "Title" *10,
                      maxLines: 2,
                      fontSize: 18,
                    ),
                ),
                const Flexible(
                  flex: 2,
                  child: WishlistButtonWidget(),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SubtitleTextWidget(label: "₹575"),
                Material(
                  borderRadius: BorderRadius.circular(16.0),
                  child: IconButton(
                    splashColor: Colors.red,
                      splashRadius: 27.0,
                      onPressed: (){},
                      icon: const Icon(
                        Icons.add_shopping_cart_rounded,
                      ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

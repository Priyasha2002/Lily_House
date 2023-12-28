import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:lily_house/screens/cart/quantity_bottom_sheet.dart';
import 'package:lily_house/widgets/subtitles_text.dart';
import 'package:lily_house/widgets/titles_text.dart';
class CartWidget extends StatelessWidget {
  const CartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FittedBox(
      child: IntrinsicWidth(
        child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: FancyShimmerImage(
                        imageUrl: "https://m.media-amazon.com/images/I/81Uaf69-v4L._SY535_.jpg",
                      height: size.height * 0.2,
                      width: size.height * 0.2,
                    ),
                  ),
                  SizedBox(width: 10),
                  IntrinsicWidth(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: size.width * 0.6,
                                child: TitleTextWidget(
                                  label: "Title" * 10,
                                  maxLines: 2,
                                ),
                            ),
                            Column(
                              children: [
                                IconButton(
                                    onPressed: (){},
                                    icon: const Icon(
                                      Icons.delete,
                                    )
                                ),
                                IconButton(
                                    onPressed: (){},
                                    icon: const Icon(
                                      IconlyLight.heart,
                                      color: Colors.red,
                                    ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const SubtitleTextWidget(
                              label: "₹575",
                              fontSize: 20,
                              color: Colors.blue,
                            ),
                            const Spacer(),

                            OutlinedButton.icon(
                              style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)
                                ),
                                side: const BorderSide(
                                  width: 2,
                                  color: Colors.blue,
                                )
                              ),
                                onPressed: () async{
                                await showModalBottomSheet(
                                  backgroundColor:
                                  Theme.of(context).scaffoldBackgroundColor,
                                  shape:const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(16.0),
                                        topRight: Radius.circular(16.0)
                                    )
                                  ),

                                  context: context,
                                  builder: (context){
                                  return QuantityBottomSheetWidget();
                                },
                                );
                                },
                                icon: const Icon(IconlyLight.arrowDown2),
                                label:const Text("Qty : 6")
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
        
        
        ),
      ),
    );
  }
}

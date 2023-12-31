import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:lily_house/services/assets_manager.dart';
import 'package:lily_house/widgets/products/products_widget.dart';
import 'package:lily_house/widgets/titles_text.dart';

class WishListScreen extends StatefulWidget {
  static const routeName = "/WishListScreen";
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<WishListScreen> {
  late TextEditingController searchTextController;
  @override
  void initState(){
    searchTextController= TextEditingController();
    super.initState();
  }
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap :(){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const TitleTextWidget(label: "Wishlist(5)"),
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(AssetsManager.shoppingCart),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(height: 10,),
              Expanded(
                child: DynamicHeightGridView(
                  builder: (context , index) {
                    return const ProductWidget(
                      productId: "",
                    );
                  },
                  itemCount: 30,
                  crossAxisCount: 2,
                ),
              ),
            ],
          ),
        ),

      ),
    );
  }
}
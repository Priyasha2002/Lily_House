import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:lily_house/consts/providers/viewed_prod_provider.dart';
import 'package:lily_house/services/assets_manager.dart';
import 'package:lily_house/widgets/empty_widget_bag.dart';
import 'package:lily_house/widgets/products/products_widget.dart';
import 'package:lily_house/widgets/titles_text.dart';
import 'package:provider/provider.dart';

class RecentlyViewedScreen extends StatelessWidget {
  static const routeName = "/RecentlyViewedScreen";
  final bool isEmpty = false;
  const RecentlyViewedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewProdProvider = Provider.of<ViewedProdProvider>(context);
    return viewProdProvider.getviewedprodItems.isEmpty
        ? Scaffold(
      body: EmptyBagWidget(
        imagePath: AssetsManager.shoppingCart,
        title: "Your Viewed recently is empty",
        subtitle: "Looks like you haven't add anything to your cart.\nShop now and give yourself a treat",
        buttonText: "Shop Now",
      ),
    ) :
    GestureDetector(
      onTap :(){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title:  TitleTextWidget(label: "Viewed Recently(${viewProdProvider.getviewedprodItems.length})"),

          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(AssetsManager.shoppingCart),
          ),
        ),
        body:  DynamicHeightGridView(
                  builder: (context , index) {
                    return ProductWidget(
                      productId: viewProdProvider.getviewedprodItems.values.toList()[index].productId,
                    );
                  },
                  itemCount: viewProdProvider.getviewedprodItems.length,
                  crossAxisCount: 2,
                ),
      ),
    );
  }
}
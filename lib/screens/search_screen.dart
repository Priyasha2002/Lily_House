import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:lily_house/consts/providers/product_provider.dart';
import 'package:lily_house/services/assets_manager.dart';
import 'package:lily_house/widgets/products/products_widget.dart';
import 'package:lily_house/widgets/titles_text.dart';
import 'package:provider/provider.dart';

import '../models/products_model.dart';
class SearchScreen extends StatefulWidget {
  static const routeName = "/SearchScreen";
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late TextEditingController searchTextController;
  List<ProductModel> productListSearch = [];
  @override
  void initState(){
    searchTextController= TextEditingController();
    super.initState();
  }
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    String? passedCategory =
    ModalRoute.of(context)!.settings.arguments as String?;
    final List<ProductModel> productList = passedCategory == null
        ? productProvider.getProducts
        : productProvider.findByCategory(ctgName: passedCategory);
    return GestureDetector(
      onTap :(){
        FocusScope.of(context).unfocus();
    },
      child: Scaffold(
        appBar: AppBar(
          title: TitleTextWidget(label: passedCategory ?? "Search"),
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(AssetsManager.shoppingCart),
          ),
        ),
        body:productList.isEmpty? const Center(child: TitleTextWidget(label: "No products found"),)
            : Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                controller: searchTextController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(IconlyLight.search),
                  suffixIcon: IconButton(
                      onPressed: (){
                        setState(() {
                          searchTextController.clear();
                          FocusScope.of(context).unfocus();
                        });
                      },
                      icon: const Icon(IconlyLight.closeSquare
                      ),
                  ),
                ),
                onFieldSubmitted: (value) {
                  setState(() {
                    productListSearch = productProvider.searchQuery(
                        searchText: searchTextController.text,
                        passedList: productList
                    );
                  });
                },
                onChanged: (value) {
                  setState(() {
                    productListSearch = productProvider.searchQuery(
                        searchText: searchTextController.text,
                        passedList: productList
                    );
                  });
                },
              ),
              const SizedBox(height: 10,),
              if (searchTextController.text.isNotEmpty && productListSearch.isEmpty) ...[
                const Center(
                  child: TitleTextWidget(
                      label: "No results found",
                    fontSize: 30,
                  ),
                )
              ],
              Expanded(
                child: DynamicHeightGridView(
                    builder: (context , index) {
                      return ProductWidget(productId: searchTextController.text.isNotEmpty
                              ? productListSearch[index].productId
                              :productList[index].productId
                      );
                    },
                    itemCount: searchTextController.text.isNotEmpty
                        ? productListSearch.length
                        : productList.length,
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

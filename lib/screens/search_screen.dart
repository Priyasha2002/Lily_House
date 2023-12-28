import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:lily_house/services/assets_manager.dart';
import 'package:lily_house/widgets/products/products_widget.dart';
import 'package:lily_house/widgets/titles_text.dart';
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
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
          title: const TitleTextWidget(label: "Search Products"),
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(AssetsManager.shoppingCart),
          ),
        ),
        body: Padding(
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
                  print(searchTextController.text);
                },
              ),
              SizedBox(height: 10,),
              Expanded(
                child: DynamicHeightGridView(
                    builder: (context , index) {
                      return ProductWidget();
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

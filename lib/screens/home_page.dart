import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:lily_house/consts/app_constants.dart';
import 'package:lily_house/consts/providers/product_provider.dart';
import 'package:lily_house/services/assets_manager.dart';
import 'package:lily_house/widgets/products/category_rounded_widget.dart';
import 'package:lily_house/widgets/products/latest_arrival_products_widget.dart';
import 'package:lily_house/widgets/titles_text.dart';
import 'package:provider/provider.dart';

import '../consts/providers/theme_provider.dart';
import '../widgets/app_name_text.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const AppNameTextWidget(),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(AssetsManager.shoppingCart),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               SizedBox(
                  height: size.height * 0.25,
                   child: Swiper(
                      itemBuilder: (context , index){
                        return
                            Image.asset(AppConstants.bannersImages[index],);
                      },
                     itemCount: AppConstants.bannersImages.length,
                        autoplay: true,
                     pagination: const SwiperPagination(
                       alignment: Alignment.bottomCenter,
                       builder: DotSwiperPaginationBuilder(
                         color: Colors.white,
                         activeColor: Colors.red,
                       )
                     ),
                    ),
                  ),
              const SizedBox(
                height: 18,
              ),
              const TitleTextWidget(
                label: "Latest Arrivals" ,
                fontSize: 22,
              ),
              const SizedBox(
                height: 18,
              ),
              SizedBox(
                height: size.height *0.2,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                    itemBuilder: (context, index){
                      return ChangeNotifierProvider.value(
                        value: productProvider.getProducts[index],
                          child: const LatestarrivalProductsWidget()
                      );
                    }
                    ),
              ),
              const SizedBox(
                height:18 ,
              ),
              const TitleTextWidget(label: "Categories",
              fontSize: 22,
              ),
              const SizedBox(
                height:18 ,
              ),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 4,
                children:
                  List.generate(AppConstants.categoriesList.length, (index) {
                    return CategoryRoundedWidget(
                      image: AppConstants.categoriesList[index].images,
                      name: AppConstants.categoriesList[index].name,
                    );
                  }),
        
              )
            ],
          ),
        ),
      ),
    );
  }
}

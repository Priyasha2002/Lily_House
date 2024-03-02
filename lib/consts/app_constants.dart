import 'package:lily_house/models/category_models.dart';
import 'package:lily_house/services/assets_manager.dart';

class AppConstants {
  static String productImageUrl = "https://www.jiomart.com/images/product/original/rv2gqq9e2b/exotic-women-grey-hand-bag-hb410-product-images-rv2gqq9e2b-0-202212051751.jpg?im=Resize=(600,750)";


  static List<String> bannersImages= [
    AssetsManager.bag_image,
    AssetsManager.bag2_image,
    AssetsManager.bag4_image
  ];

  static List<CategoryModel> categoriesList = [
    CategoryModel(
        id: "Handbags",
        images: AssetsManager.hand_bag,
        name: "Handbags"
    ),
    CategoryModel(
        id: "Watches",
        images: AssetsManager.watch,
        name: "Watches"
    ),
    CategoryModel(
        id: "Cosmetics",
        images: AssetsManager.cosmetics,
        name: "Cosmetics"
    ),
    CategoryModel(
        id: "Laptops",
        images: AssetsManager.pc,
        name: "Laptops"
    ),
    CategoryModel(
        id: "Fashion",
        images: AssetsManager.fashion,
        name: "Fashion"
    ),
    CategoryModel(
        id: "Books",
        images: AssetsManager.book,
        name: "Books"
    ),
    CategoryModel(
        id: "Shoes",
        images: AssetsManager.shoes,
        name: "Shoes"
    ),

  ];

  static String apiKey = "AIzaSyB3FVENmfsQkr2iGriWoEpDS71oicWUjB0";
  static String appId = "1:29973919513:android:6d7a2fba982fc4e45af788";
  static String messagingSenderId = "29973919513";
  static String projectId = "lily-house-6329c";
}
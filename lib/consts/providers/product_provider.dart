import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../../models/products_model.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> get getProducts {
    return _products;
  }

  ProductModel? findByProdId(String productId) {
    if (_products.where((element) => element.productId == productId).isEmpty) {
      return null;
    }
    return _products.firstWhere((element) => element.productId == productId);
  }

  List<ProductModel> findByCategory({required String ctgName}) {
    List<ProductModel> ctgList = _products
        .where((element) => element.productCategory
        .toLowerCase()
        .contains(ctgName.toLowerCase()))
        .toList();

    return ctgList;
  }

  List<ProductModel> searchQuery(
      {required String searchText, required List<ProductModel> passedList}) {
    List<ProductModel> searchList = passedList
        .where((element) => element.productTitle
        .toLowerCase()
        .contains(searchText.toLowerCase()))
        .toList();
    return searchList;
  }

  final List<ProductModel> _products = [
    // Handbags
    ProductModel(
      //1
      productId: '410381342001',
      productTitle: "Women Pink Messenger Bag",
      productPrice: "2999",
      productCategory: "Handbags",
      productDescription:
      "Wipe with clean, dry cloth ;PVC: Dimensions: 40.5 cm x 31 cm x 13 cm; Package contains: 1 bag, 1 detachable strap;One main compartment, one interior zipper pocket",
      productImage: "https://rukminim2.flixcart.com/image/832/832/xif0q/hand-messenger-bag/w/w/b/-original-imagrh35g9zdguwn.jpeg?q=70&crop=false",
      productQuantity: "10",
    ),
    ProductModel(
      //2
      productId: '410381342000',
      productTitle:
      "Girls Blue Messenger Bag",
      productPrice: "2999",
      productCategory: "Handbags",
      productDescription:
      "Model Name: small stylish sling bag for women and girls.Number of Compartments:2,Capacity: 5 LWater; Resistant: No; Material: PU ;Number of Pockets: 1 ,Width: 14cm ;Depth:12cm; Weight: 350 ",
      productImage:
      "https://rukminim2.flixcart.com/image/832/832/l1fc0i80/sling-bag/f/3/b/technic-sling-technic-red-sling-bag-hercraft-original-imagczc2j6dp6xdg.jpeg?q=70&crop=false",
      productQuantity: "15",
    ),

    ProductModel(
      //3
      productId: "4103813420002",
      productTitle: "Women Green Handbag - Mini",
      productPrice: "2999",
      productCategory: "Handbags",
      productDescription:
      "Capacity: 5 L; Sales Package:Handbag Set Of 5;Bag Size:Mini;Material:Artificial Leather;Width:12 cm;Height:10.5 cm;Closure:Zip,Color:Green",
      productImage: "https://rukminim2.flixcart.com/image/832/832/kqjtd3k0/hand-messenger-bag/s/q/n/orignal-sea-green-combo-messenger-bag-1-orignal-sea-green-combo-original-imag4j98yejtvjfw.jpeg?q=70&crop=false",
      productQuantity: "144",
    ),
    ProductModel(
      //4
      productId: const Uuid().v4(),
      productTitle:
      "Women Black Handbag - Regular Size",
      productPrice: "2999",
      productCategory: "Handbags",
      productDescription:
      " This handbags from the house of LIKE STYLE. It's made from PU leather material. Stylish Design:- A bag which is fashionable and stylish purse for women enough, concise and powerful at the same time, perfectly show your personality. High Quality PU Leather Ladies Purse ,Handbags with Sling bag.Top Zipper Closure,Adjustable and Removable Shoulder Strap.Diffrent Ways To Carry, You Can Use The Bag As Tote, Shoulder Bag Or Crossbody Bag. The LIKE STYLE collection Handbag is a great handbags for women and girls purse in Beautiful Colors. It’s women's cross-body bags fashionable-elegance-affordable all together. You can carry to anywhere on all year season. STURDY HANDLE: Pu hand bag handle is sturdy since it have been double reinforced not worries when you carry some heavy stuffs which are strong enough to support up to 5 KG of stuffs. bags for women stylish latest | girls college office bag | shoulder bag purse | women's handbag | ladies hand bagsThe sling bag/ Wallet is an added accessory along with the handbag and together they make up a cool accessory combo",
      productImage:
      "https://rukminim2.flixcart.com/image/832/832/xif0q/hand-messenger-bag/d/e/j/-original-imagvz4ajdx2vafz.jpeg?q=70&crop=false",
      productQuantity: "2363",
    ),
    ProductModel(
      //5
      productId: const Uuid().v4(),
      productTitle:
      "mCaffeine Face Glow Kit",
      productPrice: "3000",
      productCategory: "Cosmetics",
      productDescription:
      "About this item\nPro Grade Camera: Zoom in close with 100X Space Zoom, and take photos and videos like a pro with our easy-to-use, multi-lens camera.\n100x Zoom: Get amazing clarity with a dual lens combo of 3x and 10x optical zoom, or go even further with our revolutionary 100x Space Zoom.\nHighest Smartphone Resolution: Crystal clear 108MP allows you to pinch, crop and zoom in on your photos to see tiny, unexpected details, while lightning-fast Laser Focus keeps your focal point clear\nAll Day Intelligent Battery: Intuitively manages your cellphone’s usage, so you can go all day without charging (based on average battery life under typical usage conditions).\nPower of 5G: Get next-level power for everything you love to do with Samsung Galaxy 5G; More sharing, more gaming, more experiences and never miss a beat",
      productImage:
      "https://www.mcaffeine.com/cdn/shop/products/1_a3ab81f3-3ef0-4d0e-9d1d-e81a18de1f43.jpg?v=1630552091",
      productQuantity: "3625",
    ),
    ProductModel(
      //6
      productId: const Uuid().v4(),
      productTitle:
      "mCaffeine Body Glow Combo",
      productPrice: "2500",
      productCategory: "Cosmetics",
      productDescription:
      "About this item\n6.7 inch LTPO Fluid2 AMOLED, 1B colors, 120Hz, HDR10+, 1300 nits (peak)\n256GB internal storage, 12GB RAM\nQuad rear camera: 48MP, 50MP, 8MP, 2MP\n16MP front-facing camera\n4500mAh battery with Warp Charge 65T (10V/6.5A) and 50W Wireless Charging\n5G capable for lightning fast download and streaming",
      productImage:
      "https://www.mcaffeine.com/cdn/shop/files/DeepBodyCleansing-CoffeeTrio_1.jpg?v=1699355782",
      productQuantity: "3636",
    ),
    ProductModel(
      //30
      productId: const Uuid().v4(),
      productTitle: "Rare Beauty",
      productPrice: "5000",
      productCategory: "Cosmetics",
      productDescription:
      "About this item\nSignature striped fabric liner\n15 inch laptop sleeve\nFront storage pocket with key clip\nInternal media pocket with headphone port\nClassic woven label\nDimensions: 17.75 inches (H) x 12.25 inches (W) x 5.75 inches (D)",
      productImage:
      "https://www.refinery29.com/images/10115046.jpg?format=webp&width=&height=&quality=85",
      productQuantity: "3637",
    ),

    ProductModel(
      //8
      productId: const Uuid().v4(),
      productTitle: "mCaffeine Anti Aging Prevention Kit",
      productPrice: "1999",
      productCategory: "Cosmetics",
      productDescription:
      "A new, larger 6.7-inch size joins the popular 6.1-inch design, featuring a new dual-camera system, Crash Detection, a smartphone industry-first safety service with Emergency SOS via satellite, and the best battery life on iPhone",
      productImage: "https://m.media-amazon.com/images/I/51iQm3UBclL._AC_UF1000,1000_QL80_.jpg",
      productQuantity: "2526",
    ),
    ProductModel(
      //36
      productId: const Uuid().v4(),
      productTitle: "Smocked Ruffled Bodycon Dress",
      productPrice: "2499",
      productCategory: "Fashion",
      productDescription:
      "About this item\nSuede and Canvas Upper\nRe-enforced toecaps\nPadded collars\nSignature rubber waffle outsole",
      productImage: "https://img101.urbanic.com/v1/goods-pic/d5a8719b64e94f259cd4d7ac125422d3UR_w1440_q90.webp",
      productQuantity: "383",
    ),
    ProductModel(
      //36
      productId: const Uuid().v4(),
      productTitle: "Starry pink ",
      productPrice: "2999",
      productCategory: "Fashion",
      productDescription:
      "About this item\nSuede and Canvas Upper\nRe-enforced toecaps\nPadded collars\nSignature rubber waffle outsole",
      productImage: "https://img101.urbanic.com/v1/goods-pic/e716d6d33f4c493486fdf2fd0d713cedUR_w1440_q90.webp",
      productQuantity: "383",
    ),
    ProductModel(
      //7
      productId: const Uuid().v4(),
      productTitle: "Samsung Galaxy Z Flip3 5G",
      productPrice: "999.99",
      productCategory: "Cosmetics",
      productDescription:
      "About this item\nGet the latest Galaxy experience on your phone.\nFOLDING DISPLAY - Transform the way you capture, share and experience content.\nCAPTURE EVERYTHING - With the wide-angle camera and the front camera, take stunning photos and videos from every angle.\nWATER RESISTANT - Use your Galaxy Z Flip3 5G even when it rains.\nONE UI 3.1 - Enjoy the Galaxy Z Flip3 5G’s sleek, premium design and all the features you love from the latest One UI 3.1. ",
      productImage: "https://www.minifeel.in/cdn/shop/files/Packof12mcaffeinecombo.jpg?v=1694676383",
      productQuantity: "525",
    ),

    ProductModel(
      //9
      productId: const Uuid().v4(),
      productTitle: "Xiaomi Redmi Note 10 Pro",
      productPrice: "249.99",
      productCategory: "Phones",
      productDescription:
      "About this item\n6.67-inch 120Hz AMOLED display with TrueColor\n108MP quad rear camera system with 8K video support\nQualcomm Snapdragon 732G processor\n5020mAh (typ) high-capacity battery\n33W fast charging support and 33W fast charger included in the box",
      productImage: "https://i.ibb.co/W3QcVMv/9-Xiaomi-Redmi-Note-10-Pro.png",
      productQuantity: "353",
    ),
    ProductModel(
      //10
      productId: const Uuid().v4(),
      productTitle: "OnePlus 10 Pro 5G",
      productPrice: "899.99",
      productCategory: "Phones",
      productDescription:
      "About this item\n6.7 inch Fluid AMOLED Display with LTPO, 120 Hz refresh rate, 10-bit color, HDR10+, and adaptive refresh rate\nQualcomm Snapdragon 8 Gen 1 with Adreno 730 GPU\n4500 mAh battery with Warp Charge 65T (10V/6.5A) + Wireless Warp Charge 50\n256GB Internal Storage | 12GB RAM\nOxygenOS 12 based on Android 12 with Play Store",
      productImage: "https://i.ibb.co/9vGVHQk/10-One-Plus-10-Pro-5-G.png",
      productQuantity: "3873",
    ),
    ProductModel(
      //11
      productId: const Uuid().v4(),
      productTitle: "Google Pixel 6",
      productPrice: "799.99",
      productCategory: "Cosmetics",
      productDescription:
      "About this item\nPowered by Google Tensor chip, designed for mobile, the Google Pixel 6 delivers exceptional AI-powered experiences.\n6.4-inch Full HD+ display with 90Hz refresh rate and HDR10+.\n50MP + 12MP dual rear camera system, 4K/60fps video recording.\n8MP front camera with Night Sight, portrait mode and more.\nBuilt-in Titan M2 security chip for advanced security.\nAndroid 12 OS with three years of updates and monthly security patches.",
      productImage: "https://www.abeautyedit.com/wp-content/uploads/2020/06/best-of-maybelline-drugstore-makeup-f2.jpg.webp",
      productQuantity: "62332",
    ),
    // Laptops
    // https://i.ibb.co/MDcGHsb/12-ASUS-ROG-Zephyrus-G15.jpg
    ProductModel(
      //12
      productId: const Uuid().v4(),
      productTitle: "ASUS ROG Zephyrus G15",
      productPrice: "1599.99",
      productCategory: "Laptops",
      productDescription:
      "About this item\nUltra Slim Gaming Laptop, 15.6” 144Hz FHD Display, GeForce GTX 1660 Ti Max-Q, AMD Ryzen 7 4800HS, 16GB DDR4, 512GB PCIe NVMe SSD, Wi-Fi 6, RGB Keyboard, Windows 10 Home, GA502IU-ES76",
      productImage: "https://i.ibb.co/kMR5mpR/12-ASUS-ROG-Zephyrus-G15.png",
      productQuantity: "525",
    ),
    ProductModel(
      //13
      productId: const Uuid().v4(),
      productTitle: "Acer Predator Helios 300",
      productPrice: "1199.99",
      productCategory: "Laptops",
      productDescription:
      "About this item\n10th Generation Intel Core i7-10750H 6-Core Processor (Up to 5.0 GHz) with Windows 10 Home 64 Bit\nOverclockable NVIDIA GeForce RTX 3060 Laptop GPU with 6 GB of dedicated GDDR6 VRAM, NVIDIA DLSS, NVIDIA Dynamic Boost 2.0, NVIDIA GPU Boost\n15.6\" Full HD (1920 x 1080) Widescreen LED-backlit IPS Display (144Hz Refresh Rate, 3ms Overdrive Response Time & 300nit Brightness)",
      productImage: "https://i.ibb.co/tcB3HXJ/13-Acer-Predator-Helios-300.webp",
      productQuantity: "5353",
    ),
    ProductModel(
      //14
      productId: const Uuid().v4(),
      productTitle: "Razer Blade 15 Base",
      productPrice: "1599.99",
      productCategory: "Laptops",
      productDescription:
      "About this item\nMore power: The 10th Gen Intel Core i7-10750H processor provides the ultimate level of performance with up to 5.0 GHz max turbo and 6 cores\nSupercharger: NVIDIA GeForce GTX 1660 Ti graphics delivers faster, smoother gameplay\nThin and compact: The CNC aluminum unibody frame houses incredible performance in the most compact footprint possible, while remaining remarkably durable and just 0.78\" thin",
      productImage: "https://i.ibb.co/XDtWpXC/14-Razer-Blade-15-Base.png",
      productQuantity: "5335",
    ),
    ProductModel(
      //15
      productId: const Uuid().v4(),
      productTitle: "MSI GS66 Stealth",
      productPrice: "1999.99",
      productCategory: "Laptops",
      productDescription:
      "About this item\n15.6\" FHD, Anti-Glare Wide View Angle 240Hz 3ms | NVIDIA GeForce RTX 2070 Max-Q 8G GDDR6\nIntel Core i7-10750H 2.6 - 5.0GHz | Intel Wi-Fi 6 AX201(22 ax)\n16GB (8G2) DDR4 3200MHz | 2 Sockets | Max Memory 64GB\nUSB 3.2 Gen2 3 | Thunderbolt 31 PD charge",
      productImage: "https://i.ibb.co/0Q4xHVn/15-MSI-GS66-Stealth.png",
      productQuantity: "2599",
    ),

    // WATCHES
    ProductModel(
      //16
      productId: const Uuid().v4(),
      productTitle: "Apple Watch Series 7",
      productPrice: "399.99",
      productCategory: "Watches",
      productDescription:
      "About this item\nAlways-On Retina display has been redesigned to be larger, yet still always on, so you can easily see the time and your watch face.\nAdvanced workout features let you measure your blood oxygen level, sleep, and heart rate, and there are cycling, yoga, and dance workouts to choose from.\nChoose from new watch faces, new colors, and new bands, including the Hermès Fastener, which is inspired by the buckle on the straps of Hermès horse harnesses.\nApple Watch Series 7 has a water resistance rating of 50 meters under ISO standard 22810:2010.",
      productImage: "https://i.ibb.co/8cNwrbJ/16-Apple-Watch-Series-7.png",
      productQuantity: "535352",
    ),
    ProductModel(
      //17
      productId: const Uuid().v4(),
      productTitle: "Samsung Galaxy Watch 4",
      productPrice: "249.99",
      productCategory: "Watches",
      productDescription:
      "About this item\nTake your fitness to the next level with advanced sensors that track your body composition, heart rate, sleep quality, and more.\nThe watch automatically detects and tracks over 90 different exercises, from running and cycling to swimming and rowing.\nGalaxy Watch 4 lets you control your smart home devices right from your wrist, so you can turn off the lights, adjust the thermostat, and more.\nThe watch comes with a choice of watch faces, so you can customize it to match your style.",
      productImage: "https://i.ibb.co/tsq0VD8/17-Samsung-Galaxy-Watch-4.png",
      productQuantity: "252",
    ),
    ProductModel(
      //18
      productId: const Uuid().v4(),
      productTitle: "Fitbit Sense Advanced Smartwatch",
      productPrice: "299.95",
      productCategory: "Watches",
      productDescription:
      "About this item\nThe Fitbit Sense is an advanced smartwatch that tracks your heart rate, skin temperature, and stress levels.\nIt also has built-in GPS and lets you control your Spotify music right from your wrist.\nThe watch comes with a choice of watch faces, and you can customize it with a variety of bands.\nThe battery lasts up to 6 days, so you can wear it all week without needing to recharge it.",
      productImage:
      "https://i.ibb.co/jrVQppF/18-Fitbit-Sense-Advanced-Smartwatch.png",
      productQuantity: "526",
    ),
    ProductModel(
      //19
      productId: const Uuid().v4(),
      productTitle: "Garmin Forerunner 945 LTE",
      productPrice: "649.99",
      productCategory: "Watches",
      productDescription:
      "About this item\nThe Garmin Forerunner 945 LTE is a high-end GPS running watch with LTE connectivity, so you can leave your phone at home.\nIt has built-in music storage and lets you pay for purchases with Garmin Pay.\nThe watch comes with a choice of watch faces, and you can customize it with a variety of bands.\nThe battery lasts up to 10 days in smartwatch mode and up to 36 hours in GPS mode with music.",
      productImage: "https://i.ibb.co/xXhSfTh/19-Garmin-Forerunner-945-LTE.png",
      productQuantity: "58385",
    ),
    // SHOES
    ProductModel(
      //20
      productId: const Uuid().v4(),
      productTitle: "Nike Air Force 1 '07",
      productPrice: "90.88",
      productCategory: "Shoes",
      productDescription:
      "About this item\nFull-grain leather in the upper adds a premium look and feel.\nOriginally designed for performance hoops, Nike Air cushioning adds lightweight, all-day comfort.\nThe padded, low-cut collar looks sleek and feels great.\nPerforations on the toe provide airflow for breathability.\nThe non-marking rubber sole adds traction and durability.",
      productImage: "https://i.ibb.co/8r1Ny2n/20-Nike-Air-Force-1-07.png",
      productQuantity: "7544",
    ),
    ProductModel(
      //21
      productId: const Uuid().v4(),
      productTitle: "Adidas Ultraboost 21",
      productPrice: "180.53",
      productCategory: "Shoes",
      productDescription:
      "About this item\nResponsive Boost midsole\n3D Heel Frame\nSock-like fit\nPrimeknit+ upper\nStretchweb outsole with Continental™ Rubber",
      productImage: "https://i.ibb.co/QM1dLww/21-Adidas-Ultraboost-21.webp",
      productQuantity: "7654",
    ),
    ProductModel(
      //22
      productId: const Uuid().v4(),
      productTitle: "Converse Chuck Taylor All Star High Top",
      productPrice: "55.12",
      productCategory: "Shoes",
      productDescription:
      "About this item\n100% Synthetic\nImported\nRubber sole\nShaft measures approximately 4.5 from arch\nPlatform measures approximately 0.25\nLace-up, high-top sneaker\nOrthoLite insole for cushioning\nMedial eyelets for airflow\nCanvas upper",
      productImage:
      "https://i.ibb.co/TBQv7G6/22-Converse-Chuck-Taylor-All-Star-High-Top.png",
      productQuantity: "36437",
    ),
    ProductModel(
      //23
      productId: const Uuid().v4(),
      productTitle: "New Balance Fresh Foam 1080v11",
      productPrice: "149.99",
      productCategory: "Shoes",
      productDescription:
      "About this item\nSynthetic and mesh upper for a breathable and supportive fit\nFresh Foam midsole cushioning is precision engineered to deliver an ultra-cushioned, lightweight ride\nBlown rubber outsole provides durability and traction\nLace closure ensures a secure fit\nOrtholite cushioning adds extra comfort",
      productImage:
      "https://i.ibb.co/k2BtR9X/23-New-Balance-Fresh-Foam-1080v11.webp",
      productQuantity: "36637",
    ),
    ProductModel(
      //24
      productId: const Uuid().v4(),
      productTitle: "Vans Old Skool",
      productPrice: "60.33",
      productCategory: "Shoes",
      productDescription:
      "About this item\nCanvas and suede upper for durability\nReinforced toe cap for added durability\nPadded collar for support and flexibility\nVulcanized construction for durability and grip\nSignature rubber waffle outsole for traction",
      productImage: "https://i.ibb.co/NNDk3pt/24-Vans-Old-Skool.png",
      productQuantity: "3637",
    ),
    ProductModel(
      //25
      productId: const Uuid().v4(),
      productTitle: "Adidas Ultraboost 21",
      productPrice: "180.7",
      productCategory: "Shoes",
      productDescription:
      "About this item\nBoost cushioning technology delivers comfort and energy return with every step\n3D Heel Frame cradles the heel for natural fit and optimal movement of the Achilles\nPrimeknit+ upper adapts to the changing shape of your foot through the gait cycle\nTorsion System provides a stable feel from heel strike to toe-off\nStretchweb outsole flexes naturally for an energized ride",
      productImage: "https://i.ibb.co/VmvdBqC/25-Adidas-Ultraboost-21.webp",
      productQuantity: "8565",
    ),
    ProductModel(
      //26
      productId: const Uuid().v4(),
      productTitle: "Nike Air Max 270",
      productPrice: "150.78",
      productCategory: "Shoes",
      productDescription:
      "About this item\nLarge Max Air unit delivers plush cushioning and all-day comfort\nNeoprene stretch bootie design delivers a snug fit\n3-piece midsole offers durability and a smooth transition\nMono-mesh window in the quarter and engineered mesh in the forefoot provide durability\nRubber toe tip provides durability and grip during training movements such as planks and push-ups",
      productImage: "https://i.ibb.co/Tk3WDX1/26-Nike-Air-Max-270.png",
      productQuantity: "6437",
    ),
    ProductModel(
      //27
      productId: const Uuid().v4(),
      productTitle: "New Balance Fresh Foam 1080v11",
      productPrice: "149.99",
      productCategory: "Shoes",
      productDescription:
      "About this item\nFresh Foam midsole cushioning is precision engineered to deliver an ultra-cushioned, lightweight ride\nSynthetic/mesh upper\nOrtholite sockliner for comfort\nBlown rubber outsole provides durability\nUltra Heel design hugs the back of the foot for a snug, supportive fit",
      productImage:
      "https://i.ibb.co/5rxL1Ck/27-New-Balance-Fresh-Foam-1080v11.png",
      productQuantity: "7853",
    ),
    ProductModel(
      //28
      productId: const Uuid().v4(),
      productTitle: "Puma Future Z 1.1 FG/AG Soccer Cleats",
      productPrice: "199.99",
      productCategory: "Shoes",
      productDescription:
      "About this item\nAdaptive FUZIONFIT+ compression band for unparalleled fit and lockdown\nMATRYXEVO woven upper constructed with reactive Kevlar and Carbon yarns for support during fast-forward motion\nDynamic Motion System outsole provides grip and agility\nGripControl Pro coating for better ball control",
      productImage: "https://i.ibb.co/8bMhmCj/28-Puma-Future-Z-1-1-FG.webp",
      productQuantity: "474",
    ),
    // Clothes
    ProductModel(
      //29
      productId: const Uuid().v4(),
      productTitle: "Ray-Ban Wayfarer Sunglasses",
      productPrice: "150.75",
      productCategory: "Accessories",
      productDescription:
      "About this item\n100% UV protection: Ray-Ban sunglass lenses are coated with 100% UV protection to protect your eyes from all harmful UV rays\nPolarized sunglasses: These classic Ray-Ban Wayfarer sunglasses feature polarized lenses to reduce glare and enhance clarity\nIconic style: The Wayfarer is one of Ray-Ban's most recognizable and classic designs, available in a variety of lens and frame colors\nDurable construction: These Ray-Ban sunglasses are built to last with high-quality materials and construction",
      productImage:
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8lK8pk9Rag7njPUQNBaB08JrIh10pO87YDFEMGf0WKQ85O6G00cx9-eAmbhm9CZWHn0Y&usqp=CAU",
      productQuantity: "7436",
    ),

    ProductModel(
      //31
      productId: const Uuid().v4(),
      productTitle: "Fitbit Charge 5 Advanced Fitness Tracker",
      productPrice: "179.95",
      productCategory: "Accessories",
      productDescription:
      "About this item\nAdvanced sensors track daily activity, sleep, and stress levels\nUp to 7-day battery life\nEasily track heart rate and exercise metrics\nReceive notifications and control music from your wrist\nWater-resistant up to 50m\nConnect to your phone's GPS to track outdoor activities",
      productImage:
      "https://i.ibb.co/Wz2yzQ7/31-Fitbit-Charge-5-Advanced-Fitness-Tracker.png",
      productQuantity: "347343",
    ),
    ProductModel(
      //32
      productId: const Uuid().v4(),
      productTitle: "Fjallraven Kanken Classic Backpack",
      productPrice: "79.95",
      productCategory: "Accessories",
      productDescription:
      "About this item\nVinylon F fabric is durable and water-resistant\nClassic design with a spacious main compartment and front zippered pocket\nPadded shoulder straps for comfortable carrying\nDual top handles for easy transport\nReflective logo for visibility in low light\nDimensions: 15 inches (H) x 10.6 inches (W) x 5.1 inches (D)",
      productImage:
      "https://i.ibb.co/sjH157B/32-Fjallraven-Kanken-Classic-Backpack.jpg",
      productQuantity: "7585",
    ),
    ProductModel(
      //33
      productId: const Uuid().v4(),
      productTitle: "Nike Air Force 1 '07",
      productPrice: "90.99",
      productCategory: "Shoes",
      productDescription:
      "About this item\nFull-grain leather in the upper adds a premium look and feel.\nThe low-cut silhouette adds a simple, streamlined look.\nPadding at the collar feels soft and comfortable.\nNon-marking rubber in the sole adds traction and durability.",
      productImage: "https://i.ibb.co/G5kWzbM/33-Nike-Air-Force-1.webp",
      productQuantity: "47548",
    ),
    ProductModel(
      //34
      productId: const Uuid().v4(),
      productTitle: "Adidas Ultraboost 21",
      productPrice: "180.99",
      productCategory: "Shoes",
      productDescription:
      "About this item\nadidas Primeknit+ textile upper\nLace closure\nBoost midsole\nContinental™ Rubber outsole\nadidas Torsion System",
      productImage: "https://i.ibb.co/X7tVsZ1/34-Adidas-Ultraboost-21.webp",
      productQuantity: "7485",
    ),
    ProductModel(
      //35
      productId: const Uuid().v4(),
      productTitle: "Converse Chuck Taylor All Star Low Top",
      productPrice: "50.9",
      productCategory: "Shoes",
      productDescription:
      "About this item\nLow-top sneaker with canvas upper\nIconic silhouette\nOrthoLite insole for comfort\nDiamond outsole tread\nUnisex Sizing",
      productImage:
      "https://i.ibb.co/TBQv7G6/22-Converse-Chuck-Taylor-All-Star-High-Top.png",
      productQuantity: "47433",
    ),
    ProductModel(
      //36
      productId: const Uuid().v4(),
      productTitle: "Vans Old Skool Classic Skate Shoes",
      productPrice: "65.99",
      productCategory: "Shoes",
      productDescription:
      "About this item\nSuede and Canvas Upper\nRe-enforced toecaps\nPadded collars\nSignature rubber waffle outsole",
      productImage: "https://i.ibb.co/NNDk3pt/24-Vans-Old-Skool.png",
      productQuantity: "383",
    ),




// Fashion
    ProductModel(
      //36
      productId: const Uuid().v4(),
      productTitle: "Formal but stylish",
      productPrice: "2499",
      productCategory: "Fashion",
      productDescription:
      "About this item\nSuede and Canvas Upper\nRe-enforced toecaps\nPadded collars\nSignature rubber waffle outsole",
      productImage: "https://www.alamodelabel.in/cdn/shop/files/2D796CDB-CED1-4828-A4B7-F94536DAE86F_800x.jpg?v=1699521098",
      productQuantity: "383",
    ),
    ProductModel(
      //36
      productId: const Uuid().v4(),
      productTitle: "Royal Pink Dress",
      productPrice: "2499",
      productCategory: "Fashion",
      productDescription:
      "About this item\nSuede and Canvas Upper\nRe-enforced toecaps\nPadded collars\nSignature rubber waffle outsole",
      productImage: "https://img101.urbanic.com/v1/goods-pic/0d11e8ac54de4ddd9cfb2b1d1e8d69aaUR_w540_q85.webp",
      productQuantity: "383",
    ),
    ProductModel(
      //36
      productId: const Uuid().v4(),
      productTitle: "Patchwork Bodysuit",
      productPrice: "2999",
      productCategory: "Fashion",
      productDescription:
      "About this item\nSuede and Canvas Upper\nRe-enforced toecaps\nPadded collars\nSignature rubber waffle outsole",
      productImage: "https://img101.urbanic.com/v1/goods-pic/faa17673d2db472cb9d97bd6bf5c40e1UR_w1440_q90.webp",
      productQuantity: "383",
    ),
    ProductModel(
      //36
      productId: const Uuid().v4(),
      productTitle: "Ruffle Playsuit",
      productPrice: "2499",
      productCategory: "Fashion",
      productDescription:
      "About this item\nSuede and Canvas Upper\nRe-enforced toecaps\nPadded collars\nSignature rubber waffle outsole",
      productImage: "https://img101.urbanic.com/v1/goods-pic/58e10b4c43c743afbad73de022491c32UR_w1440_q90.webp",
      productQuantity: "383",
    ),
    ProductModel(
      //36
      productId: const Uuid().v4(),
      productTitle: "Feather Co-ord Set",
      productPrice: "2499",
      productCategory: "Fashion",
      productDescription:
      "About this item\nSuede and Canvas Upper\nRe-enforced toecaps\nPadded collars\nSignature rubber waffle outsole",
      productImage: "https://img101.urbanic.com/v1/goods-pic/34b44e407f8244efa06a5a22aa4d687dUR_w1440_q90.webp",
      productQuantity: "383",
    ),
    ProductModel(
      //36
      productId: const Uuid().v4(),
      productTitle: "Selena Jeans",
      productPrice: "3500",
      productCategory: "Fashion",
      productDescription:
      "About this item\nSuede and Canvas Upper\nRe-enforced toecaps\nPadded collars\nSignature rubber waffle outsole",
      productImage: "https://i.pinimg.com/736x/7b/69/13/7b69131be15794c496d9500bb51d73fc.jpg",
      productQuantity: "383",
    ),
    ProductModel(
      //36
      productId: const Uuid().v4(),
      productTitle: "Selena Jeans",
      productPrice: "3500",
      productCategory: "Fashion",
      productDescription:
      "About this item\nSuede and Canvas Upper\nRe-enforced toecaps\nPadded collars\nSignature rubber waffle outsole",
      productImage: "https://www.celebsfirst.com/wp-content/uploads/2017/10/selena-gomez-out-and-about-in-a-black-top-and-jeans-in-new-york-city-031017_1.jpg",
      productQuantity: "383",
    ),
    ProductModel(
      //36
      productId: const Uuid().v4(),
      productTitle: "Selena Jeans",
      productPrice: "3500",
      productCategory: "Fashion",
      productDescription:
      "About this item\nSuede and Canvas Upper\nRe-enforced toecaps\nPadded collars\nSignature rubber waffle outsole",
      productImage: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrDsvd0SbDkbbbIQ4cpHXudfC0iUTCAuwwggHXwS4P-1HOoScG9zScFJlDbqCETQjf_w0&usqp=CAU",
      productQuantity: "383",
    ),
  ];
}





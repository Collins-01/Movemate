import 'package:flutter/material.dart';

class AppAssets {
  static const String truckOne = "";
  static const String truckTwo = "assets/images/truck_two.jpeg";
  static const String truckThree = "assets/images/truck_three.jpeg";
  static const String man = "assets/images/man.jpeg";
  static const String deliveryBox = "assets/images/delivery_box.jpeg";
  static const String box = "assets/images/box.png";
  static const String deployedCode = "assets/images/deployed_code.png";

  static Future<void> preCacheAssets(BuildContext context) async {
    // precacheImage(const AssetImage(truckOne), context);
    precacheImage(const AssetImage(truckTwo), context);
    precacheImage(const AssetImage(truckThree), context);
    precacheImage(const AssetImage(man), context);
    precacheImage(const AssetImage(box), context);
    precacheImage(const AssetImage(deployedCode), context);
  }
}

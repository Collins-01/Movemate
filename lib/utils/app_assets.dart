import 'package:flutter/material.dart';

class AppAssets {
  static const String truckOne = "";
  static const String truckTwo = "assets/images/truck_two.jpeg";
  static const String truckThree = "assets/images/truck_three.jpeg";
  static const String man = "assets/images/man.jpeg";

  static Future<void> preCacheAssets(BuildContext context) async {
    // precacheImage(const AssetImage(truckOne), context);
    precacheImage(const AssetImage(truckTwo), context);
    precacheImage(const AssetImage(truckThree), context);
    precacheImage(const AssetImage(man), context);
  }
}

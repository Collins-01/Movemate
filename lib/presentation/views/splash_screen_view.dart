import 'package:flutter/material.dart';
import 'package:movemate/presentation/widgets/widgets.dart';
import 'package:movemate/utils/utils.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  @override
  void initState() {
    _onInit();
    super.initState();
  }

  _onInit() async {
    await Future.delayed(const Duration(seconds: 2), () {
      // Navigator.of(context).pushReplacement(
      //   MaterialPageRoute(
      //     builder: (_) => const BottomNav(),
      //   ),
      // );
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (_) => const BottomNav(),
          ),
          (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppText.heading1(
              "MoveMate",
              color: AppColors.primaryColor,
            ),
            const SizedBox(
              width: 8,
            ),
            const Icon(Icons.fire_truck_outlined,
                color: AppColors.primaryOrangeColor)
          ],
        ),
      ),
    );
  }
}

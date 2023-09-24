import 'package:flutter/material.dart';
import 'package:movemate/presentation/widgets/widgets.dart';
import 'package:movemate/utils/app_colors.dart';

class ShipmentInfoView extends StatefulWidget {
  const ShipmentInfoView({super.key});

  @override
  State<ShipmentInfoView> createState() => _ShipmentInfoViewState();
}

class _ShipmentInfoViewState extends State<ShipmentInfoView>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late AnimationController _buttonAnimationController;
  late Animation<double> _buttonAnimation;
  final tween = Tween<double>(begin: 1.0, end: 0.8);

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _buttonAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 150));
    _buttonAnimation = tween.animate(
      CurvedAnimation(
        parent: _buttonAnimationController,
        curve: Curves.easeOut,
      ),
    );
    // int _repeat = 0;
    _buttonAnimationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _buttonAnimationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        // _buttonAnimationController.forward();
      }
    });
    _animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppText.heading1("MoveMate"),
              const SizedBox(
                height: 40,
              ),
              AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return Transform.scale(
                    alignment: Alignment.center,
                    scale: (1.3 * _animationController.value),
                    child: Opacity(
                      opacity: _animationController.value,
                      child: Container(
                        height: 100,
                        width: 100,
                        color: Colors.blue,
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 50,
              ),
              AppText.heading4("Total Estimated Amount"),
              const SizedBox(
                height: 15,
              ),
              AppText.heading4(
                "N500,000.00",
                color: AppColors.primaryLightGreenColor,
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  "Nostrud nulla in non voluptate labore laboris reprehend",
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              ScaleTransition(
                scale: _buttonAnimation,
                child: SizedBox(
                  height: 54,
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0.0,
                      backgroundColor: AppColors.primaryOrangeColor,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                    ),
                    onPressed: () {
                      print("Heyyy");
                      _buttonAnimationController.forward();
                    },
                    child: AppText.button(
                      "Back to home",
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

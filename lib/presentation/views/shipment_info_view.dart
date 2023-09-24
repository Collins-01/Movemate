import 'package:flutter/material.dart';
import 'package:movemate/presentation/widgets/widgets.dart';
import 'package:movemate/utils/utils.dart';

class ShipmentInfoView extends StatefulWidget {
  const ShipmentInfoView({super.key});

  @override
  State<ShipmentInfoView> createState() => _ShipmentInfoViewState();
}

class _ShipmentInfoViewState extends State<ShipmentInfoView>
    with TickerProviderStateMixin {
  late AnimationController _animationController;

  late Animation<double> _titleAnimation;
  late Animation<double> _amountAnimation;
  late Animation<double> _descriptionAnimation;
  late Animation<double> _buttonAnimation;
  final tween = Tween<double>(begin: 1.0, end: 0.8);

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: AppConfig.animationDuration);

    _titleAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0,
          0.2,
          curve: Curves.easeIn,
        ),
      ),
    );
    _amountAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0,
          0.4,
          curve: Curves.easeIn,
        ),
      ),
    );
    _descriptionAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0,
          0.6,
          curve: Curves.easeIn,
        ),
      ),
    );
    _buttonAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0,
          0.8,
          curve: Curves.easeIn,
        ),
      ),
    );
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
                    scale: (1.5 * _animationController.value),
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
              // AppText.heading4("Total Estimated Amount"),
              AnimatedBuilder(
                  animation: _titleAnimation,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(0.0, 40 * (1 - _titleAnimation.value)),
                      child: Opacity(
                        opacity: _titleAnimation.value,
                        child: AppText.heading2(
                          "Total Estimated Amount",
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  }),
              const SizedBox(
                height: 15,
              ),
              AnimatedBuilder(
                  animation: _amountAnimation,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(0.0, 28 * (1 - _amountAnimation.value)),
                      child: Opacity(
                        opacity: _titleAnimation.value,
                        child: AppText.heading3(
                          "\$500,000.00",
                          color: Colors.greenAccent,
                        ),
                      ),
                    );
                  }),

              const SizedBox(
                height: 10,
              ),
              AnimatedBuilder(
                  animation: _descriptionAnimation,
                  builder: (context, child) {
                    return Transform.translate(
                      offset:
                          Offset(0.0, 20 * (1 - _descriptionAnimation.value)),
                      child: Opacity(
                        opacity: _titleAnimation.value,
                        child: AppText.medium(
                          "Nostrud nulla in non voluptate labore laboris reprehend",
                        ),
                      ),
                    );
                  }),

              const SizedBox(
                height: 40,
              ),
              AnimatedBuilder(
                  animation: _buttonAnimation,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(
                        0.0,
                        10 * (1 - _buttonAnimation.value),
                      ),
                      child: Opacity(
                          opacity: _titleAnimation.value,
                          child: AppButton(
                            title: "Back to home",
                            onPressed: () {
                              print("Hellloooo");
                              Navigator.pop(context);
                            },
                          )),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:movemate/presentation/views/components/components.dart';
import 'package:movemate/presentation/views/shipment_info_view.dart';
import 'package:movemate/presentation/widgets/widgets.dart';
import 'package:movemate/utils/utils.dart';

class CalculateView extends StatefulWidget {
  const CalculateView({Key? key}) : super(key: key);

  @override
  State<CalculateView> createState() => _CalculateViewState();
}

class _CalculateViewState extends State<CalculateView>
    with SingleTickerProviderStateMixin {
  final List<String> _categories = [
    "Documents",
    "Glass",
    "Liquid",
    "Food",
    "Electronic",
    "Product",
    "Others"
  ];
  int _selectedIndex = 0;
  late AnimationController _animationController;
  late Animation<double> _buttonAnimation;
  late Animation<double> _destinationAnimation;
  late Animation<double> _destinationInfoAnimation;
  late Animation<double> _packagingAnimation;
  late Animation<double> _categoriesAnimation;
  final tween = Tween<double>(begin: -70, end: 0);
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: AppConfig.animationDuration,
    );
    _buttonAnimation = tween.animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );
    _destinationAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );
    _destinationInfoAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );
    _packagingAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );
    _categoriesAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          toolbarHeight: 80,
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              //  Navigator.of(context).popUntil((route) => route.isFirst),
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: AppColors.primaryWhiteColor,
            ),
          ),
          title: AppText.heading3(
            "Calculate",
            color: AppColors.primaryWhiteColor,
          ),
        ),
        body: Stack(
          children: [
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: SizingConfig.defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  AnimatedBuilder(
                      animation: _destinationAnimation,
                      builder: (context, child) {
                        return Transform.translate(
                          offset: Offset(
                            0.0,
                            100 * (1 - _destinationAnimation.value),
                          ),
                          child: Opacity(
                            opacity: _animationController.value,
                            child: AppText.heading3("Destination"),
                          ),
                        );
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  AnimatedBuilder(
                      animation: _destinationInfoAnimation,
                      builder: (context, child) {
                        return Transform.translate(
                          offset: Offset(
                            0.0,
                            80 * (1 - _destinationInfoAnimation.value),
                          ),
                          child: Opacity(
                            opacity: _animationController.value,
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              decoration: const BoxDecoration(
                                color: AppColors.primaryWhiteColor,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12),
                                ),
                              ),
                              child: const Column(
                                children: [
                                  CalculateTextFieldWidget(
                                    icon: Icons.unarchive_outlined,
                                    hintText: "Sender location",
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  CalculateTextFieldWidget(
                                    icon: Icons.archive_outlined,
                                    hintText: "Receiver location",
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  CalculateTextFieldWidget(
                                    icon: Icons.hourglass_bottom_outlined,
                                    hintText: "Approx weight",
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  AnimatedBuilder(
                      animation: _packagingAnimation,
                      builder: (context, child) {
                        return Transform.translate(
                          offset: Offset(
                            0.0,
                            60 * (1 - _packagingAnimation.value),
                          ),
                          child: Opacity(
                              opacity: _animationController.value,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppText.heading3(
                                    "Packaging",
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  AppText.regular("What are you sending?"),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const CalculateTextFieldWidget(
                                    icon: Icons.help,
                                    bgColor: Colors.white,
                                    suffixIcon: Icon(Icons.keyboard_arrow_down),
                                    hintText: "Box",
                                  ),
                                ],
                              )),
                        );
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  AnimatedBuilder(
                      animation: _categoriesAnimation,
                      builder: (context, child) {
                        return Transform.translate(
                          offset: Offset(
                            200 * (1 - _categoriesAnimation.value),
                            0.0,
                          ),
                          child: Opacity(
                              opacity: _animationController.value,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppText.heading3(
                                    "Categories",
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  AppText.regular("What are you sending?"),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Wrap(
                                    children: [
                                      ...List.generate(
                                        _categories.length,
                                        (index) => CategoryItemComponent(
                                          isSelected: _selectedIndex == index,
                                          title: _categories[index],
                                          onTap: () => setState(
                                            () {
                                              _selectedIndex = index;
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                        );
                      }),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
            AnimatedBuilder(
                animation: _buttonAnimation,
                builder: (context, child) {
                  return Positioned(
                    left: 0,
                    right: 0,
                    bottom: _buttonAnimation.value,
                    child: Opacity(
                      opacity: _animationController.value,
                      child: Container(
                        padding: const EdgeInsets.only(
                          top: 15,
                          bottom: 15,
                          left: 20,
                          right: 20,
                        ),
                        decoration: const BoxDecoration(
                          color: AppColors.primaryWhiteColor,
                        ),
                        child: AppButton(
                          title: "Calculate",
                          onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => const ShipmentInfoView(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                })
          ],
        ),
        // bottomNavigationBar: const BottomNav(activeIndex: 1),
      ),
    );
  }
}

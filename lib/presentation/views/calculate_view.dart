import 'package:flutter/material.dart';
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
  late AnimationController _buttonAnimationController;
  late Animation<double> _buttonAnimation;
  final tween = Tween<double>(begin: 1.0, end: 0.8);
  @override
  void initState() {
    super.initState();
    _buttonAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 150));
    _buttonAnimation = tween.animate(
      CurvedAnimation(
        parent: _buttonAnimationController,
        curve: Curves.easeOut,
      ),
    );
    _buttonAnimationController.addStatusListener((status) {
      print("Button animation status:: ${status.name}");
      if (status == AnimationStatus.completed) {
        _buttonAnimationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        // _buttonAnimationController.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          toolbarHeight: 80,
          centerTitle: true,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
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
                  AppText.heading3("Destination"),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
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
                          icon: Icons.assignment_late_outlined,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CalculateTextFieldWidget(
                          icon: Icons.assignment_late_outlined,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CalculateTextFieldWidget(
                          icon: Icons.assignment_late_outlined,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
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
                    icon: Icons.gif_box,
                    bgColor: Colors.white,
                    suffixIcon: Icon(Icons.keyboard_arrow_down),
                    hintText: "Box",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
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
                        (index) => GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedIndex = index;
                            });
                            _buttonAnimationController.forward();
                          },
                          child: ScaleTransition(
                            scale: _selectedIndex == index
                                ? _buttonAnimation
                                : const AlwaysStoppedAnimation<double>(1.0),
                            child: AnimatedContainer(
                              duration: AppConfig.animationDuration,
                              curve: Curves.easeIn,
                              decoration: BoxDecoration(
                                border: _selectedIndex == index
                                    ? null
                                    : Border.all(
                                        color: AppColors.primaryColor,
                                      ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(8),
                                ),
                                color: _selectedIndex == index
                                    ? AppColors.primaryColor
                                    : null,
                              ),
                              padding: const EdgeInsets.only(
                                left: 10,
                                right: 10,
                                top: 7,
                                bottom: 7,
                              ),
                              margin: const EdgeInsets.only(
                                left: 7,
                                top: 12,
                              ),
                              child: AppText.regular(
                                _categories[index],
                                color: _selectedIndex == index
                                    ? AppColors.primaryWhiteColor
                                    : null,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
            Positioned(
                left: 0,
                right: 0,
                bottom: 0,
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
                ))
          ],
        ),
        // bottomNavigationBar: const BottomNav(activeIndex: 1),
      ),
    );
  }
}

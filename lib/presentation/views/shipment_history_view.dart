// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:movemate/presentation/widgets/widgets.dart';
import 'package:movemate/utils/utils.dart';

class ShipmentHistoryView extends StatefulWidget {
  const ShipmentHistoryView({Key? key}) : super(key: key);

  @override
  State<ShipmentHistoryView> createState() => _ShipmentHistoryViewState();
}

class _ShipmentHistoryViewState extends State<ShipmentHistoryView>
    with SingleTickerProviderStateMixin {
  final List<String> _tabTitles = [
    "All",
    "Completed",
    "In progress",
    "Pending"
  ];
  int _selectedIndex = 0;
  late AnimationController _animationController;
  late Animation<double> _animation;
  late Animation<double> _categoriesAnimation;
  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: AppConfig.animationDuration);
    _animation = Tween<double>(begin: 200, end: 0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeIn,
      ),
    );
    _categoriesAnimation = Tween<double>(begin: 200, end: 0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeIn,
      ),
    );
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBackgroundColor,
        body: Column(
          children: [
            Container(
              color: AppColors.primaryColor,
              padding: const EdgeInsets.only(
                top: 10,
                left: 20,
                bottom: 20,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          _animationController.forward();
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: AppColors.primaryWhiteColor,
                        ),
                      ),
                      const Text(""),
                      AppText.heading3(
                        "Shipment History",
                        color: AppColors.primaryWhiteColor,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 4,
                      )
                    ],
                  ),
                  AnimatedBuilder(
                      animation: _categoriesAnimation,
                      builder: (context, child) {
                        return Transform.translate(
                          offset: Offset(_categoriesAnimation.value, 0),
                          child: Opacity(
                            opacity: _animationController.value,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 10,
                                ),
                                child: Row(
                                  children: [
                                    ...List.generate(
                                      _tabTitles.length,
                                      (index) => Padding(
                                        padding:
                                            const EdgeInsets.only(right: 20),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  _selectedIndex = index;
                                                });
                                                _animationController.forward();
                                              },
                                              child: Row(
                                                children: [
                                                  AppText.regular(
                                                    _tabTitles[index],
                                                    color: AppColors
                                                        .primaryWhiteColor,
                                                  ),
                                                  const SizedBox(
                                                    width: 4,
                                                  ),
                                                  Container(
                                                    padding:
                                                        const EdgeInsets.only(
                                                      top: 3,
                                                      left: 6,
                                                      bottom: 3,
                                                      right: 6,
                                                    ),
                                                    decoration:
                                                        const BoxDecoration(
                                                      color: AppColors
                                                          .primaryOrangeColor,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(16),
                                                      ),
                                                    ),
                                                    child: AppText.small(
                                                      "10",
                                                      color: AppColors
                                                          .primaryWhiteColor,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 6,
                                            ),
                                            AnimatedContainer(
                                              duration:
                                                  AppConfig.animationDuration -
                                                      const Duration(
                                                          milliseconds: 200),
                                              curve: Curves.easeIn,
                                              height: 2,
                                              width: 50,
                                              color: _selectedIndex == index
                                                  ? AppColors.primaryOrangeColor
                                                  : AppColors.primaryColor,
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                ],
              ),
            ),
            Expanded(
              child: AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(0, _animation.value),
                      child: Opacity(
                        opacity: _animationController.value,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, top: 20),
                                child: AppText.heading3("Shipments"),
                              ),
                              ...List.generate(
                                10,
                                (index) => const ShipmentHistoryItem(),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}

class ShipmentHistoryItem extends StatelessWidget {
  const ShipmentHistoryItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: const BoxDecoration(
        color: AppColors.primaryWhiteColor,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      padding: const EdgeInsets.only(
        left: 20,
        bottom: 20,
        right: 20,
        top: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          AppText.heading6("Arriving Today!"),
          const SizedBox(
            height: 3,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: AppText.regular(
                  "Excepteur est elit nisi sit voluptate incididunt est ",
                  color: AppColors.textGrayColor,
                ),
              ),
              Image.asset(
                AppAssets.box,
                height: 90,
                width: 90,
              )
            ],
          ),
          const SizedBox(
            height: 3,
          ),
          Row(
            children: [
              AppText.medium(
                "\$650 USD",
                color: AppColors.primaryColor,
              ),
              const SizedBox(
                width: 3,
              ),
              AppText.medium("Sep 20, 2023")
            ],
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:movemate/presentation/views/search_view.dart';
import 'package:movemate/presentation/widgets/widgets.dart';
import 'package:movemate/utils/utils.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _appBarAnimation;
  late Animation<double> _itemTrackingAnimation;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    );
    _appBarAnimation = Tween<double>(begin: -50.0, end: 0.0).animate(
      _animationController,
    );
    _itemTrackingAnimation = Tween<double>(begin: 400.0, end: 200.0).animate(
      _animationController,
    );
    if (mounted) {
      _animationController.forward();
    }
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            //* AppBar
            AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return Positioned(
                    top: _appBarAnimation.value,
                    left: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const SearchView(),
                        ),
                      ),
                      child: Opacity(
                        opacity: _animationController.value,
                        child: Container(
                          color: AppColors.primaryColor,
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.only(
                            top: 20,
                            bottom: 20,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          height: 40,
                                          width: 40,
                                          decoration: const BoxDecoration(
                                            color: Colors.blue,
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            AppText.medium(
                                              "Your location",
                                              color: Colors.white,
                                            ),
                                            const SizedBox(
                                              height: 4,
                                            ),
                                            AppText.heading5(
                                              "Manchester, Benin City",
                                              color: Colors.white,
                                            ),
                                          ],
                                        ),
                                        Container(
                                          height: 40,
                                          width: 40,
                                          decoration: const BoxDecoration(
                                            color: Colors.blue,
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  height: 50,
                                  width: MediaQuery.of(context).size.width,
                                  alignment: Alignment.center,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(30),
                                    ),
                                  ),
                                  child: TextField(
                                    controller: _searchController,
                                    decoration: InputDecoration(
                                      prefixIconColor: AppColors.primaryColor,
                                      border: InputBorder.none,
                                      hintText: "Enter the receipt number ...",
                                      prefixIcon: const Icon(
                                        Icons.search,
                                        color: AppColors.primaryColor,
                                      ),
                                      suffixIconConstraints:
                                          const BoxConstraints(
                                        maxHeight: 40,
                                        maxWidth: 40,
                                      ),
                                      suffixIcon: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 4),
                                        child: Container(
                                          // height: 26,
                                          // width: 26,
                                          alignment: Alignment.center,
                                          decoration: const BoxDecoration(
                                            color: AppColors.primaryOrangeColor,
                                            shape: BoxShape.circle,
                                          ),
                                          child: const Icon(
                                            Icons.qr_code_scanner_outlined,
                                            color: Colors.white,
                                            size: 16,
                                          ),
                                        ),
                                      ),
                                      contentPadding: const EdgeInsets.only(
                                        left: 20,
                                        top: 15,
                                      ),
                                    ),
                                  ),
                                )
                                // SearchBarWidget(
                                //   controller: _searchController,
                                // )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
            // * Tracking widget
            AnimatedBuilder(
                animation: _itemTrackingAnimation,
                builder: (context, child) {
                  return Positioned(
                    top: _itemTrackingAnimation.value,
                    left: 0,
                    right: 0,
                    child: Opacity(
                      opacity: _animationController.value,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: SizingConfig.defaultPadding,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText.heading5("Tracking"),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                color: Colors.green,
                              ),
                              padding: const EdgeInsets.only(
                                top: 20,
                                bottom: 20,
                                left: 10,
                                right: 10,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppText.small("Shipment Number"),
                                  AppText.heading5("NEJ2000044048489477488748"),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Divider(),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          AppText.small("Sender"),
                                          AppText.heading6("Atlanta, 5243")
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          AppText.small("Time"),
                                          AppText.heading6("2 day - 3 days")
                                        ],
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          AppText.small("Sender"),
                                          AppText.heading6("Atlanta, 5243")
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          AppText.small("Status"),
                                          AppText.heading6("Waiting to collect")
                                        ],
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Divider(),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      TextButton(
                                        onPressed: () {},
                                        child: Row(
                                          children: [
                                            const Icon(Icons.add),
                                            AppText.heading6("Add Stop")
                                          ],
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
            // * Available items
            // Positioned(child: )
          ],
        ),
      ),
    );
  }
}

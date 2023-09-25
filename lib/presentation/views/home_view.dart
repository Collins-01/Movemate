import 'package:flutter/material.dart';
import 'package:movemate/presentation/views/components/tracking_item_component.dart';
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
  late Animation<double> _availableVehiclesAnimation;
  late Animation<double> _availableVehiclesImageAnimation;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: AppConfig.animationDuration);
    _appBarAnimation = Tween<double>(begin: -50.0, end: 0.0).animate(
      _animationController,
    );
    _itemTrackingAnimation = Tween<double>(begin: 70, end: 0).animate(
      _animationController,
    );
    _availableVehiclesAnimation = Tween<double>(begin: 150, end: 0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeIn,
      ),
    );
    _availableVehiclesImageAnimation = Tween<double>(begin: 50, end: 0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeIn,
      ),
    );
    if (mounted) {
      _animationController.forward();
    }
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _searchController.dispose();
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
                                          // color: Colors.blue,
                                          image: DecorationImage(
                                              image: AssetImage(AppAssets.man),
                                              fit: BoxFit.cover),
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
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.send,
                                                size: 11,
                                                color: Colors.white,
                                              ),
                                              const SizedBox(
                                                width: 4,
                                              ),
                                              AppText.medium(
                                                "Your location",
                                                color: Colors.white,
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 4,
                                          ),
                                          Row(
                                            children: [
                                              AppText.regular(
                                                "Wertheimer, Illinois",
                                                color: Colors.white,
                                              ),
                                              const SizedBox(
                                                width: 2,
                                              ),
                                              const Icon(
                                                Icons.keyboard_arrow_down,
                                                color:
                                                    AppColors.primaryWhiteColor,
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                      Container(
                                        height: 40,
                                        width: 40,
                                        decoration: const BoxDecoration(
                                          color: AppColors.primaryWhiteColor,
                                          shape: BoxShape.circle,
                                        ),
                                        child: const Icon(
                                            Icons.notifications_none),
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
                                  onTap: () {
                                    FocusScope.of(context).unfocus();
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (_) => const SearchView(),
                                      ),
                                    );
                                  },
                                  decoration: InputDecoration(
                                    prefixIconColor: AppColors.primaryColor,
                                    border: InputBorder.none,
                                    hintText: "Enter the receipt number ...",
                                    prefixIcon: const Icon(
                                      Icons.search,
                                      color: AppColors.primaryColor,
                                    ),
                                    suffixIconConstraints: const BoxConstraints(
                                      maxHeight: 40,
                                      maxWidth: 40,
                                    ),
                                    suffixIcon: Padding(
                                      padding: const EdgeInsets.only(right: 4),
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
                  );
                }),
            // * Tracking widget
            Positioned.fill(
              top: 170,
              left: 0,
              right: 0,
              child: Container(
                color: const Color(0xffF2F3F5),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      AnimatedBuilder(
                          animation: _itemTrackingAnimation,
                          builder: (context, child) {
                            return Transform.translate(
                              offset: Offset(
                                0,
                                _itemTrackingAnimation.value,
                              ),
                              child: Opacity(
                                opacity: _animationController.value,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: SizingConfig.defaultPadding,
                                  ),
                                  child: const TrackingItemComponent(),
                                ),
                              ),
                            );
                          }),
                      const SizedBox(
                        height: 20,
                      ),
                      AnimatedBuilder(
                          animation: _availableVehiclesAnimation,
                          builder: (context, child) {
                            return Transform.translate(
                              offset:
                                  Offset(_availableVehiclesAnimation.value, 0),
                              child: Opacity(
                                  opacity: _animationController.value,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 20,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: AppText.heading4(
                                            "Available Vehicles",
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            children: [
                                              ...List.generate(
                                                5,
                                                (index) => Container(
                                                  height: 200,
                                                  width: 150,
                                                  margin: const EdgeInsets.only(
                                                    right: 7,
                                                  ),
                                                  decoration:
                                                      const BoxDecoration(
                                                          // color: Colors.blue,
                                                          ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                      top: 7,
                                                      left: 7,
                                                      right: 7,
                                                      bottom: 7,
                                                    ),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        AppText.heading5(
                                                          "Ocean freight",
                                                        ),
                                                        AppText.medium(
                                                          "Reliable",
                                                          color: AppColors
                                                              .textGrayColor,
                                                        ),
                                                        Expanded(
                                                          child:
                                                              AnimatedBuilder(
                                                            animation:
                                                                _availableVehiclesImageAnimation,
                                                            builder: (context,
                                                                child) {
                                                              return Transform
                                                                  .translate(
                                                                offset: Offset(
                                                                    _availableVehiclesImageAnimation
                                                                        .value,
                                                                    0),
                                                                child:
                                                                    Image.asset(
                                                                  AppAssets
                                                                      .truckTwo,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  )),
                            );
                          }),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            )
            // * Available items
            // Positioned(child: )
          ],
        ),
        // bottomNavigationBar: const BottomNav(activeIndex: 0),
      ),
    );
  }
}

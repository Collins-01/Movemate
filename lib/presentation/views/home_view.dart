import 'package:flutter/material.dart';
import 'package:movemate/presentation/views/search_view.dart';
import 'package:movemate/presentation/widgets/widgets.dart';
import 'package:movemate/utils/app_colors.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
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
                    top: _animationController.value * (0),
                    left: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const SearchView(),
                        ),
                      ),
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
                                            "Upper, Benin City",
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
                              SearchBarWidget(
                                controller: _searchController,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
            AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return Positioned(
                    top: ((_animationController.value)) * 170,
                    left: 0,
                    right: 0,
                    child: Opacity(
                      opacity: _animationController.value,
                      child: Container(
                        color: Colors.green,
                        height: 200,
                        width: 200,
                      ),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}

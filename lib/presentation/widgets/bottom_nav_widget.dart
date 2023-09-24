// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:movemate/presentation/views/calculate_view.dart';
import 'package:movemate/presentation/views/home_view.dart';

import 'package:movemate/utils/utils.dart';

class BottomNav extends StatefulWidget {
  final int activeIndex;
  const BottomNav({
    Key? key,
    required this.activeIndex,
  }) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav>
    with SingleTickerProviderStateMixin {
  late Animation<Offset> _indicatorAnimation;
  late AnimationController _indicatorController;

  @override
  void initState() {
    _indicatorController =
        AnimationController(vsync: this, duration: AppConfig.animationDuration);
    _indicatorAnimation = Tween(
      begin: const Offset(0, 120),
      end: const Offset(70, 120),
    ).animate(_indicatorController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Container(
                height: 2,
                width: MediaQuery.of(context).size.width / 5,
                color: AppColors.primaryColor,
              ),
              // SlideTransition(
              //   position: _indicatorAnimation,
              //   textDirection: TextDirection.ltr,
              //   child: Container(
              //     height: 2,
              //     width: MediaQuery.of(context).size.width / 5,
              //     color: AppColors.primaryColor,
              //   ),
              // )
            ],
          ),
          BottomNavigationBar(
            // backgroundColor: AppColors.primaryWhiteColor,

            currentIndex: widget.activeIndex,
            onTap: (index) {
              // * Index 0
              if (index == 0 && widget.activeIndex == 0) {
                // * DO nothing
              }
              if (index == 0 && widget.activeIndex != 0) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const HomeView(),
                  ),
                );
              }
              // * Index 2
              if (index == 1 && widget.activeIndex == 1) {
                // * DO nothing
              }
              if (index == 1 && widget.activeIndex != 1) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const CalculateView(),
                  ),
                );
              }
            },
            elevation: 0.0,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                label: "Home",
                icon: Icon(Icons.home),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.calculate_outlined),
                label: "Calculate",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.alarm_outlined),
                label: "Shipment",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_2_outlined),
                label: "Profile",
              )
            ],
          ),
        ],
      ),
    );
  }
}

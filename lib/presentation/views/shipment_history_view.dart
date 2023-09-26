// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:movemate/models/models.dart';

import 'package:movemate/presentation/widgets/widgets.dart';
import 'package:movemate/utils/utils.dart';

import 'components/components.dart';

class ShipmentHistoryView extends StatefulWidget {
  const ShipmentHistoryView({Key? key}) : super(key: key);

  @override
  State<ShipmentHistoryView> createState() => _ShipmentHistoryViewState();
}

class _ShipmentHistoryViewState extends State<ShipmentHistoryView>
    with TickerProviderStateMixin {
  int _currentIndex = 0;
  late AnimationController _animationController;
  late Animation<double> _categoriesAnimation;
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: shipmentHistoryTabs.length, vsync: this);
    _animationController =
        AnimationController(vsync: this, duration: AppConfig.animationDuration);

    _categoriesAnimation = Tween<double>(begin: 200, end: 0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeIn,
      ),
    );
    _tabController.addListener(() {
      setState(() {
        _currentIndex = _tabController.index;
      });
    });
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
          length: shipmentHistoryTabs.length,
          animationDuration: AppConfig.animationDuration,
          initialIndex: 0,
          child: Scaffold(
            backgroundColor: AppColors.scaffoldBackgroundColor,
            appBar: AppBar(
              backgroundColor: AppColors.primaryColor,
              centerTitle: true,
              title: AppText.heading3(
                "Shipment History",
                color: AppColors.primaryWhiteColor,
              ),
              leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (_) => const BottomNav(),
                      ),
                      (route) => false);
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.primaryWhiteColor,
                ),
              ),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(50),
                child: AnimatedBuilder(
                    animation: _categoriesAnimation,
                    builder: (context, child) {
                      return Transform.translate(
                        offset: Offset(_categoriesAnimation.value, 0),
                        child: AnimatedOpacity(
                          duration: AppConfig.animationDuration,
                          curve: Curves.easeIn,
                          opacity: _animationController.value,
                          child: TabBar(
                            controller: _tabController,
                            indicatorColor: AppColors.primaryOrangeColor,
                            isScrollable: true,
                            tabs: [
                              ...List.generate(
                                shipmentHistoryTabs.length,
                                (index) => Padding(
                                  padding: const EdgeInsets.only(bottom: 8),
                                  child: ShipmentHistoryIndicatorItem(
                                    title: shipmentHistoryTabs[index].name,
                                    value: shipmentHistoryTabs[index].number,
                                    isActive: _currentIndex == index,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ),
            body: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _tabController,
              children: [
                ...List.generate(
                  shipmentHistoryTabs.length,
                  (index) => const ShimpentHistoryList(),
                )
              ],
            ),
          )),
    );
  }
}

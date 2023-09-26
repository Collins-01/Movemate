import 'package:flutter/material.dart';
import 'package:movemate/presentation/widgets/widgets.dart';
import 'package:movemate/utils/utils.dart';

class ShimpentHistoryList extends StatefulWidget {
  const ShimpentHistoryList({super.key});

  @override
  State<ShimpentHistoryList> createState() => _ShimpentHistoryListState();
}

class _ShimpentHistoryListState extends State<ShimpentHistoryList>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: AppConfig.animationDuration);
    _animation = Tween<double>(begin: 200, end: 0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeIn,
      ),
    );
    _animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
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
                      padding: const EdgeInsets.only(left: 20, top: 20),
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
        });
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
          Row(
            children: [
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                  color: AppColors.whiteGrayColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 5,
                    bottom: 5,
                    right: 8,
                    left: 8,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.sync,
                        color: Colors.greenAccent,
                        size: 18,
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      AppText.medium(
                        "In-progress",
                        color: Colors.greenAccent,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
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

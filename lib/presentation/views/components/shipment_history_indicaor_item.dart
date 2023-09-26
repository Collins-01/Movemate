// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:movemate/presentation/widgets/widgets.dart';
import 'package:movemate/utils/utils.dart';

class ShipmentHistoryIndicatorItem extends StatelessWidget {
  final String title;
  final int value;
  final bool isActive;
  const ShipmentHistoryIndicatorItem({
    Key? key,
    required this.title,
    required this.value,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppText.regular(
          title,
          color: AppColors.primaryWhiteColor,
        ),
        const SizedBox(
          width: 4,
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
          padding: const EdgeInsets.only(
            top: 3,
            left: 6,
            bottom: 3,
            right: 6,
          ),
          decoration: BoxDecoration(
            color: isActive ? AppColors.primaryOrangeColor : Colors.white30,
            borderRadius: const BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          child: AppText.small(
            "$value",
            color: AppColors.primaryWhiteColor,
          ),
        )
      ],
    );
  }
}

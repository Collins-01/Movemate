import 'package:flutter/material.dart';
import 'package:movemate/presentation/widgets/widgets.dart';
import 'package:movemate/utils/utils.dart';

class TrackingItemComponent extends StatelessWidget {
  const TrackingItemComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText.heading4("Tracking"),
        const SizedBox(
          height: 5,
        ),
        Container(
          decoration: const BoxDecoration(
            color: AppColors.primaryWhiteColor,
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          padding: const EdgeInsets.only(
            top: 20,
            bottom: 10,
            left: 20,
            right: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText.small("Shipment Number", color: AppColors.textGrayColor),
              AppText.heading5("NEJ2000044048489477488748"),
              const SizedBox(
                height: 10,
              ),
              const Divider(),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 30,
                        width: 30,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.amber),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText.small(
                            "Sender",
                            color: AppColors.textGrayColor,
                          ),
                          AppText.heading6("Atlanta, 5243")
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText.small(
                        "Time",
                        color: AppColors.textGrayColor,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 6,
                            width: 6,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.green,
                            ),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          AppText.heading6("2 day - 3 days")
                        ],
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 30,
                        width: 30,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.amber),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText.small(
                            "Sender",
                            color: AppColors.textGrayColor,
                          ),
                          AppText.heading6("Atlanta, 5243")
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText.small(
                        "Status",
                        color: AppColors.textGrayColor,
                      ),
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
                        const Icon(
                          Icons.add,
                          color: AppColors.primaryOrangeColor,
                        ),
                        AppText.heading6(
                          "Add Stop",
                          color: AppColors.primaryOrangeColor,
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:movemate/presentation/widgets/widgets.dart';
import 'package:movemate/utils/utils.dart';

class HomeViewAppBarSection extends StatelessWidget {
  const HomeViewAppBarSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: const BoxDecoration(
                // color: Colors.blue,
                image: DecorationImage(
                    image: AssetImage(AppAssets.man), fit: BoxFit.cover),
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.near_me,
                      size: 13,
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
                      color: AppColors.primaryWhiteColor,
                    )
                  ],
                )
              ],
            ),
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
            Icons.notifications_none,
          ),
        ),
      ],
    );
  }
}

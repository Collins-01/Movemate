// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:movemate/utils/utils.dart';

import 'app_text_widget.dart';

class AppButton extends StatefulWidget {
  final String title;
  final void Function()? onPressed;
  const AppButton({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _buttonAnimationController;
  late Animation<double> _buttonAnimation;
  final tween = Tween<double>(begin: 1.0, end: 0.8);
  @override
  void initState() {
    super.initState();
    _buttonAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 150));
    _buttonAnimation = tween.animate(
      CurvedAnimation(
        parent: _buttonAnimationController,
        curve: Curves.easeOut,
      ),
    );
    _buttonAnimationController.addStatusListener((status) {
      print("Button animation status:: ${status.name}");
      if (status == AnimationStatus.completed) {
        _buttonAnimationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        // _buttonAnimationController.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _buttonAnimation,
      child: SizedBox(
        height: 54,
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 0.0,
            backgroundColor: AppColors.primaryOrangeColor,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
            ),
          ),
          onPressed: () async {
            _buttonAnimationController.forward();
            await Future.delayed(const Duration(milliseconds: 250));
            widget.onPressed?.call();
            // if (_buttonAnimationController.isDismissed) {
            //   widget.onPressed?.call();
            // }
          },
          child: AppText.button(
            widget.title,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:movemate/presentation/widgets/widgets.dart';
import 'package:movemate/utils/utils.dart';

class CategoryItemComponent extends StatefulWidget {
  final bool isSelected;
  final void Function()? onTap;
  final String title;
  const CategoryItemComponent({
    Key? key,
    required this.isSelected,
    this.onTap,
    required this.title,
  }) : super(key: key);

  @override
  State<CategoryItemComponent> createState() => _CategoryItemComponentState();
}

class _CategoryItemComponentState extends State<CategoryItemComponent>
    with SingleTickerProviderStateMixin {
  late AnimationController _buttonAnimationController;
  late Animation<double> _buttonAnimation;
  final tween = Tween<double>(begin: 1.0, end: 0.8);
  @override
  void initState() {
    super.initState();
    _buttonAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 100));
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
  void dispose() {
    _buttonAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap?.call();
        _buttonAnimationController.forward();
      },
      child: ScaleTransition(
        scale: widget.isSelected
            ? _buttonAnimation
            : const AlwaysStoppedAnimation<double>(1.0),
        child: AnimatedContainer(
          duration: AppConfig.animationDuration,
          curve: Curves.easeIn,
          decoration: BoxDecoration(
            border: widget.isSelected
                ? null
                : Border.all(
                    color: const Color(0xff142334),
                  ),
            borderRadius: const BorderRadius.all(
              Radius.circular(8),
            ),
            color: widget.isSelected ? const Color(0xff142334) : null,
          ),
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
            top: 7,
            bottom: 7,
          ),
          margin: const EdgeInsets.only(
            left: 7,
            top: 12,
          ),
          child: AppText.regular(
            widget.title,
            color: widget.isSelected ? AppColors.primaryWhiteColor : null,
          ),
        ),
      ),
    );
  }
}

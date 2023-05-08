import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class FormButton extends StatelessWidget {
  final bool disabled;
  final String text;
  final void Function(BuildContext context) onTap;

  const FormButton({
    super.key,
    required this.disabled,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: disabled ? () => {} : () => onTap(context),
      child: FractionallySizedBox(
        widthFactor: 1,
        child: AnimatedContainer(
          curve: Curves.easeInOut,
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(
            vertical: Sizes.size16,
          ),
          decoration: BoxDecoration(
            color: disabled
                ? Colors.grey.shade200
                : Theme.of(context).primaryColor,
            borderRadius: const BorderRadius.all(Radius.circular(Sizes.size4)),
          ),
          child: AnimatedDefaultTextStyle(
            curve: Curves.easeInOut,
            duration: const Duration(milliseconds: 200),
            style: TextStyle(
              color: disabled ? Colors.grey.shade500 : Colors.white,
              fontSize: Sizes.size16,
              fontWeight: FontWeight.w600,
            ),
            child: Text(
              text,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}

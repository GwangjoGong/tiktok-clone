import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final void Function() onPressed;

  const ActionButton(
      {super.key,
      required this.icon,
      required this.label,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onPressed,
      child: Column(
        children: [
          FaIcon(
            icon,
            size: Sizes.size32,
            color: Colors.white,
          ),
          Gaps.v6,
          Text(
            label,
            style: const TextStyle(
              fontSize: Sizes.size14,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

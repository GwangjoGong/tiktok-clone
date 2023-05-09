import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';

class NavigationTab extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final void Function() onTap;

  const NavigationTab(
      {super.key,
      required this.icon,
      required this.label,
      required this.isSelected,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedOpacity(
          opacity: isSelected ? 1 : 0.6,
          duration: const Duration(milliseconds: 200),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FaIcon(icon, color: Colors.white),
              Gaps.v6,
              Text(label, style: const TextStyle(color: Colors.white))
            ],
          ),
        ),
      ),
    );
  }
}

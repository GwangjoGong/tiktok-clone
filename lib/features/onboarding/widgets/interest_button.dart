import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class InterestButton extends StatefulWidget {
  const InterestButton({
    super.key,
    required this.interest,
  });

  final String interest;

  @override
  State<InterestButton> createState() => _InterestButtonState();
}

class _InterestButtonState extends State<InterestButton> {
  bool _isSelected = false;

  void _onTap() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: AnimatedContainer(
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: _isSelected ? Theme.of(context).primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(9999),
          border: Border.all(color: Colors.grey.shade200, width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              spreadRadius: 1,
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(
            vertical: Sizes.size16, horizontal: Sizes.size20),
        child: AnimatedDefaultTextStyle(
          curve: Curves.easeInOut,
          duration: const Duration(milliseconds: 200),
          style: TextStyle(
            color: _isSelected ? Colors.white : Colors.black,
            fontSize: Sizes.size16,
            fontWeight: FontWeight.w600,
          ),
          child: Text(
            widget.interest,
          ),
        ),
      ),
    );
  }
}

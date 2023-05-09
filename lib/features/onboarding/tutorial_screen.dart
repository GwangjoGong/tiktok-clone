import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

enum Page { first, second }

class TutorialScreen extends StatefulWidget {
  const TutorialScreen({super.key});

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  bool _swiped = false;

  void _onPanEnd(DragEndDetails details) {
    final yVelocity = details.velocity.pixelsPerSecond.dy;
    const threshold = 400;

    if (yVelocity < -threshold) {
      setState(() {
        _swiped = true;
      });
    }

    if (yVelocity > threshold) {
      setState(() {
        _swiped = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanEnd: _onPanEnd,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.size24),
            child: AnimatedCrossFade(
              duration: const Duration(milliseconds: 200),
              crossFadeState: _swiped
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              firstChild: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Gaps.v44,
                  Text(
                    "Swipe up",
                    style: TextStyle(
                      fontSize: Sizes.size40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gaps.v16,
                  Text(
                    "Videos are personalized for you based on what you watch, like, and share.",
                    style: TextStyle(
                      fontSize: Sizes.size20,
                    ),
                  )
                ],
              ),
              secondChild: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Gaps.v44,
                  Text(
                    "There you go!",
                    style: TextStyle(
                      fontSize: Sizes.size40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gaps.v16,
                  Text(
                    "Congratulation! Enjoy the awesome videos of tiktok from now on.",
                    style: TextStyle(
                      fontSize: Sizes.size20,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
            elevation: 0,
            child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Sizes.size24,
                  vertical: Sizes.size24,
                ),
                child: AnimatedOpacity(
                  opacity: _swiped ? 1 : 0,
                  duration: const Duration(milliseconds: 200),
                  child: CupertinoButton(
                      onPressed: () {},
                      color: Theme.of(context).primaryColor,
                      child: const Text("Start watching")),
                ))),
      ),
    );
  }
}

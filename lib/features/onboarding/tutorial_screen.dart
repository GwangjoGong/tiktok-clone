import 'package:flutter/material.dart';
import 'package:flutter_swipe_detector/flutter_swipe_detector.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class TutorialScreen extends StatefulWidget {
  const TutorialScreen({super.key});

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  bool _swiped = false;

  void _onSwipeUp(Offset offset) {
    setState(() {
      _swiped = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SwipeDetector(
          onSwipeUp: _onSwipeUp,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.size24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gaps.v44,
                const Text(
                  "Swipe up",
                  style: TextStyle(
                      fontSize: Sizes.size40, fontWeight: FontWeight.bold),
                ),
                Gaps.v20,
                const Text(
                  "Videos are personalized for you based on what you watch, like, and share.",
                  style: TextStyle(
                    fontSize: Sizes.size20,
                  ),
                ),
                Gaps.v44,
                Flexible(
                  child: FractionallySizedBox(
                    heightFactor: 1,
                    widthFactor: 1,
                    child: Stack(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.amber,
                          ),
                          child: const Center(
                            child: Text(
                              "Swipe me up",
                              style: TextStyle(
                                  fontSize: Sizes.size48, color: Colors.white),
                            ),
                          ),
                        ),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.fastOutSlowIn,
                          margin: EdgeInsets.only(top: _swiped ? 0 : 1000),
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                          ),
                          child: const Center(
                            child: Text(
                              "There you go!",
                              style: TextStyle(
                                  fontSize: Sizes.size48, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Gaps.v44,
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.only(
            left: Sizes.size24,
            right: Sizes.size24,
            bottom: Sizes.size10,
          ),
          child: AnimatedOpacity(
            opacity: _swiped ? 1 : 0,
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(Sizes.size4),
              ),
              padding: const EdgeInsets.symmetric(vertical: Sizes.size20),
              child: const Text(
                "Start watching",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: Sizes.size16,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

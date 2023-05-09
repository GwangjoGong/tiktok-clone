import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/onboarding/widgets/interest_button.dart';

const interests = [
  "Daily Life",
  "Comedy",
  "Entertainment",
  "Animals",
  "Food",
  "Beauty & Style",
  "Drama",
  "Learning",
  "Talent",
  "Sports",
  "Auto",
  "Family",
  "Fitness & Health",
  "DIY & Life Hacks",
  "Arts & Crafts",
  "Dance",
  "Outdoors",
  "Oddly Satisfying",
  "Home & Garden",
  "Daily Life",
  "Comedy",
  "Entertainment",
  "Animals",
  "Food",
  "Beauty & Style",
  "Drama",
  "Learning",
  "Talent",
  "Sports",
  "Auto",
  "Family",
  "Fitness & Health",
  "DIY & Life Hacks",
  "Arts & Crafts",
  "Dance",
  "Outdoors",
  "Oddly Satisfying",
  "Home & Garden",
];

class InterestsScreen extends StatefulWidget {
  const InterestsScreen({super.key});

  @override
  State<InterestsScreen> createState() => _InterestsScreenState();
}

class _InterestsScreenState extends State<InterestsScreen> {
  final ScrollController _scrollController = ScrollController();

  bool showAppbar = false;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      _onScroll(_scrollController.offset);
    });
  }

  void _onScroll(double offset) {
    if (!showAppbar && offset > 100) {
      setState(() {
        showAppbar = true;
      });
    }

    if (showAppbar && offset <= 100) {
      setState(() {
        showAppbar = false;
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: showAppbar ? Colors.white : Colors.transparent,
        title: AnimatedOpacity(
            opacity: showAppbar ? 1 : 0,
            duration: const Duration(milliseconds: 200),
            child: const Text("Choose your Interests")),
      ),
      body: Scrollbar(
        controller: _scrollController,
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Padding(
            padding: const EdgeInsets.only(
              left: Sizes.size24,
              right: Sizes.size24,
              bottom: Sizes.size24,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).padding.top),
                Gaps.v44,
                const Text(
                  "Choose your interests",
                  style: TextStyle(
                      fontSize: Sizes.size40, fontWeight: FontWeight.bold),
                ),
                Gaps.v20,
                const Text(
                  "Get better video recommendations",
                  style: TextStyle(
                    fontSize: Sizes.size20,
                  ),
                ),
                Gaps.v44,
                Wrap(
                  runSpacing: Sizes.size16,
                  spacing: Sizes.size10,
                  children: [
                    for (var interest in interests)
                      InterestButton(interest: interest)
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        child: Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Colors.grey.shade300,
                ),
              ),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size32,
              vertical: Sizes.size12,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: Sizes.size14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade200, width: 2),
                    ),
                    child: const Text(
                      "Skip",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: Sizes.size16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Gaps.h10,
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: Sizes.size14),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                    ),
                    child: const Text(
                      "Next",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: Sizes.size16,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

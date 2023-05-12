import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen>
    with SingleTickerProviderStateMixin {
  final List<String> _notifications = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
  ];

  final List<Map<String, dynamic>> _tabs = [
    {
      "title": "All activity",
      "icon": FontAwesomeIcons.solidMessage,
    },
    {
      "title": "Likes",
      "icon": FontAwesomeIcons.solidHeart,
    },
    {
      "title": "Comments",
      "icon": FontAwesomeIcons.solidComments,
    },
    {
      "title": "Mentions",
      "icon": FontAwesomeIcons.at,
    },
    {
      "title": "Followers",
      "icon": FontAwesomeIcons.solidUser,
    },
    {
      "title": "From TikTok",
      "icon": FontAwesomeIcons.tiktok,
    }
  ];

  late final AnimationController _animationController = AnimationController(
      duration: const Duration(milliseconds: 300), vsync: this);

  late final Animation<double> _turnAnimation =
      Tween(begin: 0.0, end: 0.5).animate(
    CurvedAnimation(
      parent: _animationController,
      curve: Curves.fastOutSlowIn,
    ),
  );

  late final Animation<Offset> _slideAnimation =
      Tween(begin: const Offset(0, -1), end: Offset.zero).animate(
    CurvedAnimation(
      parent: _animationController,
      curve: Curves.fastOutSlowIn,
    ),
  );

  late final Animation<Color?> _barrierAnimation =
      ColorTween(begin: Colors.transparent, end: Colors.black.withAlpha(150))
          .animate(
    CurvedAnimation(
      parent: _animationController,
      curve: Curves.fastOutSlowIn,
    ),
  );

  bool _showBarrier = false;

  void _onDismissed(String notification) {
    setState(() {
      _notifications.remove(notification);
    });
  }

  void _toggleAnimations() async {
    if (_animationController.isCompleted) {
      await _animationController.reverse();
    } else {
      _animationController.forward();
    }

    setState(() {
      _showBarrier = !_showBarrier;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: GestureDetector(
          onTap: _toggleAnimations,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("All activity"),
              Gaps.h4,
              RotationTransition(
                turns: _turnAnimation,
                child: const FaIcon(
                  FontAwesomeIcons.chevronDown,
                  size: Sizes.size12,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: Sizes.size14,
                  horizontal: Sizes.size16,
                ),
                child: Text(
                  "New",
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.w600,
                    fontSize: Sizes.size16,
                  ),
                ),
              ),
              for (var notification in _notifications)
                Dismissible(
                  key: Key(notification),
                  onDismissed: (direction) {
                    _onDismissed(notification);
                  },
                  background: Container(
                    color: Colors.red,
                    padding: const EdgeInsets.only(left: Sizes.size16),
                    alignment: Alignment.centerLeft,
                    child: const FaIcon(
                      FontAwesomeIcons.trash,
                      color: Colors.white,
                    ),
                  ),
                  child: ListTile(
                    minVerticalPadding: Sizes.size16,
                    leading: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.grey.shade300)),
                      width: Sizes.size52,
                      child: const Center(
                          child: FaIcon(
                        FontAwesomeIcons.bell,
                        color: Colors.black,
                      )),
                    ),
                    title: RichText(
                      text: const TextSpan(
                        text: "Account updates: ",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontSize: Sizes.size16,
                        ),
                        children: [
                          TextSpan(
                            text: "Upload longer videos ",
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          TextSpan(
                            text: "1h",
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    trailing: FaIcon(
                      FontAwesomeIcons.chevronRight,
                      size: Sizes.size16,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ),
            ],
          ),
          if (_showBarrier)
            AnimatedModalBarrier(
              color: _barrierAnimation,
              dismissible: true,
              onDismiss: _toggleAnimations,
            ),
          SlideTransition(
            position: _slideAnimation,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(Sizes.size6),
                  bottomRight: Radius.circular(Sizes.size6),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (var tab in _tabs)
                    ListTile(
                      title: Row(
                        children: [
                          FaIcon(
                            tab["icon"],
                            color: Colors.black,
                            size: Sizes.size16,
                          ),
                          Gaps.h20,
                          Text(
                            tab["title"],
                            style: const TextStyle(
                              fontSize: Sizes.size16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/discover/discover_screen.dart';
import 'package:tiktok_clone/features/main/widgets/navigation_tab.dart';
import 'package:tiktok_clone/features/videos/video_timeline_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  final screens = [
    const VideoTimelineScreen(),
    const DiscoverScreen(),
    const Center(child: Text("Add")),
    Container(),
    Container(),
  ];

  int _selectedIndex = 0;

  void _onTap(int index) => setState(() => _selectedIndex = index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          for (var screen in screens)
            Offstage(
              offstage: _selectedIndex != screens.indexOf(screen),
              child: screen,
            ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: _selectedIndex == 0 ? Colors.black : Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: Sizes.size12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NavigationTab(
                icon: FontAwesomeIcons.house,
                selectedIcon: FontAwesomeIcons.house,
                label: "Home",
                isSelected: _selectedIndex == 0,
                onTap: () => _onTap(0),
                dark: _selectedIndex == 0,
              ),
              NavigationTab(
                icon: FontAwesomeIcons.compass,
                selectedIcon: FontAwesomeIcons.solidCompass,
                label: "Discover",
                isSelected: _selectedIndex == 1,
                onTap: () => _onTap(1),
                dark: _selectedIndex == 0,
              ),
              PostVideoButton(
                dark: _selectedIndex == 0,
              ),
              NavigationTab(
                icon: FontAwesomeIcons.message,
                selectedIcon: FontAwesomeIcons.solidMessage,
                label: "Inbox",
                isSelected: _selectedIndex == 3,
                onTap: () => _onTap(3),
                dark: _selectedIndex == 0,
              ),
              NavigationTab(
                icon: FontAwesomeIcons.user,
                selectedIcon: FontAwesomeIcons.solidUser,
                label: "Profile",
                isSelected: _selectedIndex == 4,
                onTap: () => _onTap(4),
                dark: _selectedIndex == 0,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PostVideoButton extends StatefulWidget {
  final bool dark;

  const PostVideoButton({
    super.key,
    required this.dark,
  });

  @override
  State<PostVideoButton> createState() => _PostVideoButtonState();
}

class _PostVideoButtonState extends State<PostVideoButton> {
  bool _pressing = false;

  void _openPostVideoScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Container(),
        fullscreenDialog: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => _openPostVideoScreen(context),
        onTapDown: (_) => setState(() => _pressing = true),
        onTapUp: (_) => setState(() => _pressing = false),
        onTapCancel: () => setState(() => _pressing = false),
        behavior: HitTestBehavior.opaque,
        child: AnimatedScale(
          curve: Curves.fastOutSlowIn,
          duration: const Duration(milliseconds: 200),
          scale: _pressing ? 1.2 : 1,
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Positioned(
                right: 26,
                child: Container(
                  height: 36,
                  width: 44,
                  decoration: BoxDecoration(
                    color: const Color(0xff61D4F0),
                    borderRadius: BorderRadius.circular(Sizes.size11),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: Sizes.size8),
                ),
              ),
              Positioned(
                left: 26,
                child: Container(
                  height: 36,
                  width: 44,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(Sizes.size11),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: Sizes.size8),
                ),
              ),
              Container(
                height: 36,
                width: 44,
                decoration: BoxDecoration(
                  color: widget.dark ? Colors.white : Colors.black,
                  borderRadius: BorderRadius.circular(Sizes.size12),
                ),
                child: Center(
                  child: FaIcon(
                    FontAwesomeIcons.plus,
                    color: widget.dark ? Colors.black : Colors.white,
                    size: Sizes.size20,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

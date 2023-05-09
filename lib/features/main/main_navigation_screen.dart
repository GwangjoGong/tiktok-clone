import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/main/widgets/navigation_tab.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  final screens = [
    const Center(child: Text("Home")),
    const Center(child: Text("Settings")),
    // const Center(child: Text("Activity")),
    // const Center(child: Text("Browse")),
    // const Center(child: Text("Community")),
  ];

  int _selectedIndex = 0;

  void _onTap(int index) => setState(() => _selectedIndex = index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: Sizes.size12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NavigationTab(
                icon: FontAwesomeIcons.house,
                label: "Home",
                isSelected: _selectedIndex == 0,
                onTap: () => _onTap(0),
              ),
              NavigationTab(
                icon: FontAwesomeIcons.magnifyingGlass,
                label: "Discover",
                isSelected: _selectedIndex == 1,
                onTap: () => _onTap(1),
              ),
              NavigationTab(
                icon: FontAwesomeIcons.inbox,
                label: "Inbox",
                isSelected: _selectedIndex == 3,
                onTap: () => _onTap(3),
              ),
              NavigationTab(
                icon: FontAwesomeIcons.user,
                label: "Profile",
                isSelected: _selectedIndex == 4,
                onTap: () => _onTap(4),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        currentIndex: _selectedIndex,
        // onTap: _onTap,
        items: const [
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.house),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.gear),
            label: "Settings",
          ),
        ],
      ),
      tabBuilder: (context, index) => screens[index],
    );
  }
}

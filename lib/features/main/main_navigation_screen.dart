import 'package:flutter/material.dart';
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
    const Center(child: Text("Activity")),
    const Center(child: Text("Browse")),
    const Center(child: Text("Community")),
  ];

  int _selectedIndex = 0;

  void _onTap(int index) => setState(() => _selectedIndex = index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onTap,
        // selectedItemColor: Theme.of(context).primaryColor,
        items: const [
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.house),
            label: "Home",
            backgroundColor: Colors.amber,
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.personRunning),
            label: "Activity",
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.firefoxBrowser),
            label: "Browse",
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.users),
              label: "Community",
              backgroundColor: Colors.purple),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.gear),
            label: "Settings",
            backgroundColor: Colors.red,
          ),
        ],
      ),
    );
  }
}

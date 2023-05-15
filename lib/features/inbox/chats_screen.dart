import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  void _addItem() {
    _listKey.currentState?.insertItem(0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Direct messages"),
        elevation: 1,
        actions: [
          IconButton(
            iconSize: Sizes.size32,
            splashRadius: Sizes.size20,
            icon: const Icon(Icons.add),
            onPressed: _addItem,
          ),
        ],
      ),
      body: AnimatedList(
        key: _listKey,
        padding: const EdgeInsets.symmetric(vertical: Sizes.size10),
        itemBuilder: (context, index, animation) {
          final curvedAnimation = animation.drive(
            CurveTween(curve: Curves.fastOutSlowIn),
          );

          return FadeTransition(
            key: UniqueKey(),
            opacity: curvedAnimation,
            child: SizeTransition(
              sizeFactor: curvedAnimation,
              child: ListTile(
                leading: const CircleAvatar(
                  radius: Sizes.size32,
                  child: Text('A'),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "AntonioBM $index",
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "2:16 PM",
                      style: TextStyle(
                        color: Colors.grey.shade400,
                        fontSize: Sizes.size14,
                      ),
                    )
                  ],
                ),
                subtitle: const Text("Say hi to AntonioBM"),
              ),
            ),
          );
        },
        initialItemCount: 1,
      ),
    );
  }
}

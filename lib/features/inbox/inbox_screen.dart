import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class InboxScreeen extends StatelessWidget {
  const InboxScreeen({super.key});

  void _onMessagePressed() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: const Text("Inbox"),
        actions: [
          IconButton(
            iconSize: Sizes.size16,
            splashRadius: Sizes.size20,
            icon: const Icon(FontAwesomeIcons.paperPlane),
            onPressed: _onMessagePressed,
          ),
        ],
      ),
      body: ListView(
        children: [
          const ListTile(
            title: Text(
              "Activity",
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
            trailing: FaIcon(
              FontAwesomeIcons.chevronRight,
              size: Sizes.size16,
              color: Colors.black,
            ),
          ),
          Container(
            height: Sizes.size1,
            color: Colors.grey.shade100,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              vertical: Sizes.size14,
              horizontal: Sizes.size16,
            ),
            child: Text(
              "Messages",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: Sizes.size16,
              ),
            ),
          ),
          ListTile(
            leading: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue.shade300,
              ),
              width: Sizes.size60,
              child: const Center(
                  child:
                      FaIcon(FontAwesomeIcons.solidUser, color: Colors.white)),
            ),
            horizontalTitleGap: Sizes.size10,
            title: const Text(
              "New Followers",
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: const Text("Messages from followers will appear here"),
            trailing: const FaIcon(
              FontAwesomeIcons.chevronRight,
              size: Sizes.size16,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

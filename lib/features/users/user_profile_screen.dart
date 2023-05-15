import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text("Gwangjo Gong"),
            actions: [
              IconButton(
                icon: const Icon(Icons.settings),
                splashRadius: Sizes.size20,
                onPressed: () {},
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                const CircleAvatar(
                  radius: Sizes.size52,
                  foregroundImage: NetworkImage("https://picsum.photos/200"),
                ),
                Gaps.v20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "@Gwangjo Gong",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Gaps.h5,
                    FaIcon(
                      FontAwesomeIcons.solidCircleCheck,
                      size: Sizes.size12,
                      color: Colors.blue.shade200,
                    ),
                  ],
                ),
                Gaps.v24,
                SizedBox(
                  height: 45,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          const Text(
                            "37",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: Sizes.size20,
                            ),
                          ),
                          Gaps.v4,
                          Text(
                            "Following",
                            style: TextStyle(color: Colors.grey.shade500),
                          )
                        ],
                      ),
                      VerticalDivider(
                        color: Colors.grey.shade200,
                        width: 30,
                        thickness: 1,
                        indent: 10,
                        endIndent: 10,
                      ),
                      Column(
                        children: [
                          const Text(
                            "10.5M",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: Sizes.size20,
                            ),
                          ),
                          Gaps.v4,
                          Text(
                            "Followers",
                            style: TextStyle(color: Colors.grey.shade500),
                          )
                        ],
                      ),
                      VerticalDivider(
                        color: Colors.grey.shade200,
                        width: 30,
                        thickness: 1,
                        indent: 10,
                        endIndent: 10,
                      ),
                      Column(
                        children: [
                          const Text(
                            "149.3M",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: Sizes.size20,
                            ),
                          ),
                          Gaps.v4,
                          Text(
                            "Likes",
                            style: TextStyle(color: Colors.grey.shade500),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Gaps.v10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 52,
                      padding: const EdgeInsets.symmetric(
                        horizontal: Sizes.size64,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(
                          Sizes.size2,
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          "Follow",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: Sizes.size16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Gaps.h6,
                    Container(
                      height: 52,
                      width: 52,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(Sizes.size2),
                      ),
                      child: const Center(
                        child: FaIcon(
                          FontAwesomeIcons.youtube,
                          size: Sizes.size24,
                        ),
                      ),
                    ),
                    Gaps.h6,
                    Container(
                      height: 52,
                      width: 52,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(Sizes.size2),
                      ),
                      child: const Icon(
                        Icons.arrow_drop_down,
                        size: Sizes.size28,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

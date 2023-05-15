import 'package:flutter/material.dart';

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
            // backgroundColor: Colors.transparent,
            expandedHeight: 200,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: const [
                StretchMode.zoomBackground,
                StretchMode.blurBackground,
              ],
              background:
                  Image.asset("assets/images/sample.jpg", fit: BoxFit.cover),
              title: const Text("Hello"),
            ),
          ),
          SliverFixedExtentList(
            delegate: SliverChildBuilderDelegate(
              childCount: 50,
              (context, index) {
                return Container(
                  color: Colors.primaries[index % Colors.primaries.length],
                  height: 100,
                  child: Center(child: Text("Item $index")),
                );
              },
            ),
            itemExtent: 100,
          )
        ],
      ),
    );
  }
}

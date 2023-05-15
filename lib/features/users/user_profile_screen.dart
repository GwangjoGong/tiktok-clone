import 'package:flutter/material.dart';
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
              childCount: 5,
              (context, index) {
                return Container(
                  color: Colors.primaries[index % Colors.primaries.length],
                  height: 100,
                  child: Center(child: Text("Item $index")),
                );
              },
            ),
            itemExtent: 100,
          ),
          SliverPersistentHeader(
            delegate: CustomDelegate(),
            pinned: true,
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  color: Colors.primaries[index % Colors.primaries.length],
                  height: 100,
                  child: Center(child: Text("Item $index")),
                );
              },
              childCount: 50,
            ),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 100,
                mainAxisSpacing: Sizes.size20,
                crossAxisSpacing: Sizes.size10,
                childAspectRatio: 1 / 1),
          )
        ],
      ),
    );
  }
}

class CustomDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.red,
      child: const FractionallySizedBox(
        heightFactor: 1,
        child: Center(
          child: Text("TITLE"),
        ),
      ),
    );
  }

  @override
  double get maxExtent => 100;

  @override
  double get minExtent => 50;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

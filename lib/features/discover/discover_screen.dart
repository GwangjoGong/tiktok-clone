import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class DiscoverScreen extends StatelessWidget {
  final tabs = [
    'Top',
    'Users',
    'Videos',
    'Sounds',
    'LIVE',
    'Shopping',
    'Brands'
  ];

  DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          elevation: 1,
          title: Row(children: const [
            Icon(Icons.search),
            SizedBox(width: Sizes.size10),
            Text('Search'),
          ]),
          bottom: TabBar(
            isScrollable: true,
            splashFactory: NoSplash.splashFactory,
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size16,
            ),
            labelStyle: const TextStyle(
              fontSize: Sizes.size16,
              fontWeight: FontWeight.w600,
            ),
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey.shade500,
            indicatorColor: Colors.black,
            indicatorWeight: 3,
            tabs: [
              for (var tab in tabs) Tab(text: tab),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            GridView.builder(
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.size8,
                vertical: Sizes.size8,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: Sizes.size8,
                mainAxisSpacing: Sizes.size8,
                childAspectRatio: 9 / 20.5,
              ),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    AspectRatio(
                      aspectRatio: 9 / 16,
                      child: Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Sizes.size4),
                        ),
                        child: FadeInImage.assetNetwork(
                          fit: BoxFit.cover,
                          placeholder: "assets/images/sample.jpg",
                          image:
                              "https://source.unsplash.com/random/200x${355 + index}/?dance",
                        ),
                      ),
                    ),
                    Gaps.v10,
                    const Text(
                      "This is a very long caption for my tiktok that i am uploading for just now and i am very happy to be here",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: Sizes.size16 + Sizes.size2,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Gaps.v10,
                    DefaultTextStyle(
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade600,
                      ),
                      child: Row(
                        children: [
                          const CircleAvatar(
                            radius: Sizes.size14,
                            backgroundImage: NetworkImage(
                                "https://source.unsplash.com/random/200x200/?dance"),
                          ),
                          Gaps.h6,
                          const Expanded(
                            child: Text(
                              "Gwangjo Gong",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Gaps.h6,
                          Icon(
                            Icons.favorite_border,
                            color: Colors.grey.shade600,
                            size: Sizes.size16,
                          ),
                          const Text(
                            "2.0M",
                          )
                        ],
                      ),
                    )
                  ],
                );
              },
            ),
            for (var tab in tabs.skip(1)) Center(child: Text(tab)),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  final TextEditingController _searchController = TextEditingController();

  final tabs = [
    'Top',
    'Users',
    'Videos',
    'Sounds',
    'LIVE',
    'Shopping',
    'Brands'
  ];

  bool _isWriting = false;
  bool _clearable = false;

  void _onTabTap() {
    FocusScope.of(context).unfocus();
  }

  void _onBackTap() {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    } else {
      //TODO
    }
  }

  void _onMenuTap() {}

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 1,
          title: Row(
            children: [
              GestureDetector(
                onTap: _onBackTap,
                child: const Icon(
                  FontAwesomeIcons.chevronLeft,
                  color: Colors.black,
                  size: Sizes.size24,
                ),
              ),
              Gaps.h10,
              Expanded(
                child: Container(
                  height: Sizes.size44,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(Sizes.size6),
                  ),
                  child: TextField(
                    textAlignVertical: TextAlignVertical.center,
                    controller: _searchController,
                    onTap: () {
                      setState(() {
                        _isWriting = true;
                      });
                    },
                    onChanged: (value) {
                      setState(() {
                        _clearable = value.isNotEmpty;
                      });
                    },
                    onSubmitted: (value) {
                      setState(() {
                        _isWriting = false;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: const TextStyle(
                        fontSize: Sizes.size16,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                      border: InputBorder.none,
                      prefixIcon: const Icon(
                        CupertinoIcons.search,
                        color: Colors.black,
                      ),
                      isCollapsed: true,
                      suffixIcon: _isWriting && _clearable
                          ? GestureDetector(
                              onTap: () {
                                _searchController.clear();
                                setState(() {
                                  _clearable = false;
                                });
                              },
                              child: Icon(
                                CupertinoIcons.clear_circled_solid,
                                color: Colors.grey.shade600,
                              ),
                            )
                          : null,
                    ),
                  ),
                ),
              ),
              Gaps.h16,
              GestureDetector(
                onTap: _onMenuTap,
                child: const Icon(
                  FontAwesomeIcons.bars,
                  color: Colors.black,
                ),
              ),
            ],
          ),
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
            onTap: (value) {
              _onTabTap();
            },
            tabs: [
              for (var tab in tabs) Tab(text: tab),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            GridView.builder(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
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

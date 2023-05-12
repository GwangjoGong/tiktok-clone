import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class VideoComments extends StatefulWidget {
  const VideoComments({super.key});

  @override
  State<VideoComments> createState() => _VideoCommentsState();
}

class _VideoCommentsState extends State<VideoComments> {
  void _onClosePressed() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Sizes.size10),
          topRight: Radius.circular(Sizes.size10),
        ),
      ),
      height: MediaQuery.of(context).size.height * 0.7,
      clipBehavior: Clip.hardEdge,
      child: Scaffold(
        backgroundColor: Colors.grey.shade50,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('22796 Comments'),
          actions: [
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: _onClosePressed,
            ),
          ],
          backgroundColor: Colors.grey.shade50,
        ),
        bottomNavigationBar: BottomAppBar(
          padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size16, vertical: Sizes.size8),
          child: Row(
            children: [
              CircleAvatar(
                radius: Sizes.size20,
                backgroundColor: Colors.grey.shade200,
                child: const Text('G'),
              ),
              Gaps.h10,
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Sizes.size12,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(Sizes.size6),
                    ),
                  ),
                  child: TextField(
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      hintText: 'Add a comment...',
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        fontSize: Sizes.size16,
                        color: Colors.grey.shade600,
                      ),
                      suffix: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Icon(
                            Icons.alternate_email,
                            size: Sizes.size24,
                          ),
                          Gaps.h10,
                          Icon(
                            Icons.add_box_outlined,
                            size: Sizes.size24,
                          ),
                          Gaps.h10,
                          Icon(
                            Icons.tag_faces_outlined,
                            size: Sizes.size24,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: ListView.separated(
          padding: const EdgeInsets.symmetric(
            vertical: Sizes.size10,
            horizontal: Sizes.size16,
          ),
          separatorBuilder: (context, index) {
            return Gaps.v20;
          },
          itemCount: 10,
          itemBuilder: (context, index) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: Sizes.size20,
                  backgroundColor: Colors.grey.shade200,
                  child: const Text('G'),
                ),
                Gaps.h10,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Gaps.v4,
                      Text(
                        "Gwangjo Gong",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      Gaps.v4,
                      const Text(
                        "That's not it I've seen the same thing but also in a cave",
                        style: TextStyle(fontSize: Sizes.size16),
                      ),
                    ],
                  ),
                ),
                Gaps.h16,
                Column(
                  children: [
                    Icon(Icons.favorite_border, color: Colors.grey.shade600),
                    Text(
                      "31.9K",
                      style: TextStyle(color: Colors.grey.shade600),
                    ),
                  ],
                )
              ],
            );
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:tiktok_clone/features/videos/widgets/video_post.dart';

class VideoTimelineScreen extends StatefulWidget {
  const VideoTimelineScreen({super.key});

  @override
  State<VideoTimelineScreen> createState() => _VideoTimelineScreenState();
}

class _VideoTimelineScreenState extends State<VideoTimelineScreen> {
  final PageController _pageController = PageController();

  int _itemCount = 4;

  void _onPageChanged(int value) {
    _pageController.animateToPage(value,
        duration: const Duration(milliseconds: 200), curve: Curves.linear);

    if (value == _itemCount - 1) {
      setState(() {
        _itemCount += 4;
      });
    }
  }

  void _onVideoFinished() {
    _pageController.nextPage(
        duration: const Duration(milliseconds: 200), curve: Curves.linear);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      scrollDirection: Axis.vertical,
      itemCount: _itemCount,
      onPageChanged: _onPageChanged,
      itemBuilder: (context, index) {
        return VideoPost(
          onVideoFinished: _onVideoFinished,
          index: index,
        );
      },
    );
  }
}

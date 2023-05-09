import 'package:flutter/material.dart';

class VideoTimelineScreen extends StatefulWidget {
  const VideoTimelineScreen({super.key});

  @override
  State<VideoTimelineScreen> createState() => _VideoTimelineScreenState();
}

class _VideoTimelineScreenState extends State<VideoTimelineScreen> {
  final PageController _pageController = PageController();

  int _itemCount = 4;

  List<Color> colors = [
    Colors.blue,
    Colors.red,
    Colors.green,
    Colors.yellow,
  ];

  void _onPageChanged(int value) {
    _pageController.animateToPage(value,
        duration: const Duration(milliseconds: 150), curve: Curves.linear);

    if (value == _itemCount - 1) {
      setState(() {
        _itemCount += 4;
        colors.addAll([
          Colors.blue,
          Colors.red,
          Colors.green,
          Colors.yellow,
        ]);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      scrollDirection: Axis.vertical,
      itemCount: _itemCount,
      onPageChanged: _onPageChanged,
      itemBuilder: (context, index) {
        return Container(
          color: colors[index],
          child: Center(child: Text("$index")),
        );
      },
    );
  }
}

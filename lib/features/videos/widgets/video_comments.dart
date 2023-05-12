import 'package:flutter/material.dart';
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
          body: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                child: Text('Comment $index'),
              );
            },
          )),
    );
  }
}

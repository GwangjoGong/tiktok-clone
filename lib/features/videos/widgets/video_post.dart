import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class VideoPost extends StatefulWidget {
  final void Function() onVideoFinished;
  final int index;

  const VideoPost(
      {super.key, required this.onVideoFinished, required this.index});

  @override
  State<VideoPost> createState() => _VideoPostState();
}

class _VideoPostState extends State<VideoPost>
    with SingleTickerProviderStateMixin {
  final VideoPlayerController _videoPlayerController =
      VideoPlayerController.asset("assets/videos/sample.mp4");

  late final AnimationController _animationController;

  bool _isPlaying = true;

  void _initVideoPlayer() async {
    await _videoPlayerController.initialize();
    setState(() {});
    _videoPlayerController.addListener(() {
      _onVideoChange();
    });
    // _videoPlayerController.play();
  }

  void _onVideoChange() {
    if (_videoPlayerController.value.isInitialized) {
      if (_videoPlayerController.value.position >=
          _videoPlayerController.value.duration) {
        widget.onVideoFinished();
      }
    }
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    if (info.visibleFraction == 1 && !_videoPlayerController.value.isPlaying) {
      _videoPlayerController.play();

      setState(() {
        _isPlaying = true;
      });
    }
  }

  void _togglePlay() {
    if (_videoPlayerController.value.isPlaying) {
      _videoPlayerController.pause();
      _animationController.reverse();
    } else {
      _videoPlayerController.play();
      _animationController.forward();
    }
    setState(() {
      _isPlaying = !_isPlaying;
    });
  }

  @override
  void initState() {
    super.initState();
    _initVideoPlayer();

    _animationController = AnimationController(
      vsync: this,
      lowerBound: 1.0,
      upperBound: 1.5,
      value: 1.5,
      duration: const Duration(milliseconds: 200),
    );

    _animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key("${widget.index}"),
      onVisibilityChanged: _onVisibilityChanged,
      child: Stack(
        children: [
          Positioned.fill(
            child: _videoPlayerController.value.isInitialized
                ? VideoPlayer(_videoPlayerController)
                : Container(color: Colors.black),
          ),
          Positioned.fill(child: GestureDetector(onTap: _togglePlay)),
          Positioned.fill(
            child: IgnorePointer(
              child: Transform.scale(
                scale: _animationController.value,
                child: AnimatedOpacity(
                  opacity: _isPlaying ? 0 : 1,
                  curve: Curves.fastOutSlowIn,
                  duration: const Duration(milliseconds: 200),
                  child: const Center(
                    child: FaIcon(
                      FontAwesomeIcons.play,
                      color: Colors.white,
                      size: Sizes.size48,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

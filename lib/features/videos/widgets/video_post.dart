import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/videos/widgets/action_button.dart';
import 'package:tiktok_clone/features/videos/widgets/video_comments.dart';
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
    await _videoPlayerController.setLooping(true);
    setState(() {});
    _videoPlayerController.play();
    _videoPlayerController.addListener(() {
      _onVideoChange();
    });
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
    if (info.visibleFraction == 1 &&
        _isPlaying &&
        !_videoPlayerController.value.isPlaying) {
      _videoPlayerController.play();
    }

    if (_videoPlayerController.value.isPlaying && info.visibleFraction == 0) {
      _videoPlayerController.pause();
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

  void _onCommentsTap() async {
    if (_videoPlayerController.value.isPlaying) {
      _togglePlay();
    }

    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(Sizes.size10)),
      ),
      builder: (context) => const VideoComments(),
    );

    if (!_videoPlayerController.value.isPlaying) {
      _togglePlay();
    }
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
              child: AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) => Transform.scale(
                  scale: _animationController.value,
                  child: child,
                ),
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
          Positioned(
            bottom: Sizes.size24,
            left: Sizes.size10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "@GwangjoGong",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: Sizes.size16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Gaps.v12,
                Text(
                  "This is a sample video",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: Sizes.size24,
            right: Sizes.size10,
            child: Column(
              children: [
                const CircleAvatar(
                  radius: Sizes.size24,
                  foregroundImage: NetworkImage(
                      'https://avatars.githubusercontent.com/u/43431790?v=4'),
                  child: Text("G"),
                ),
                Gaps.v24,
                ActionButton(
                  icon: FontAwesomeIcons.solidHeart,
                  label: "2.9M",
                  onPressed: () {},
                ),
                Gaps.v24,
                ActionButton(
                  icon: FontAwesomeIcons.solidComment,
                  label: "33.0K",
                  onPressed: _onCommentsTap,
                ),
                Gaps.v24,
                ActionButton(
                  icon: FontAwesomeIcons.share,
                  label: "Share",
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

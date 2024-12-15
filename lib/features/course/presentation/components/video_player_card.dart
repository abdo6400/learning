import 'package:chewie/chewie.dart';
import 'package:e_learning/core/utils/extensions/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:video_player/video_player.dart';

import '../../../../config/database/api/end_points.dart';
import '../../domain/entities/video.dart';

class VideoPlayerCard extends StatefulWidget {
  final List<Video> video;
  final String title;

  const VideoPlayerCard({super.key, required this.video, required this.title});

  @override
  State<VideoPlayerCard> createState() => _VideoPlayerCardState();
}

class _VideoPlayerCardState extends State<VideoPlayerCard> {
  late VideoPlayerController _controller;
  late ChewieController _chewieController;
  bool _isInitialized = false;
  @override
  void initState() {
    super.initState();
    _initializeVideo();
  }

  Future<void> _initializeVideo() async {
    try {
      _controller = VideoPlayerController.networkUrl(
        Uri.parse(EndPoints.sourceUrlVideo + widget.video.first.videoUrl),
      )..initialize().then((_) {
          _chewieController = ChewieController(
            videoPlayerController: _controller,
            autoInitialize: true,
            showOptions: false,
            showControls: true,
            autoPlay: true,
            looping: true,
            aspectRatio: 16 / 9,
            draggableProgressBar: true,
            errorBuilder: (context, errorMessage) {
              return Center(
                child: Text(
                  errorMessage,
                  style: TextStyle(color: Colors.white),
                ),
              );
            },
          );
          setState(() {
            _isInitialized = true;
          });
        });
    } catch (e) {
      debugPrint('Video initialization error: $e');
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      child: _isInitialized
          ? AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: Chewie(
                controller: _chewieController,
              ))
          : AspectRatio(
              aspectRatio: 16 / 9,
              child: Center(
                  child: SpinKitChasingDots(
                color: Theme.of(context).indicatorColor,
                size: context.ResponsiveValu(30,
                    mobile: 20, tablet: 50, desktop: 70),
              ))),
    );
  }
}

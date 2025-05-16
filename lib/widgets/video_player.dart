import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:video_player/video_player.dart';

class VideoPlayers extends StatefulWidget {
  const VideoPlayers({super.key});

  @override
  State<VideoPlayers> createState() => _VideoPlayersState();
}

class _VideoPlayersState extends State<VideoPlayers> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/video/video.mp4')
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
      });
  }

  @override
  void dispose() {
    _controller.dispose(); // free resources
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff0E0412),
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child:
                  _controller.value.isInitialized
                      ? AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller),
                      )
                      : const CircularProgressIndicator(),
            ),
            Positioned(
              top: 16,
              left: 16,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 127, 111, 160),
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 16,
              right: 16,
              child: CircleAvatar(
                backgroundColor: Color.fromARGB(255, 127, 111, 160),
                child: const Icon(
                  FontAwesomeIcons.filter,
                  color: Colors.white,
                  size: 15,
                ),
              ),
            ),
            Positioned(
              top: 105,
              left: 222,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _controller.value.isPlaying
                        ? _controller.pause()
                        : _controller.play();
                  });
                },
                child: Icon(
                  _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                  size: 50,
                  color: Color(0xffB090F4),
                ),
              ),
            ),
            if (_controller.value.isInitialized)
              VideoProgressIndicator(
                _controller,
                allowScrubbing: true,

                padding: const EdgeInsets.all(12),
                colors: VideoProgressColors(
                  playedColor: Color(0xffB090F4),
                  backgroundColor: Colors.white38,
                  bufferedColor: Colors.white70,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

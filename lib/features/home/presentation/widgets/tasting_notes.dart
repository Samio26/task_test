import 'package:flutter/material.dart';
import 'package:tesstt_task/utils/theme/theme_colors.dart';
import 'package:video_player/video_player.dart';

class DetailVideoWidget extends StatefulWidget {
  const DetailVideoWidget({super.key, required this.videoUrl});
  final String videoUrl;
  @override
  State<DetailVideoWidget> createState() => _DetailVideoWidgetState();
}

class _DetailVideoWidgetState extends State<DetailVideoWidget> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {});
        _controller.setLooping(true);
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: VideoPlayer(_controller),
                      ),
                    ),
                    IconButton(
                      iconSize: 64,
                      icon: Icon(
                        _controller.value.isPlaying
                            ? Icons.pause_circle
                            : Icons.play_circle,
                        color: Colors.white.withOpacity(0.9),
                      ),
                      onPressed: () {
                        setState(() {
                          _controller.value.isPlaying
                              ? _controller.pause()
                              : _controller.play();
                        });
                      },
                    ),
                  ],
                ),
              ),
              const Text("Tasting notes",
                  style: TextStyle(
                      color: ThemeColors.actionBgBtnColor,
                      fontSize: 22,
                      fontWeight: FontWeight.w500)),
              const Text(
                "By Charles MacLean MBE",
                style: TextStyle(
                    color: ThemeColors.actionBgBtnColor, fontSize: 16),
              ),
              const SizedBox(height: 15),
              _cardWidget("Nose"),
              const SizedBox(height: 10),
              _cardWidget("Palate"),
              const SizedBox(height: 10),
              _cardWidget("Finish")
            ],
          )
        : const Center(child: CircularProgressIndicator());
  }

  static Widget _cardWidget(
    String title,
  ) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
          color: ThemeColors.mainColor,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: TextStyle(
                  color: ThemeColors.actionBgBtnColor,
                  fontSize: 22,
                  fontWeight: FontWeight.w500)),
          const Text("Description",
              style: TextStyle(
                  color: ThemeColors.actionBgBtnColor,
                  fontSize: 22,
                  fontWeight: FontWeight.w500)),
          const Text("Description",
              style: TextStyle(
                  color: ThemeColors.actionBgBtnColor,
                  fontSize: 22,
                  fontWeight: FontWeight.w500)),
          const Text("Description",
              style: TextStyle(
                  color: ThemeColors.actionBgBtnColor,
                  fontSize: 22,
                  fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}

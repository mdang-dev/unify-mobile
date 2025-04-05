import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:unify/model/post.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class PostCard extends StatefulWidget {
  final Post post;
  const PostCard({super.key, required this.post});

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  int _currentIndex = 0;
  VideoPlayerController? _videoPlayerController;

  @override
  void initState() {
    super.initState();
    if (widget.post.media.isNotEmpty &&
        widget.post.media[0].mediaType == 'video') {
      _initializeVideoPlayer(widget.post.media[0].url);
    }
  }

  @override
  void dispose() {
    _videoPlayerController?.dispose();
    super.dispose();
  }

  void _initializeVideoPlayer(String videoUrl) async {
    _videoPlayerController = VideoPlayerController.network(videoUrl)
      ..initialize().then((_) {
        if (mounted) {
          setState(() {
            _videoPlayerController!.play();
          });
        }
      });
  }

  void _onMediaChanged(int index) {
    if (widget.post.media[index].mediaType == 'video') {
      if (_videoPlayerController?.value.isInitialized ?? false) {
        _videoPlayerController?.dispose();
      }
      _initializeVideoPlayer(widget.post.media[index].url);
    }
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      elevation: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 4.0),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://mir-s3-cdn-cf.behance.net/project_modules/1400_opt_1/4b1f4452438909.5910f3a745874.png'),
                  ),
                ),
                Text(
                  widget.post.user.username,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.post.captions,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Wrap(
              spacing: 1.0,
              runSpacing: 1.0,
              children: widget.post.hashtags
                  .map((hashtag) => Padding(
                        padding: const EdgeInsets.only(right: 4.0),
                        child: Text(
                          hashtag.content,
                          style: const TextStyle(color: Colors.blueAccent),
                        ),
                      ))
                  .toList(),
            ),
          ),
          const SizedBox(height: 5),
          if (widget.post.media.isNotEmpty)
            Column(
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    height: 200.0,
                    autoPlay: false,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: true,
                    viewportFraction: 1.0,
                    onPageChanged: (index, reason) {
                      _onMediaChanged(index);
                    },
                  ),
                  items: widget.post.media.map((item) {
                    return Builder(
                      builder: (BuildContext context) {
                        if (item.mediaType == 'video') {
                          // Ensure that video is initialized

                          if (_videoPlayerController?.value.isInitialized ??
                              false) {
                            return AspectRatio(
                              aspectRatio:
                                  _videoPlayerController!.value.aspectRatio,
                              child: VideoPlayer(_videoPlayerController!),
                            );
                          } else {
                            // Show loading indicator until the video is initialized
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                        } else {
                          // If it's an image, return the image widget
                          return Image.network(
                            item.url,
                            fit: BoxFit.cover,
                          );
                        }
                      },
                    );
                  }).toList(),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: widget.post.media.map((url) {
                    int index = widget.post.media.indexOf(url);
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentIndex == index
                            ? Colors.blueAccent
                            : const Color.fromARGB(255, 23, 17, 17)
                                .withOpacity(0.5),
                      ),
                    );
                  }).toList(),
                )
              ],
            ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                // Heart Icon for Likes
                IconButton(
                  icon: const Icon(
                    FontAwesomeIcons
                        .heart, // Change to Icons.favorite for liked state
                    size: 20,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    // Action to toggle like status
                  },
                ),
                IconButton(
                  icon: const Icon(
                    FontAwesomeIcons.commentDots,
                    size: 20,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    // Action to open comment section
                  },
                ),
                IconButton(
                  icon: const Icon(
                    FontAwesomeIcons.solidPaperPlane,
                    size: 20,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    // Action for share button
                  },
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(
                    Icons
                        .bookmark_border, // Change to Icons.bookmark for saved state
                    size: 20,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    // Action for saving post
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

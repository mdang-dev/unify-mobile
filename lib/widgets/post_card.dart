import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:unify/model/post.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:video_player/video_player.dart';

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
      color: Colors.white,
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
                          if (_videoPlayerController?.value.isInitialized ??
                              false) {
                            return AspectRatio(
                              aspectRatio:
                                  _videoPlayerController!.value.aspectRatio,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: VideoPlayer(_videoPlayerController!)),
                            );
                          } else {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                        } else {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              item.url,
                              fit: BoxFit.cover,
                            ),
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
                      height: 5,
                      width: 5,
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
                    FontAwesomeIcons.heart,
                    size: 20,
                    color: Colors.black,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(
                    FontAwesomeIcons.commentDots,
                    size: 20,
                    color: Colors.black,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(
                    FontAwesomeIcons.solidPaperPlane,
                    size: 20,
                    color: Colors.black,
                  ),
                  onPressed: () {},
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(
                    Icons.bookmark_border,
                    size: 20,
                    color: Colors.black,
                  ),
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

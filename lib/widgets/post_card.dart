import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:unify/model/post.dart';

class PostCard extends StatelessWidget {
  final Post post;

  const PostCard({super.key, required this.post});

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
                    post.username,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  )
                ],
              )),
          Image.network(post.imageUrl),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              post.caption,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Wrap(
                spacing: 1.0,
                runSpacing: 1.0,
                children: post.hashtags
                    .map((hashtag) => Padding(
                          padding: const EdgeInsets.only(right: 4.0),
                          child: Text(
                            hashtag,
                            style: const TextStyle(color: Colors.blueAccent),
                          ),
                        ))
                    .toList()),
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

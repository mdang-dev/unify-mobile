class Post {
  final String username;
  final String imageUrl;
  final String caption;
  final List<String> hashtags;
  final int likes;

  Post(
      {required this.username,
      required this.imageUrl,
      required this.caption,
      required this.hashtags,
      required this.likes});
}

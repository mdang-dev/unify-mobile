import 'package:unify/model/hashtag.dart';
import 'package:unify/model/media.dart';
import 'package:unify/model/user.dart';

class Post {
  
  final String id;
  final String captions;
  final int status;
  final String audience;
  final User user;
  final DateTime postedAt;
  final bool isCommentVisible;
  final bool isLikeVisible;
  final List<Media> media;
  final List<Hashtag> hashtags;

  Post(
      {required this.id,
      required this.captions,
      required this.status,
      required this.audience,
      required this.user,
      required this.postedAt,
      required this.isCommentVisible,
      required this.isLikeVisible,
      required this.media,
      required this.hashtags});
  
}

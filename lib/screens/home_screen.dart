import 'package:flutter/material.dart';
import 'package:unify/model/hashtag.dart';
import 'package:unify/model/media.dart';
import 'package:unify/model/post.dart';
import 'package:unify/model/role.dart';
import 'package:unify/model/user.dart';
import 'package:unify/widgets/post_card.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final User user = User(
    id: '123',
    firstName: 'John',
    lastName: 'Doe',
    username: 'johndoe',
    phone: '123-456-7890',
    email: 'johndoe@example.com',
    registerAt: DateTime.now(),
    gender: true,
    birthDay: DateTime(1990, 1, 1),
    location: 'New York',
    education: "Bachelor's Degree",
    workAt: 'Company XYZ',
    biography: 'Developer at XYZ',
    roles: [Role(id: '1', name: 'ADMIN')], // Example roles
  );

  final List<Post> _posts = [
    Post(
        id: '1',
        captions: 'First Post Caption',
        status: 1, // Corrected to an integer value
        audience: 'public',
        user: User(
          id: '190',
          firstName: 'Jane',
          lastName: 'Smith',
          username: 'janesmith',
          phone: '987-654-3210',
          email: 'janesmith@example.com',
          registerAt: DateTime.now(),
          gender: false,
          birthDay: DateTime(1985, 5, 20),
          location: 'Los Angeles',
          education: 'Master\'s Degree',
          workAt: 'Company ABC',
          biography: 'Designer at ABC',
          roles: [Role(id: '2', name: 'USER')],
        ), // Using the User object
        postedAt: DateTime.now(),
        isCommentVisible: true,
        isLikeVisible: true,
        media: [
          const Media(
            id: 'm1',
            url:
                'https://www.searchenginejournal.com/wp-content/uploads/2020/04/shutterstock_594103436-5eab6f5b7b10a.png',
            fileType: 'jpg',
            size: 2048, // Size in bytes (example: 2 KB)
            mediaType: 'image',
          ),
          const Media(
            id: 'm2',
            url:
                'https://www.searchenginejournal.com/wp-content/uploads/2020/04/shutterstock_594103436-5eab6f5b7b10a.png',
            fileType: 'jpg',
            size: 3072, // Size in bytes (example: 3 KB)
            mediaType: 'image',
          ),
        ],
        hashtags: [
          Hashtag(id: '1213', content: '#tech')
        ]),
    Post(
        id: '2',
        captions: 'Second Post Caption',
        status: 1, // Corrected to an integer value
        audience: 'private',
        user: User(
          id: '456',
          firstName: 'Jane',
          lastName: 'Smith',
          username: 'janesmith',
          phone: '987-654-3210',
          email: 'janesmith@example.com',
          registerAt: DateTime.now(),
          gender: false,
          birthDay: DateTime(1985, 5, 20),
          location: 'Los Angeles',
          education: 'Master\'s Degree',
          workAt: 'Company ABC',
          biography: 'Designer at ABC',
          roles: [Role(id: '2', name: 'USER')],
        ),
        postedAt: DateTime.now().subtract(const Duration(days: 1)),
        isCommentVisible: false,
        isLikeVisible: true,
        media: [
          const Media(
            id: 'm3',
            url:
                'https://www.searchenginejournal.com/wp-content/uploads/2020/04/shutterstock_594103436-5eab6f5b7b10a.png',
            fileType: 'jpg',
            size: 5120, // 5 KB
            mediaType: 'image',
          ),
        ],
        hashtags: [
          Hashtag(id: '1213', content: '#tech')
        ]),
    Post(
        id: '3',
        captions: 'Third Post Caption',
        status: 1, // Corrected to an integer value
        audience: 'friends',
        user: User(
          id: '789',
          firstName: 'Alice',
          lastName: 'Johnson',
          username: 'alicejohnson',
          phone: '555-1234',
          email: 'alicejohnson@example.com',
          registerAt: DateTime.now().subtract(const Duration(days: 2)),
          gender: true,
          birthDay: DateTime(1992, 10, 12),
          location: 'San Francisco',
          education: 'PhD in Computer Science',
          workAt: 'TechCorp',
          biography: 'Engineer at TechCorp',
          roles: [Role(id: '3', name: 'USER')],
        ),
        postedAt: DateTime.now().subtract(const Duration(days: 2)),
        isCommentVisible: true,
        isLikeVisible: true,
        media: [
          const Media(
            id: 'm4',
            url:
                'https://www.searchenginejournal.com/wp-content/uploads/2020/04/shutterstock_594103436-5eab6f5b7b10a.png',
            fileType: 'jpg',
            size: 10240, // 10 KB
            mediaType: 'image',
          ),
          const Media(
            id: 'm5',
            url:
                'https://videos.pexels.com/video-files/3008598/3008598-hd_1920_1080_25fps.mp4',
            fileType: 'jpg',
            size: 8192, // 8 KB
            mediaType: 'video',
          ),
        ],
        hashtags: [
          Hashtag(id: '1213', content: '#tech')
        ]),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home Page !'),
        ),
        body: ListView.builder(
          itemCount: _posts.length,
          itemBuilder: (context, index) {
            final post = _posts[index];
            return PostCard(post: post);
          },
        ));
  }
}

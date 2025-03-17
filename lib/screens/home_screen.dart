import 'package:flutter/material.dart';
import 'package:unify/model/post.dart';
import 'package:unify/widgets/post_card.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Post> _posts = [
    Post(
      username: 'Jane Doe',
      imageUrl:
          'https://th.bing.com/th/id/OIP.0vUez19N2_hoLBdZeeIN1wHaFK?rs=1&pid=ImgDetMain',
      caption:
          'Creating the perfect cozy corner in your home is the ultimate self-care.',
      hashtags: ['#CozyVibes', '#HomeSweetHome', '#RelaxationGoals'],
      likes: 120,
    ),
    Post(
      username: 'John Smith',
      imageUrl:
          'https://th.bing.com/th/id/R.ccc4fa2aa6ae2a35d3891a6dfc8365d1?rik=4rH%2flaImYhbkNQ&pid=ImgRaw&r=0',
      caption:
          'Tip of the day: Keep your kitchen organized with clear jars for dry goods!',
      hashtags: ['#KitchenGoals', '#Organization', '#HomeDecor'],
      likes: 250,
    ),
    Post(
      username: 'Alice Johnson',
      imageUrl:
          'https://th.bing.com/th/id/OIP.zqhL91YFe-ORwgs9_QFEeQHaE1?rs=1&pid=ImgDetMain',
      caption: 'From drab to fab! Check out this living room makeover.',
      hashtags: ['#LivingRoomMakeover', '#HomeRenovation', '#BeforeAndAfter'],
      likes: 340,
    ),
    Post(
      username: 'Bob Brown',
      imageUrl:
          'https://th.bing.com/th/id/OIP.kiBBKylm3m-0JwP_qxcxfQHaEK?rs=1&pid=ImgDetMain',
      caption:
          'Filling your home with greenery is one of the simplest ways to add life and style.',
      hashtags: ['#PlantMom', '#GreeneryEverywhere', '#UrbanJungle'],
      likes: 89,
    ),
    Post(
      username: 'Eve Wilson',
      imageUrl:
          'https://th.bing.com/th/id/OIP.3sf1KDbUllmHlXijq-pmRgHaE8?rs=1&pid=ImgDetMain',
      caption:
          'DIY projects are the best way to add personal touches to your space.',
      hashtags: ['#DIYHome', '#CraftingMagic', '#HomeProjects'],
      likes: 15,
    ),
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

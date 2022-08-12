import 'package:flutter/material.dart';
import 'ImageDetail.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HeroAnimation"),
        leading: const Icon(Icons.menu),
        actions: const [Icon(Icons.settings)],
        elevation: 0.0,
        //去掉阴影
        centerTitle: true,
      ),
      body: const MyHeroAnimation(),
    );
  }
}

class MyHeroAnimation extends StatefulWidget {
  const MyHeroAnimation({Key? key}) : super(key: key);

  @override
  State<MyHeroAnimation> createState() => _MyHeroAnimationState();
}

class _MyHeroAnimationState extends State<MyHeroAnimation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: GridView.extent(
        maxCrossAxisExtent: 300.0,
        mainAxisSpacing: 20,
        children: List.generate(20, (index) {
          String imageUrl = 'https://picsum.photos/id/$index/300/400';
          return GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return ImageDetail(imageUrl);
              }));
            },
            child: Hero(
              tag: imageUrl,
              child: Image.network(imageUrl),
            ),
          );
        }),
      ),
    );
  }
}

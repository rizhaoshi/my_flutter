import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image"),
        leading: const Icon(Icons.menu),
        actions: const [Icon(Icons.settings)],
        elevation: 0.0,
        //去掉阴影
        centerTitle: true,
      ),
      body: const MyImage(),
    );
  }
}

class MyImage extends StatefulWidget {
  const MyImage({Key? key}) : super(key: key);

  @override
  State<MyImage> createState() => _MyImageState();
}

class _MyImageState extends State<MyImage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Image.asset(
          'images/zmbz_ys_yj_01.png',
          fit: BoxFit.fill,
        ),
        Image.network(
          'https://pics1.baidu.com/feed/838ba61ea8d3fd1fd47742bcef4b4f1694ca5fcd.jpeg?token=6bf8d1173859fb06a4498e6e70c821c5',
          // repeat: ImageRepeat.repeat,
          // colorBlendMode: BlendMode.dstIn,
          // color: Colors.green,
          fit: BoxFit.cover,
        )
      ],
    );
  }
}

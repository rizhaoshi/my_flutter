import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stack"),
        leading: const Icon(Icons.menu),
        actions: const [Icon(Icons.settings)],
        elevation: 0.0,
        //去掉阴影
        centerTitle: true,
      ),
      body: const MyStack(),
    );
  }
}

class MyStack extends StatefulWidget {
  const MyStack({Key? key}) : super(key: key);

  @override
  State<MyStack> createState() => _MyStackState();
}

class _MyStackState extends State<MyStack> with SingleTickerProviderStateMixin {
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
    return Stack(
      //未定位的子组件的排列方式
      textDirection: TextDirection.rtl,
      //未定位的子组件的对齐方式
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        const CircleAvatar(
          backgroundImage: NetworkImage(
              'https://pics1.baidu.com/feed/838ba61ea8d3fd1fd47742bcef4b4f1694ca5fcd.jpeg?token=6bf8d1173859fb06a4498e6e70c821c5'),
          radius: 200,
        ),
        Positioned(
          top: 50,
          right: 60,
          child: Container(
              color: Colors.red,
              padding: const EdgeInsets.all(10),
              child: const Text(
                '荷花',
                style: TextStyle(color: Colors.white, fontSize: 20),
              )),
        ),
        const Text(
          '哈哈哈哈',
          style: TextStyle(color: Colors.black, fontSize: 30),
        ),
      ],
    );
  }
}

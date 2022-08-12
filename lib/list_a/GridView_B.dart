import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GridViewCount"),
        leading: const Icon(Icons.menu),
        actions: const [Icon(Icons.settings)],
        elevation: 0.0,
        //去掉阴影
        centerTitle: true,
      ),
      body: const MyGridViewBuilder(),
    );
  }
}

class MyGridViewCount extends StatefulWidget {
  const MyGridViewCount({Key? key}) : super(key: key);

  @override
  State<MyGridViewCount> createState() => _MyGridViewCountState();
}

class _MyGridViewCountState extends State<MyGridViewCount>
    with SingleTickerProviderStateMixin {
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
    return Container(
      child: GridView.count(
        crossAxisCount: 3,
        mainAxisSpacing: 30,
        crossAxisSpacing: 20,
        padding: const EdgeInsets.all(20),
        childAspectRatio: 1.5,
        children:
            List.generate(15, (index) => Image.asset('images/icon_lzgy.jpg')),
      ),
    );
  }
}

class MyGridViewExtend extends StatefulWidget {
  const MyGridViewExtend({Key? key}) : super(key: key);

  @override
  State<MyGridViewExtend> createState() => _MyGridViewExtendState();
}

class _MyGridViewExtendState extends State<MyGridViewExtend>
    with SingleTickerProviderStateMixin {
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
    return Container(
      child: GridView.extent(
        maxCrossAxisExtent: 250,
        mainAxisSpacing: 30,
        crossAxisSpacing: 20,
        padding: const EdgeInsets.all(10),
        // childAspectRatio: 1.5,
        children:
            List.generate(15, (index) => Image.asset('images/icon_lzgy.jpg')),
      ),
    );
  }
}

class MyGridViewBuilder extends StatefulWidget {
  const MyGridViewBuilder({Key? key}) : super(key: key);

  @override
  State<MyGridViewBuilder> createState() => _MyGridViewBuilderState();
}

class _MyGridViewBuilderState extends State<MyGridViewBuilder>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  final List<dynamic> _liles = [
    Container(color: Colors.blue),
    Container(color: Colors.amber),
    Container(color: Colors.cyan),
    Container(color: Colors.deepOrange),
    Container(color: Colors.grey),
    Container(color: Colors.lightBlue),
    Container(color: Colors.red),
    Container(color: Colors.indigo),
    Container(color: Colors.pinkAccent),
    Container(color: Colors.orange),
    Container(color: Colors.lightGreen),
    Container(color: Colors.black),
    Container(color: Colors.lime),
    Container(color: Colors.grey),
    Container(color: Colors.lightBlue),
    Container(color: Colors.red),
    Container(color: Colors.indigo),
    Container(color: Colors.pinkAccent),
  ];

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
    return Container(
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 10,
              childAspectRatio: 1.2),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          itemCount: _liles.length,
          //反弹效果
          physics: const BouncingScrollPhysics(),
          //夹住的效果
          // physics: const ClampingScrollPhysics(),
          //允许滚动
          // physics: const AlwaysScrollableScrollPhysics(),
          //禁止滚动
          // physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return _liles[index];
          }),
    );
  }
}

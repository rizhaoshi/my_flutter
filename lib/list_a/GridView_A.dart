import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GridView"),
        leading: const Icon(Icons.menu),
        actions: const [Icon(Icons.settings)],
        elevation: 0.0,
        //去掉阴影
        centerTitle: true,
      ),
      body: const MyGridView(),
    );
  }
}

class MyGridView extends StatefulWidget {
  const MyGridView({Key? key}) : super(key: key);

  @override
  State<MyGridView> createState() => _MyGridViewState();
}

class _MyGridViewState extends State<MyGridView>
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
      child:
          // GridView(
          //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //       crossAxisCount: 3,//指定列数
          //       mainAxisSpacing: 20,//主轴方向的间距
          //       crossAxisSpacing: 10,//交叉轴方向的间距
          //       childAspectRatio: 1.5,//子组件的宽高比
          //   ),
          //   children: [
          //     Container(color: Colors.blue),
          //     Container(color: Colors.amber),
          //     Container(color: Colors.cyan),
          //     Container(color: Colors.deepOrange),
          //     Container(color: Colors.grey),
          //     Container(color: Colors.lightBlue),
          //     Container(color: Colors.red),
          //     Container(color: Colors.indigo),
          //     Container(color: Colors.pinkAccent),
          //     Container(color: Colors.orange),
          //     Container(color: Colors.lightGreen),
          //     Container(color: Colors.black),
          //     Container(color: Colors.lime),
          //     Container(color: Colors.grey),
          //     Container(color: Colors.lightBlue),
          //     Container(color: Colors.red),
          //     Container(color: Colors.indigo),
          //     Container(color: Colors.pinkAccent),
          //   ],
          // ),
          GridView(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 150,
            mainAxisSpacing: 20,
            crossAxisSpacing: 10,
            childAspectRatio: 0.75),
        children: [
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
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SingleChildScrollView"),
        leading: const Icon(Icons.menu),
        actions: const [Icon(Icons.settings)],
        elevation: 0.0,
        //去掉阴影
        centerTitle: true,
      ),
      body: const MySingleChildScrollView(),
    );
  }
}

class MySingleChildScrollView extends StatefulWidget {
  const MySingleChildScrollView({Key? key}) : super(key: key);

  @override
  State<MySingleChildScrollView> createState() =>
      _MySingleChildScrollViewState();
}

class _MySingleChildScrollViewState extends State<MySingleChildScrollView>
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
    return Stack(
      children: [
        //水平方向滚动
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.all(10),
          reverse: true,
          child: Row(
            children: [
              OutlinedButton(onPressed: () {}, child: const Text("按钮一")),
              OutlinedButton(onPressed: () {}, child: const Text("按钮二")),
              OutlinedButton(onPressed: () {}, child: const Text("按钮三")),
              OutlinedButton(onPressed: () {}, child: const Text("按钮四")),
              OutlinedButton(onPressed: () {}, child: const Text("按钮五")),
              OutlinedButton(onPressed: () {}, child: const Text("按钮六")),
            ],
          ),
        ),
        //垂直方向滚动
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.all(10),
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: List.generate(
                20,
                (index) =>
                    OutlinedButton(onPressed: () {}, child: Text('按钮$index'))),
          ),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animation"),
        leading: const Icon(Icons.menu),
        actions: const [Icon(Icons.settings)],
        elevation: 0.0,
        //去掉阴影
        centerTitle: true,
      ),
      body: const MyAnimation(),
    );
  }
}

class MyAnimation extends StatefulWidget {
  const MyAnimation({Key? key}) : super(key: key);

  @override
  State<MyAnimation> createState() => _MyAnimationState();
}

class _MyAnimationState extends State<MyAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();
    //创建 AnimationController
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    //申明动画曲线
    animation = CurvedAnimation(parent: controller, curve: Curves.bounceIn);
    animation = Tween(begin: 50.0, end: 400.0).animate(controller);
    //监听动画
    animation.addListener(() {
      print(animation.value);
      setState(() {});
    });
    //执行动画
    // controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  controller.forward();
                },
                child: Text("放大")),
            ElevatedButton(
                onPressed: () {
                  controller.reverse();
                },
                child: Text("缩小")),
            ElevatedButton(
                onPressed: () {
                  animation.addStatusListener((status) {
                    if (status == AnimationStatus.completed) {
                      controller.reverse();
                    } else if (status == AnimationStatus.dismissed) {
                      controller.forward();
                    }
                  });
                  controller.forward();
                },
                child: Text("重复")),
            ElevatedButton(
                onPressed: () {
                  controller.stop();
                },
                child: Text("停止")),
            Icon(
              Icons.favorite,
              color: Colors.pink,
              size: animation.value,
            ),
            Opacity(
              opacity: controller.value,
              child: const Text(
                "Hello 小依",
                style: TextStyle(fontSize: 18, color: Colors.red),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }
}

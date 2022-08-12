import 'package:flutter/material.dart';
import 'dart:math';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("StaggerAnimation"),
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
  late CurvedAnimation animation;
  late Animation sizeAnimation;
  late Animation colorAnimation;
  late Animation rotationAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //创建 AnimationController
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    //创建动画
    animation = CurvedAnimation(parent: controller, curve: Interval(0, 0.5))
      ..addListener(() {
        setState(() {});
      });
    //让动画反复运行
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
    //其他动画
    sizeAnimation = Tween(begin: 0.0, end: 200.0).animate(animation);
    colorAnimation = ColorTween(begin: Colors.yellow, end: Colors.red)
        .animate(CurvedAnimation(
      parent: controller,
      curve: const Interval(0.5, 0.8, curve: Curves.bounceIn),
    ))
      ..addListener(() {
        setState(() {});
      });

    rotationAnimation = Tween(begin: 0.0, end: 2 * pi).animate(CurvedAnimation(
        parent: controller,
        curve: const Interval(0.8, 1.0, curve: Curves.easeIn)));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                controller.forward();
              },
              child: Text("重复")),
          ElevatedButton(
              onPressed: () {
                controller.stop();
              },
              child: Text("停止")),
          Opacity(opacity: controller.value,
            child: Transform.rotate(
              angle: rotationAnimation.value, child: Container(
              width: sizeAnimation.value,
              height: sizeAnimation.value,
              color: colorAnimation.value,
            ),),)
        ],
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

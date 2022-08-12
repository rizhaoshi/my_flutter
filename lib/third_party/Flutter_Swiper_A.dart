import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FlutterSwiper"),
        leading: const Icon(Icons.menu),
        actions: const [Icon(Icons.settings)],
        elevation: 0.0,
        //去掉阴影
        centerTitle: true,
      ),
      body: const MyFlutterSwiper(),
    );
  }
}

class MyFlutterSwiper extends StatefulWidget {
  const MyFlutterSwiper({Key? key}) : super(key: key);

  @override
  State<MyFlutterSwiper> createState() => _MyFlutterSwiperState();
}

class _MyFlutterSwiperState extends State<MyFlutterSwiper>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<String> imgs = [
    'images/img_mn_01.jpg',
    'images/img_mn_02.jpg',
    'images/img_mn_03.jpg',
    'images/img_mn_04.jpg'
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
    return ListView(children: [
      Container(
        height: 350,
        child: Swiper(
            itemCount: imgs.length,
            pagination: const SwiperPagination(),
            control: const SwiperControl(),
            itemBuilder: (context, index) {
              return Image.asset(imgs[index], fit: BoxFit.cover);
            }),
      ),
      Container(
        height: 350,
        child: Swiper(
            itemCount: imgs.length,
            viewportFraction: 0.75,
            scale: 0.75,
            itemBuilder: (context, index) {
              return Image.asset(imgs[index], fit: BoxFit.cover);
            }),
      ),
      Container(
        height: 350,
        child: Swiper(
            itemCount: imgs.length,
            itemWidth: 300,
            itemHeight: 400,
            layout: SwiperLayout.TINDER,
            itemBuilder: (context, index) {
              return Image.asset(imgs[index], fit: BoxFit.cover);
            }),
      ),
    ]);
  }
}

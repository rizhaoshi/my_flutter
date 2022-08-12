import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Navigation"),
        leading: const Icon(Icons.menu),
        actions: const [Icon(Icons.settings)],
        elevation: 0.0,
        //去掉阴影
        centerTitle: true,
      ),
      body: const MyNavigation(),
    );
  }
}

class MyNavigation extends StatelessWidget {
  const MyNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () async {
                // Get.to(Product(),
                //     fullscreenDialog: true,
                //     transition: Transition.upToDown,
                //     duration: Duration(milliseconds: 500),
                //     curve: Curves.easeInOut);
                // Get.to(() => ProductA(), arguments: {'title': "我是主页传过来的参数"});
                var data = await Get.to(() => ProductA(),
                    arguments: {'title': "我是主页传过来的参数"});
                print('我接收到了参数 $data');
              },
              child: Text('跳转到商品页')),
        ],
      ),
    );
  }
}

class Product extends StatelessWidget {
  const Product({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("商品页"),
        leading: const Icon(Icons.menu),
        actions: const [Icon(Icons.settings)],
        elevation: 0.0,
        //去掉阴影
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () => Navigator.pop(context), child: Text('返回'))
          ],
        ),
      ),
    );
  }
}

class ProductA extends StatelessWidget {
  const ProductA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)?.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        title: const Text("商品页"),
        leading: const Icon(Icons.menu),
        actions: const [Icon(Icons.settings)],
        elevation: 0.0,
        //去掉阴影
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Text('接受的参数是: ' + arguments['title']),
            ElevatedButton(
                onPressed: () {
                  Get.back(result: "我是首页,返回数据!");
                },
                child: Text('返回'))
          ],
        ),
      ),
    );
  }
}

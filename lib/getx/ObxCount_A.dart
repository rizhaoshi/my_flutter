import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ObxCount"),
        leading: const Icon(Icons.menu),
        actions: const [Icon(Icons.settings)],
        elevation: 0.0,
        //去掉阴影
        centerTitle: true,
      ),
      body: MyObxCount(),
    );
  }
}

class MyObxCount extends StatelessWidget {
  MyObxCount({Key? key}) : super(key: key);

  RxInt _num = RxInt(0);

  void _increment() {
    _num++;
  }

  void _decrement() {
    _num--;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ElevatedButton(onPressed: _decrement, child: const Text('-')),
          Padding(
              padding: const EdgeInsets.all(20),
              child: Obx(() => Text(
                    "$_num",
                    style: const TextStyle(fontSize: 20),
                  ))),
          ElevatedButton(onPressed: _increment, child: const Icon(Icons.add)),
        ],
      ),
    );
  }
}

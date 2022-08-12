import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dio"),
        leading: const Icon(Icons.menu),
        actions: const [Icon(Icons.settings)],
        elevation: 0.0,
        //去掉阴影
        centerTitle: true,
      ),
      body: const MyDio(),
    );
  }
}

class MyDio extends StatefulWidget {
  const MyDio({Key? key}) : super(key: key);

  @override
  State<MyDio> createState() => _MyDioState();
}

class _MyDioState extends State<MyDio> with SingleTickerProviderStateMixin {
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
    return Center(
      child: ElevatedButton(
        child: const Text('点击发送请求'),
        onPressed: () {
          getIpAddress();
        },
      ),
    );
  }

  void getIpAddress() async {
    try {
      const url = 'https://httpbin.org/ip';
      Response response = await Dio().get(url);
      String ip = response.data['origin'];
      print(ip);
    } catch (e) {
      print(e);
    }
  }
}

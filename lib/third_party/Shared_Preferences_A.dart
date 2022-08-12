import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SharedPreferences"),
        leading: const Icon(Icons.menu),
        actions: const [Icon(Icons.settings)],
        elevation: 0.0,
        //去掉阴影
        centerTitle: true,
      ),
      body: const MySharedPreferences(),
    );
  }
}

class MySharedPreferences extends StatefulWidget {
  const MySharedPreferences({Key? key}) : super(key: key);

  @override
  State<MySharedPreferences> createState() => _MySharedPreferencesState();
}

class _MySharedPreferencesState extends State<MySharedPreferences>
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
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(onPressed: _incrementCounter, child: const Text('递增')),
          ElevatedButton(onPressed: _decrementCounter, child: const Text('递减')),
          ElevatedButton(onPressed: _removeCounter, child: const Text('删除')),
          ElevatedButton(onPressed: _addMyContent, child: const Text('设置字符串')),
          ElevatedButton(onPressed: _getMyContent, child: const Text('获取字符串')),
          ElevatedButton(onPressed: _clearContent, child: const Text('清空')),
        ],
      ),
    );
  }

  _incrementCounter() async {
    //获取保存实例
    SharedPreferences sp = await SharedPreferences.getInstance();
    int counter = (sp.getInt("counter") ?? 0) + 1;
    print("Pressed $counter times.");
    await sp.setInt("counter", counter);
  }

  _decrementCounter() async {
    //获取保存实例
    SharedPreferences sp = await SharedPreferences.getInstance();
    int counter = (sp.getInt("counter") ?? 0);
    if (counter > 0) {
      counter--;
    }
    print("Pressed $counter times.");
    await sp.setInt("counter", counter);
  }

  _removeCounter() async {
    //获取保存实例
    SharedPreferences sp = await SharedPreferences.getInstance();
    await sp.remove("counter");
    int counter = (sp.getInt("counter") ?? 0) + 1;
    print("Pressed $counter times.");
  }

  _addMyContent() async {
    //获取保存实例
    SharedPreferences sp = await SharedPreferences.getInstance();
    await sp.setString("hi", "Hello Flutter");
    String content = sp.getString("hi") ?? "";
    print("设置的字符串是: $content ");
  }

  _getMyContent() async {
    //获取保存实例
    SharedPreferences sp = await SharedPreferences.getInstance();
    String content = sp.getString("hi") ?? "";
    print("获取的字符串是: $content ");
  }

  _clearContent() async {
    //获取保存实例
    SharedPreferences sp = await SharedPreferences.getInstance();
    await sp.clear();
  }
}

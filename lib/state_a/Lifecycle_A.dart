import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lifecycle"),
        leading: const Icon(Icons.menu),
        actions: const [Icon(Icons.settings)],
        elevation: 0.0,
        //去掉阴影
        centerTitle: true,
      ),
      body: const MyState(),
    );
  }
}

class MyState extends StatefulWidget {
  const MyState({Key? key}) : super(key: key);

  @override
  State<MyState> createState() => _MyStateState();
}

class _MyStateState extends State<MyState> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  int _num = 0;

  @override
  void initState() {
    super.initState();
    _num = 1;
    print("====init state====");
    // _controller = AnimationController(vsync: this);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("====didChangeDependencies====");
  }

  @override
  void didUpdateWidget(covariant MyState oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("====didUpdateWidget====");
  }

  @override
  void deactivate() {
    super.deactivate();
    print("====deactivate====");
  }


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
    print("====dispose====");
  }

  void _increment() {
    setState(() {
      print("====setState====");
      _num++;
    });
  }

  void _decrement() {
    setState(() {
      print("====setState====");
      
      _num--;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("====build====");
    return Center(
      child: Column(
        children: [
          ElevatedButton(onPressed: _decrement, child: const Text('-')),
          Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                "$_num",
                style: const TextStyle(fontSize: 20),
              )),
          ElevatedButton(onPressed: _increment, child: const Icon(Icons.add)),
        ],
      ),
    );
  }
}

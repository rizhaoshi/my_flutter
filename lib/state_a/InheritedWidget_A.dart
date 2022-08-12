import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("InheritedWidget"),
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

//数据共享组件
class MyStareDataWidget extends InheritedWidget {
  final int num;
  final Widget child;

  MyStareDataWidget({Key? key, required Widget this.child, required this.num})
      : super(key: key, child: child);

  static MyStareDataWidget of(BuildContext context) {
    final MyStareDataWidget? result =
        context.dependOnInheritedWidgetOfExactType<MyStareDataWidget>();
    assert(result != null, 'No MyStareDataWidget found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(MyStareDataWidget old) {
    return true;
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
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _increment() {
    setState(() {
      _num++;
    });
  }

  void _decrement() {
    setState(() {
      _num--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MyStareDataWidget(
      num: _num,
      child: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: _decrement, child: const Text('-')),
            Padding(padding: const EdgeInsets.all(20), child: MyCounter()),
            ElevatedButton(onPressed: _increment, child: const Icon(Icons.add)),
          ],
        ),
      ),
    );
  }
}

class MyCounter extends StatefulWidget {
  const MyCounter({Key? key}) : super(key: key);

  @override
  State<MyCounter> createState() => _MyCounterState();
}

class _MyCounterState extends State<MyCounter> {
  @override
  Widget build(BuildContext context) {
    return Text(MyStareDataWidget.of(context).num.toString());
  }
}

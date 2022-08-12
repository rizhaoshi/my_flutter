import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cupertino"),
        leading: const Icon(Icons.menu),
        actions: const [Icon(Icons.settings)],
        elevation: 0.0,
        //去掉阴影
        centerTitle: true,
      ),
      body: const MyBody(),
    );
  }
}

class MyBody extends StatefulWidget {
  const MyBody({Key? key}) : super(key: key);

  @override
  State<MyBody> createState() => _MyBodyState();
}

class _MyBodyState extends State<MyBody> with SingleTickerProviderStateMixin {
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
    Widget dialogBox;
    if (Platform.isAndroid) {
      dialogBox = const MyMaterial();
    } else if (Platform.isIOS) {
      dialogBox = const MyCupertino();
    }
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          //android风格的组件
          Text("Material--android 风格的弹窗"),
          MyMaterial(),
          //ios 风格的组件
          Text("Cupertino--ios 风格的弹窗"),
          MyCupertino(),
        ],
      ),
    );
  }
}

class MyMaterial extends StatefulWidget {
  const MyMaterial({Key? key}) : super(key: key);

  @override
  State<MyMaterial> createState() => _MyMaterialState();
}

class _MyMaterialState extends State<MyMaterial>
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
      child: AlertDialog(
        title: const Text('提示'),
        content: const Text("确认删除吗?"),
        actions: [
          TextButton(
              onPressed: () {
                print("取消删除!");
              },
              child: Text('取消')),
          TextButton(
              onPressed: () {
                print("确认删除!");
              },
              child: Text('确认')),
        ],
      ),
    );
  }
}

class MyCupertino extends StatefulWidget {
  const MyCupertino({Key? key}) : super(key: key);

  @override
  State<MyCupertino> createState() => _MyCupertinoState();
}

class _MyCupertinoState extends State<MyCupertino>
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
      child: CupertinoAlertDialog(
        title: const Text('提示'),
        content: const Text("确认删除吗?"),
        actions: [
          CupertinoDialogAction(
              onPressed: () {
                print("取消删除!");
              },
              child: Text('取消')),
          CupertinoDialogAction(
              onPressed: () {
                print("确认删除!");
              },
              child: Text('确认')),
        ],
      ),
    );
  }
}

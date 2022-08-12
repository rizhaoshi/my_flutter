import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wrap"),
        leading: const Icon(Icons.menu),
        actions: const [Icon(Icons.settings)],
        elevation: 0.0,
        //去掉阴影
        centerTitle: true,
      ),
      body: MyWrap(),
    );
  }
}

class MyWrap extends StatelessWidget {
  final List<String> _list = ['曹超', '司马懿', '曹仁', '曹洪', '张辽', '许诸'];

  List<Widget> _weiGou() {
    return _list
        .map((item) => Chip(
              avatar: const CircleAvatar(
                backgroundColor: Colors.red,
                child: Text("魏"),
              ),
              label: Text(item),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Wrap(
          //水平方向的间距
          spacing: 20.0,
          //锤直方向的间距
          runSpacing: 30.0,
          //主轴方向对齐方式
          alignment: WrapAlignment.spaceAround,
          //交叉方向对齐方式
          runAlignment: WrapAlignment.spaceAround,
          children: _weiGou(),
        ),
        Wrap(
          children: const [
            Chip(
              avatar: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text("蜀"),
              ),
              label: Text("刘黄书"),
            ),
            Chip(
              avatar: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text("蜀"),
              ),
              label: Text("关羽"),
            ),
            Chip(
              avatar: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text("蜀"),
              ),
              label: Text("张飞"),
            ),
            Chip(
              avatar: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text("蜀"),
              ),
              label: Text("赵云"),
            ),
            Chip(
              avatar: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text("蜀"),
              ),
              label: Text("诸葛亮"),
            ),
            Chip(
              avatar: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text("蜀"),
              ),
              label: Text("黄忠"),
            ),
          ],
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dialog"),
        leading: const Icon(Icons.menu),
        actions: const [Icon(Icons.settings)],
        elevation: 0.0,
        //去掉阴影
        centerTitle: true,
      ),
      body: const MyDialog(),
    );
  }
}

class MyDialog extends StatelessWidget {
  const MyDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                Get.defaultDialog(
                  title: "是否上车啊啊啊?",
                  titleStyle: TextStyle(color: Colors.yellow, fontSize: 18),
                  middleText: "大家好,上小黄车了!",
                  middleTextStyle: TextStyle(color: Colors.red, fontSize: 16),
                  titlePadding: EdgeInsets.all(20),
                  //自定义内容区域
                  // content: Row(
                  //   children: [
                  //     CircularProgressIndicator(),
                  //     SizedBox(
                  //       width: 10,
                  //     ),
                  //     Expanded(child: Text('大家好,上小黄车了!'))
                  //   ],
                  // ),
                  // contentPadding: EdgeInsets.all(10),
                  // 背景色 圆角
                  // backgroundColor: Colors.pink,
                  // radius: 30,
                  //按钮
                  // textConfirm: "确认",
                  // confirmTextColor: Colors.black,
                  // textCancel: '取消',
                  // cancelTextColor: Colors.yellow,
                  // onConfirm: () {
                  //   print('====确认====');
                  // },
                  // onCancel: () {
                  //   print('====取消====');
                  // },
                  // buttonColor: Colors.green[100],
                  // confirm: TextButton(onPressed: () {}, child: Text('确认')),
                  // cancel: TextButton(onPressed: () {}, child: Text('取消')),
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text("上车"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text("下车"),
                    ),
                  ],
                  // barrierDismissible: false,
                  onWillPop: () async {
                    print("====关闭====");
                    return true;
                  },
                );
              },
              child: Text('Dialog')),
        ],
      ),
    );
  }
}

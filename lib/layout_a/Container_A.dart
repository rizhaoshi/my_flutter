import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Container"),
        leading: Icon(Icons.menu),
        actions: [Icon(Icons.settings)],
        elevation: 0.0,
        //去掉阴影
        centerTitle: true,
      ),
      body: MyContainer(),
    );
  }
}

class MyContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        "2021 全新 Flutter 教程。全平台开发框架。用 Flutter 开发的应用，可以跑在 Android、iOS、Web、Windows、Mac、Linux、穿戴设备及车载系统上。",
        style: TextStyle(fontSize: 20, color: Colors.blue),
      ),
      width: double.infinity,
      height: 300,
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 20.0),
      alignment: Alignment.center,
      // transform: Matrix4.translationValues(0, 100, 100),//平移
      // transform: Matrix4.rotationZ(-0.2),//旋转
      transform: Matrix4.skewX(-0.2),//斜切
      decoration: BoxDecoration(
          // border: Border(
          //   top: BorderSide(width: 5.0, color: Colors.red),
          //   bottom: BorderSide(width: 5.0, color: Colors.red),
          //   right: BorderSide(width: 5.0, color: Colors.red),
          //   left: BorderSide(width: 5.0, color: Colors.red),
          // ),
          border: Border.all(width: 4.0, color: Colors.red),
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.lightGreenAccent[200], //设置渐变后，背景失效
          gradient: LinearGradient(colors: [Colors.lightBlue, Colors.white12])),
    );
  }
}

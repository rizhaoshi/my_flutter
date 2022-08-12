import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text"),
        leading: Icon(Icons.menu),
        actions: [Icon(Icons.settings)],
        elevation: 0.0,
        //去掉阴影
        centerTitle: true,
      ),
      body: MyText(),
    );
  }
}

class MyText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "2021 全新 Flutter 教程。全平台开发框架。用 Flutter 开发的应用，可以跑在 Android、iOS、Web、Windows、Mac、Linux、穿戴设备及车载系统上。",
          textDirection: TextDirection.ltr,
          style: TextStyle(
            fontSize: 30,
            color: Colors.blue,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.italic,
            decoration: TextDecoration.lineThrough,
            decorationColor: Colors.red,
          ),
          textAlign: TextAlign.left,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textScaleFactor: 1.2,
        ),
        RichText(
          text: const TextSpan(
              text: "Fltter",
              style: TextStyle(
                fontSize: 20,
                color: Colors.blue,
              ),
              children: [
                TextSpan(
                  text: "Hello",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.red,
                  ),
                ),
                TextSpan(
                  text: "大家好啊",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.blue,
                  ),
                ),
              ]),
        )
      ],
    );
  }
}

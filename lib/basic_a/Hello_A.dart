import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HelloFlutter"),
        leading: Icon(Icons.menu),
        actions: [Icon(Icons.settings)],
        elevation: 0.0,
        //去掉阴影
        centerTitle: true,
      ),
      body: HelloFlutter(),
    );
  }
}

class HelloFlutter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          "Hello Futller",
          textDirection: TextDirection.ltr,
        ),
      ),
    );
  }
}

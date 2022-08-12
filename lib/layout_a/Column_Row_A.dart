import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ColumnRow"),
        leading: Icon(Icons.menu),
        actions: [Icon(Icons.settings)],
        elevation: 0.0,
        //去掉阴影
        centerTitle: true,
      ),
      body: MyColumnRow(),
    );
  }
}

class MyColumnRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      width: double.infinity,
      child: Column(
        // 主轴的对齐方式
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.access_alarm_outlined,
            size: 50,
          ),
          Icon(
            Icons.accessible_forward_rounded,
            size: 50,
          ),
          Icon(
            Icons.settings,
            size: 50,
          ),
          Icon(
            Icons.add_box,
            size: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                Icons.access_alarm_outlined,
                size: 50,
              ),
              Icon(
                Icons.accessible_forward_rounded,
                size: 50,
              ),
              Icon(
                Icons.settings,
                size: 50,
              ),
              Icon(
                Icons.add_box,
                size: 50,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

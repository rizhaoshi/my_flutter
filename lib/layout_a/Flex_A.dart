import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flex"),
        leading: Icon(Icons.menu),
        actions: [Icon(Icons.settings)],
        elevation: 0.0,
        //去掉阴影
        centerTitle: true,
      ),
      body: MyFlex(),
    );
  }
}

class MyFlex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              color: Colors.lightBlue,
              height: 50,
              width: 100,
            ),
            Expanded(
              child: Container(
                color: Colors.red,
                height: 50,
              ),
            )
          ],
        ),
        Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          textDirection: TextDirection.rtl,
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
        Flex(
          direction: Axis.horizontal,
          children: [
            Expanded(
              child: Container(
                color: Colors.tealAccent,
                height: 50,
              ),
              flex: 1,
            ),
            Expanded(
              child: Container(
                color: Colors.amberAccent,
                height: 50,
              ),
              flex: 2,
            )
          ],
        ),
        Container(
          height: 200,
          margin: EdgeInsets.all(20),
          child: Flex(
            direction: Axis.vertical,
            verticalDirection: VerticalDirection.up,
            children: [
              Expanded(
                child: Container(
                  color: Colors.tealAccent,
                  height: 50,
                ),
                flex: 1,
              ),
              Spacer(flex: 1),
              Expanded(
                child: Container(
                  color: Colors.amberAccent,
                  height: 50,
                ),
                flex: 2,
              )
            ],
          ),
        )
      ],
    );
  }
}

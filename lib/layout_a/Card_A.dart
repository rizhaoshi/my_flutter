import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Card"),
        leading: const Icon(Icons.menu),
        actions: const [Icon(Icons.settings)],
        elevation: 0.0,
        //去掉阴影
        centerTitle: true,
      ),
      body: const MyCard(),
    );
  }
}

class MyCard extends StatefulWidget {
  const MyCard({Key? key}) : super(key: key);

  @override
  State<MyCard> createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> with SingleTickerProviderStateMixin {
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
    return Column(
      children: [
        Card(
          margin: const EdgeInsets.all(20),
          color: Colors.purpleAccent[200],
          shadowColor: Colors.yellow,
          elevation: 10,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: const BorderSide(color: Colors.yellow, width: 2)),
          child: Column(
            children: const [
              ListTile(
                leading: Icon(
                  Icons.supervised_user_circle_rounded,
                  size: 50,
                ),
                title: Text(
                  "li shi",
                  style: TextStyle(fontSize: 20),
                ),
                subtitle: Text(
                  "ceo",
                  style: TextStyle(fontSize: 30),
                ),
              ),
              Divider(),
              ListTile(
                title: Text(
                  "电话: 18612344558",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              ListTile(
                title: Text(
                  "地址: xxxxxxxxxxxxx",
                  style: TextStyle(fontSize: 20),
                ),
              )
            ],
          ),
        ),
        Card(
          margin: const EdgeInsets.all(20),
          child: Column(
            children: const [
              ListTile(
                leading: Icon(
                  Icons.supervised_user_circle_rounded,
                  size: 50,
                ),
                title: Text(
                  "wang wu",
                  style: TextStyle(fontSize: 20),
                ),
                subtitle: Text(
                  "zjl",
                  style: TextStyle(fontSize: 30),
                ),
              ),
              Divider(),
              ListTile(
                title: Text(
                  "电话: 18612344558",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              ListTile(
                title: Text(
                  "地址: xxxxxxxxxxxxx",
                  style: TextStyle(fontSize: 20),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

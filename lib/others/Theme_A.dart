import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Theme"),
        leading: const Icon(Icons.menu),
        actions: const [Icon(Icons.settings)],
        elevation: 0.0,
        //去掉阴影
        centerTitle: true,
      ),
      body: const MyTheme(),
    );
  }
}

class MyTheme extends StatelessWidget {
  const MyTheme({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            "Theme Example",
            style: Theme.of(context).textTheme.subtitle1,
          ),
          ElevatedButton(
              onPressed: () {
              },
              child: Text('Snackbar')),
          RaisedButton(
              onPressed: () {
              },
              child: Text('Dialog')),
          Icon(Icons.percent),
          Icon(Icons.access_alarm),
          Icon(Icons.ac_unit_rounded,
              // color: Colors.red,
              color: Theme.of(context).accentColor),
          Theme(
              data: ThemeData(
                  iconTheme: IconThemeData(
                color: Colors.blue[100],
                size: 30,
              )),
              child: Icon(Icons.percent)),
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
      ),
    );
  }
}

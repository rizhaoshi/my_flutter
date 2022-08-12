import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Switch"),
        leading: const Icon(Icons.menu),
        actions: const [Icon(Icons.settings)],
        elevation: 0.0,
        //去掉阴影
        centerTitle: true,
      ),
      body: const MySwitch(),
    );
  }
}

class MySwitch extends StatefulWidget {
  const MySwitch({Key? key}) : super(key: key);

  @override
  State<MySwitch> createState() => _MySwitchState();
}

class _MySwitchState extends State<MySwitch> {
  bool _switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          ListTile(
            leading: Switch(
              value: _switchValue,
              onChanged: (bool val) {
                setState(() {
                  _switchValue = val;
                });
              },
              activeColor: Colors.orange,
              activeTrackColor: Colors.pink,
              inactiveTrackColor: Colors.grey,
              inactiveThumbColor: Colors.blue[100],
            ),
            title: Text('当前的状态是: ${_switchValue == true ? '选中' : '未选中'}'),
          ),
          ListTile(
            leading: CupertinoSwitch(
              value: _switchValue,
              onChanged: (bool val) {
                setState(() {
                  _switchValue = val;
                });
              },
              activeColor: Colors.red,
              trackColor: Colors.yellow,
            ),
            title: Text('ios 风格的 Switch'),
          )
        ],
      ),
    );
  }
}

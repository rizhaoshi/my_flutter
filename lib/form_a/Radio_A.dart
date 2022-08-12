import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Radio"),
        leading: const Icon(Icons.menu),
        actions: const [Icon(Icons.settings)],
        elevation: 0.0,
        //去掉阴影
        centerTitle: true,
      ),
      body: const MyRadio(),
    );
  }
}

class MyRadio extends StatefulWidget {
  const MyRadio({Key? key}) : super(key: key);

  @override
  State<MyRadio> createState() => _MyRadioState();
}

class _MyRadioState extends State<MyRadio> {
  int gender = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('男'),
              Radio(
                  value: 1,
                  groupValue: this.gender,
                  onChanged: (values) {
                    setState(() {
                      this.gender = values as int;
                    });
                  }),
              Text('女'),
              Radio(
                  value: 2,
                  groupValue: this.gender,
                  onChanged: (value) {
                    setState(() {
                      this.gender = value as int;
                    });
                  }),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(this.gender == 1 ? "男" : '女'),
            ],
          ),
          RadioListTile(
            value: 1,
            groupValue: this.gender,
            onChanged: (value) {
              setState(() {
                this.gender = value as int;
              });
            },
            title: Text('男性'),
            subtitle: Text('胡子'),
            secondary: Icon(Icons.person),
            selected: this.gender==1,
            selectedTileColor: Colors.green[100],
          ),
          RadioListTile(
            value: 2,
            groupValue: this.gender,
            onChanged: (value) {
              setState(() {
                this.gender = value as int;
              });
            },
            title: Text('女性'),
            subtitle: Text('没有胡子'),
            secondary: Icon(Icons.person),
            selected: this.gender==2,
            selectedTileColor: Colors.green[100],
          ),
        ],
      ),
    );
  }
}

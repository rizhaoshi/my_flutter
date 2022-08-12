import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkbox"),
        leading: const Icon(Icons.menu),
        actions: const [Icon(Icons.settings)],
        elevation: 0.0,
        //去掉阴影
        centerTitle: true,
      ),
      body: const MyCheckbox(),
    );
  }
}

class MyCheckbox extends StatefulWidget {
  const MyCheckbox({Key? key}) : super(key: key);

  @override
  State<MyCheckbox> createState() => _MyCheckboxState();
}

class _MyCheckboxState extends State<MyCheckbox> {
  bool _male = true;
  bool _female = false;
  bool _transgender = false;

  bool _value1 = true;
  bool _value2 = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Checkbox(
            value: this._male,
            onChanged: (val) {
              setState(() {
                this._male = val as bool;
              });
            },
          ),
          title: const Text('男'),
        ),
        ListTile(
          leading: Checkbox(
            value: this._female,
            onChanged: (val) {
              setState(() {
                this._female = val as bool;
              });
            },
          ),
          title: const Text('女'),
        ),
        ListTile(
          leading: Checkbox(
            value: this._transgender,
            onChanged: (val) {
              setState(() {
                this._transgender = val as bool;
              });
            },
            activeColor: Colors.pink,
            checkColor: Colors.yellow,
          ),
          title: const Text('人妖'),
        ),
        CheckboxListTile(
          value: _value1,
          onChanged: (val) {
            setState(() {
              this._value1 = val as bool;
            });
          },
          secondary: const Icon(
            Icons.settings,
            size: 40,
          ),
          title: Text('1点钟 叫我起床'),
          subtitle: Text('太困了,起不来'),
          activeColor: Colors.green,
          checkColor: Colors.green,
          selected: this._value1,
        ),
        CheckboxListTile(
          value: _value2,
          onChanged: (val) {
            setState(() {
              this._value2 = val as bool;
            });
          },
          secondary: const Icon(
            Icons.settings,
            size: 40,
          ),
          title: Text('2点钟 叫我起床'),
          subtitle: Text('这还差不多'),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TextField"),
        leading: const Icon(Icons.menu),
        actions: const [Icon(Icons.settings)],
        elevation: 0.0,
        //去掉阴影
        centerTitle: true,
      ),
      body: const MyTextField(),
    );
  }
}

class MyTextField extends StatefulWidget {
  const MyTextField({Key? key}) : super(key: key);

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  late String phone;
  late String password;
  late String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        children: [
          TextField(
            autocorrect: true,
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.mobile_screen_share),
                //获取焦点时边框样式
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.green,
                )),
                //,默认边框样式
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.yellow,
                )),
                hintStyle: TextStyle(color: Colors.green, fontSize: 15),
                labelText: '手机号',
                hintText: "请输入手机号"),
            maxLength: 11,
            onChanged: (value) {
              setState(() {
                phone = value;
              });
            },
          ),
          TextField(
            obscureText: true,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.code_outlined),
                //获取焦点时边框样式
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.green,
                )),
                //,默认边框样式
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.yellow,
                )),
                hintStyle: TextStyle(color: Colors.green, fontSize: 15),
                labelText: '密码',
                hintText: "请输入手密码"),
            onChanged: (value) {
              setState(() {
                password = value;
              });
            },
          ),
          TextField(
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.propane),
                //获取焦点时边框样式
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.green,
                )),
                //,默认边框样式
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.yellow,
                )),
                hintStyle: TextStyle(color: Colors.green, fontSize: 15),
                labelText: '简介',
                hintText: "请介绍一下自己"),
            maxLines: 5,
            onChanged: (value) {
              setState(() {
                description = value;
              });
            },
          ),
          Container(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () {
                  _register();
                },
                child: Text('提交')),
          ),
        ],
      ),
    );
  }

  void _register() {
    print(phone);
    print(password);
    print(description);
  }
}

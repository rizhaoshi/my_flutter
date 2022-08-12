import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SnackBar"),
        leading: const Icon(Icons.menu),
        actions: const [Icon(Icons.settings)],
        elevation: 0.0,
        //去掉阴影
        centerTitle: true,
      ),
      body: const MySnackBar(),
    );
  }
}

class MySnackBar extends StatelessWidget {
  const MySnackBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                Get.snackbar(
                  "Snackbar 标题", "欢迎使用Snackbar",
                  colorText: Colors.blue,
                  duration: Duration(milliseconds: 3000),
                  instantInit: false,
                  // snackPosition: SnackPosition.BOTTOM,
                  // titleText: Text("自定义组件,维术"),
                  // messageText: Text("自定义组件,维术好帅!"),
                  icon: Icon(Icons.ac_unit),
                  shouldIconPulse: true,
                  maxWidth: 400,
                  // padding: EdgeInsets.all(20),
                  margin: EdgeInsets.all(10),
                  //轮廓
                  // borderRadius: 10,
                  // borderColor: Colors.pink,
                  // borderWidth: 2,
                  // backgroundColor: Colors.orangeAccent.withOpacity(0.2),
                  // leftBarIndicatorColor: Colors.blue,
                  // boxShadows: [
                  //   BoxShadow(
                  //       color: Colors.red,
                  //       offset: Offset(10, 20),
                  //       spreadRadius: 20,
                  //       blurRadius: 10)
                  // ],
                  //背景线性变
                  // backgroundGradient: LinearGradient(colors: [
                  //   Colors.red,
                  //   Colors.yellow,
                  // ]),
                  // mainButton: TextButton(
                  //     onPressed: () {},
                  //     child: Text(
                  //       '确认',
                  //       style: TextStyle(color: Colors.red),
                  //     )),
                  // onTap: (a){
                  //   print(a);
                  //   print('点击了');
                  // },
                  // isDismissible: true,
                  // showProgressIndicator: true,
                  // progressIndicatorBackgroundColor: Colors.red,
                  // progressIndicatorValueColor:
                  //     AlwaysStoppedAnimation<Color>(Colors.pink),
                  // dismissDirection: DismissDirection.horizontal,
                  //动画
                  // forwardAnimationCurve: Curves.bounceInOut,
                  // reverseAnimationCurve: Curves.easeInOutBack,
                  // animationDuration: Duration(milliseconds: 2000),
                  // barBlur: 99
                  // overlayBlur: 50,
                  // overlayColor: Colors.purple.withOpacity(0.2),
                  // snackbarStatus: ((status) {
                  //   print(status);
                  // }),
                  // userInputForm: Form(
                  //   child: Row(
                  //     children: [
                  //       Expanded(child: TextField()),
                  //     ],
                  //   ),
                  // ),
                );
              },
              child: Text('Snackbar')),
        ],
      ),
    );
  }
}

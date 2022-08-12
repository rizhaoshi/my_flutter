import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../others/CustomTheme_A.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BottomSheet"),
        leading: const Icon(Icons.menu),
        actions: const [Icon(Icons.settings)],
        elevation: 0.0,
        //去掉阴影
        centerTitle: true,
      ),
      body: const MyBottomSheet(),
    );
  }
}

class MyBottomSheet extends StatelessWidget {
  const MyBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                Get.bottomSheet(
                    Container(
                      // height: 1000,
                      child: Wrap(
                        children: [
                          ListTile(
                            leading: Icon(Icons.wb_sunny_outlined),
                            title: Text("白天模式"),
                            onTap: () {
                              Get.changeTheme(CustomTheme.lightTheme);
                            },
                          ),
                          ListTile(
                            leading: Icon(Icons.wb_sunny),
                            title: Text("黑夜模式"),
                            onTap: () {
                              Get.changeTheme(ThemeData.dark());
                            },
                          )
                        ],
                      ),
                    ),
                    // backgroundColor: Colors.purple.shade100,
                    // barrierColor: Colors.yellow,
                    // elevation: 2,
                    // isDismissible: false,
                    // enableDrag: true,
                    // isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(
                          color: Colors.white,
                          style: BorderStyle.solid,
                          width: 2.0,
                        )),
                    enterBottomSheetDuration: Duration(milliseconds: 2000),
                    exitBottomSheetDuration: Duration(milliseconds: 2000));
              },
              child: Text('BottomSheet')),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:my_flutter_a/network/token_model.dart';
import 'package:my_flutter_a/storage/storage_constant.dart';
import 'package:my_flutter_a/storage/storage_util.dart';
import 'default_service.dart';

class DioHome extends StatelessWidget {
  const DioHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dio_Http"),
        leading: const Icon(Icons.menu),
        actions: const [Icon(Icons.settings)],
        elevation: 0.0,
        //去掉阴影
        centerTitle: true,
      ),
      body: const MyButton(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        backgroundColor: Colors.green,
        elevation: 0,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class MyButton extends StatefulWidget {
  const MyButton({Key? key}) : super(key: key);

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    StorageUtil.instance.get(StorageConstant.DEVICE_TOKEN).then((res) {
      print("=====initState=====$res");
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Wrap(
        children: [
          ElevatedButton(
              onPressed: () {
                var param = {
                  "common": {"accessToken": "", "deviceToken": "", "partner": "android", "partnerChannel": "huawei", "partnerVersion": "10.0.2"},
                  "deviceId": "id600ee539-1fc9-4172-9518-1115e0e77bfc",
                };
                var resource = DefaultService.getGuestId(param);
                resource.then((value) {
                  if (value.isSuccess()) {
                    //TODO 处理其他业务流程
                    TokenModel data = TokenModel.fromJson(value.data);
                    StorageUtil.instance.set(StorageConstant.DEVICE_TOKEN, data.deviceToken);
                    print('=====请求成功结果：=====${data.deviceToken}');
                  } else {
                    print('======请求错误：======${value.message}');
                  }
                });
              },
              onLongPress: () {
                print('长按 ElevatedButton');
              },
              child: const Text('发送请求')),
        ],
      ),
    );
  }
}

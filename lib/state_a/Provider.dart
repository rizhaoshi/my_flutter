import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //注册数据模型
    return ChangeNotifierProvider(
      create: (BuildContext context) => LikeModel(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Provider"),
          leading: const Icon(Icons.menu),
          actions: const [Icon(Icons.settings)],
          elevation: 0.0,
          //去掉阴影
          centerTitle: true,
        ),
        body: const MyHomePage(),
      ),
    );
  }
}

//创建数据模型
class LikeModel extends ChangeNotifier {
  int _counter = 0;

  int get counter => _counter;

  incrementCounter() {
    _counter++;

    notifyListeners();
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text('${context.watch<LikeModel>().counter}'),
          TextButton(
              onPressed: Provider.of<LikeModel>(context).incrementCounter,
              child: const Icon(Icons.thumb_up))
        ],
      ),
    );
  }
}

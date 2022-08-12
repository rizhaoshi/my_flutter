import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Button"),
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

class _MyButtonState extends State<MyButton>
    with SingleTickerProviderStateMixin {
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
    return Container(
      padding: const EdgeInsets.all(10),
      child: Wrap(
        children: [
          TextButton(
              onPressed: () {
                print('点击 TextButton');
              },
              onLongPress: () {
                print('长按 TextButton');
              },
              child: const Text('TextButton')),
          ElevatedButton(
              onPressed: () {
                print('点击 ElevatedButton');
              },
              onLongPress: () {
                print('长按 ElevatedButton');
              },
              child: const Text('ElevatedButton')),
          OutlinedButton(
              onPressed: () {
                print('点击 OutlinedButton');
              },
              onLongPress: () {
                print('长按 OutlinedButton');
              },
              child: const Text('OutlinedButton')),
          OutlinedButton(
            onPressed: () {
              print('点击 OutlinedButton');
            },
            onLongPress: () {
              print('长按 OutlinedButton');
            },
            style: ButtonStyle(
                textStyle:
                    MaterialStateProperty.all(const TextStyle(fontSize: 30)),
                foregroundColor: MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.pressed)) {
                    return Colors.red;
                  }
                  return Colors.blue;
                }),
                backgroundColor: MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.pressed)) {
                    return Colors.yellow;
                  }
                  return Colors.white;
                }),
                shadowColor: MaterialStateProperty.all(Colors.yellow),
                elevation: MaterialStateProperty.all(5),
                side: MaterialStateProperty.all(const BorderSide(
                  color: Colors.green,
                  width: 2,
                )),
                //按钮形状
                shape: MaterialStateProperty.all(const StadiumBorder(
                    side: BorderSide(
                  color: Colors.green,
                  width: 2,
                ))),
                //设置按钮大小
                minimumSize: MaterialStateProperty.all(const Size(150, 60)),
                //设置水波纹的颜色
                overlayColor: MaterialStateProperty.all(Colors.purple)),
            child: const Text('轮廓按钮'),
          ),
          OutlinedButtonTheme(
              data: OutlinedButtonThemeData(
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.purple),
                ),
              ),
              child: OutlinedButton(
                  onPressed: () {
                    print('点击 OutlinedButton');
                  },
                  onLongPress: () {
                    print('长按 OutlinedButton');
                  },
                  style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(Colors.blue),
                  ),
                  child: const Text('OutlinedButton'))),
          IconButton(
            onPressed: () {
              print('点击 IconButton');
            },
            icon: const Icon(Icons.add_alarm_rounded),
            color: Colors.red,
            splashColor: Colors.lightBlue,
            highlightColor: Colors.purple,
            tooltip: "怎么了!",
          ),
          TextButton.icon(
              onPressed: () {
                print('点击 TextButton.icon');
              },
              icon: const Icon(Icons.add_circle),
              label: const Text('文本按钮')),
          ElevatedButton.icon(
              onPressed: () {
                print('点击 ElevatedButton.icon');
              },
              icon: const Icon(Icons.add_circle),
              label: const Text('凸起按钮')),
          OutlinedButton.icon(
              onPressed: () {
                print('点击 OutlinedButton.icon');
              },
              icon: const Icon(Icons.add_circle),
              label: const Text('轮廓按钮')),
          Container(
            color: Colors.pinkAccent[100],
            width: double.infinity,
            child: ButtonBar(
              children: [
                ElevatedButton(onPressed: () {}, child: const Text('按钮一')),
                ElevatedButton(onPressed: () {}, child: const Text('按钮二')),
                ElevatedButton(onPressed: () {}, child: const Text('按钮三')),
                ElevatedButton(onPressed: () {}, child: const Text('按钮四')),
                ElevatedButton(onPressed: () {}, child: const Text('按钮五'))
              ],
            ),
          ),
          const BackButton(
            color: Colors.red,
          ),
          const CloseButton(
            color: Colors.red,
          )
        ],
      ),
    );
  }
}

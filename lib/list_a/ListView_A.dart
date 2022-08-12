import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ListView"),
        leading: const Icon(Icons.menu),
        actions: const [Icon(Icons.settings)],
        elevation: 0.0,
        //去掉阴影
        centerTitle: true,
      ),
      body: const MyListView(),
    );
  }
}

class MyListView extends StatefulWidget {
  const MyListView({Key? key}) : super(key: key);

  @override
  State<MyListView> createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView>
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
    return SingleChildScrollView(
      child: Column(
        children: const [
          ListViewBasic(),
          ListViewHorizontal(),
          MyListViewBuilder(),
          MyListViewSeperated(),
        ],
      ),
    );
  }
}

class ListViewBasic extends StatefulWidget {
  const ListViewBasic({Key? key}) : super(key: key);

  @override
  State<ListViewBasic> createState() => _ListViewBasicState();
}

class _ListViewBasicState extends State<ListViewBasic>
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
      height: 200,
      child: ListView(
        children: const [
          ListTile(
            leading: Icon(
              Icons.access_alarm,
              size: 30,
            ),
            title: Text("access_alarm"),
            subtitle: Text("子标题"),
            trailing: Icon(Icons.keyboard_arrow_right),
          ),
          ListTile(
            leading: Icon(
              Icons.add_alarm,
              size: 30,
            ),
            selected: true,
            title: Text("access_alarm"),
            subtitle: Text("子标题"),
            trailing: Icon(Icons.keyboard_arrow_right),
            selectedTileColor: Colors.greenAccent,
          ),
          ListTile(
            leading: Icon(
              Icons.baby_changing_station,
              size: 30,
            ),
            title: Text("access_alarm"),
            subtitle: Text("子标题"),
            trailing: Icon(Icons.keyboard_arrow_right),
          ),
          ListTile(
            leading: Icon(
              Icons.cabin_rounded,
              size: 30,
            ),
            title: Text("access_alarm"),
            subtitle: Text("子标题"),
            trailing: Icon(Icons.keyboard_arrow_right),
          ),
        ],
      ),
    );
  }
}

class ListViewHorizontal extends StatefulWidget {
  const ListViewHorizontal({Key? key}) : super(key: key);

  @override
  State<ListViewHorizontal> createState() => _ListViewHorizontalState();
}

class _ListViewHorizontalState extends State<ListViewHorizontal>
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
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            width: 160,
            color: Colors.amber,
          ),
          Container(
            width: 150,
            color: Colors.blue,
          ),
          Container(
            width: 160,
            color: Colors.grey,
          ),
          Container(
            width: 180,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}

class MyListViewBuilder extends StatefulWidget {
  const MyListViewBuilder({Key? key}) : super(key: key);

  @override
  State<MyListViewBuilder> createState() => _MyListViewBuilderState();
}

class _MyListViewBuilderState extends State<MyListViewBuilder>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<Widget> users = List<Widget>.generate(20,
          (index) =>
          OutlinedButton(onPressed: () {}, child: Text('姓名 $index')));

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
      height: 200,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return users[index];
        },
        padding: const EdgeInsets.all(10),
        itemCount: users.length,
        itemExtent: 40,
      ),
    );
  }
}

class MyListViewSeperated extends StatefulWidget {
  const MyListViewSeperated({Key? key}) : super(key: key);

  @override
  State<MyListViewSeperated> createState() => _MyListViewSeperatedState();
}

class _MyListViewSeperatedState extends State<MyListViewSeperated>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<Widget> products = List<Widget>.generate(
      20,
          (index) =>
          ListTile(
            title: Text("lzgy_ $index"),
            leading: Image.asset('images/icon_lzgy.jpg'),
            subtitle: const Text("子标题"),
            trailing: const Icon(Icons.keyboard_arrow_right),
          ));

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
    Widget dividerOdd = const Divider(
      color: Colors.blue,
      thickness: 1,
    );
    Widget dividerEven = const Divider(
      color: Colors.red,
      thickness: 1,
    );
    return Column(
      children: [
        const ListTile(
          title: Text('商品列表'),
        ),
        Container(
          height: 200,
          child: ListView.separated(
              itemBuilder: (context, index) {
                return products[index];
              },
              separatorBuilder: (context, index) {
                return index % 2 == 0 ? dividerEven : dividerOdd;
              },
              itemCount: products.length),
        ),
      ],
    );
  }
}

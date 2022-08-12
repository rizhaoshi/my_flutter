import 'package:flutter/material.dart';

class HomeState extends StatefulWidget {
  const HomeState({Key? key}) : super(key: key);

  @override
  State<HomeState> createState() => _HomeStateState();
}

class _HomeStateState extends State<HomeState> {
  final List<BottomNavigationBarItem> bottomNavItems = [
    BottomNavigationBarItem(
        icon: Icon(Icons.home), label: '首页', backgroundColor: Colors.blue),
    BottomNavigationBarItem(
        icon: Icon(Icons.message), label: '消息', backgroundColor: Colors.green),
    BottomNavigationBarItem(
        icon: Icon(Icons.shopping_cart),
        label: '购物车',
        backgroundColor: Colors.red),
    BottomNavigationBarItem(
        icon: Icon(Icons.person), label: '我的', backgroundColor: Colors.blue),
  ];

  final pages = [
    Center(
      child: Text('Home', style: TextStyle(fontSize: 40)),
    ),
    Center(
      child: Text('Message', style: TextStyle(fontSize: 40)),
    ),
    Center(
      child: Text('Cart', style: TextStyle(fontSize: 40)),
    ),
    Center(
      child: Text('Mein', style: TextStyle(fontSize: 40)),
    ),
  ];

  late int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("底部导航"),
        leading: const Icon(Icons.menu),
        actions: const [Icon(Icons.settings)],
        elevation: 0.0,
        //去掉阴影
        centerTitle: true,
      ),
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: bottomNavItems,
        currentIndex: currentIndex,
        type: BottomNavigationBarType.shifting,
        onTap: (index) {
          _changePage(index);
        },
      ),
    );
  }

  void _changePage(int i) {
    if (i != currentIndex) {
      setState(() {
        currentIndex = i;
      });
    }
  }
}

import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //菜单数据
    final List<Widget> _tabs = [
      Tab(text: '首页', icon: Icon(Icons.home)),
      Tab(text: '添加', icon: Icon(Icons.add)),
      Tab(text: '搜索', icon: Icon(Icons.search)),
    ];

    //页面数据
    final List<Widget> _tabViews = [
      Icon(Icons.home, size: 120, color: Colors.red),
      Icon(Icons.add, size: 120, color: Colors.green),
      Icon(Icons.search, size: 120, color: Colors.black),
    ];

    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Tab"),
          leading: const Icon(Icons.menu),
          actions: const [Icon(Icons.settings)],
          elevation: 0.0,
          //去掉阴影
          centerTitle: true,
          bottom: TabBar(
            tabs: _tabs,
            labelColor: Colors.red,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: Colors.red,
            indicatorWeight: 5,
            // unselectedLabelColor: Colors.black,
          ),
        ),
        body: TabBarView(
          children: _tabViews,
        ),
        bottomNavigationBar: TabBar(
          tabs: _tabs,
          labelColor: Colors.blue,
          unselectedLabelColor: Colors.black,
        ),
      ),
    );
  }
}

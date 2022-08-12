import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Drawer"),
        leading: const Icon(Icons.menu),
        actions: const [Icon(Icons.settings)],
        elevation: 0.0,
        //去掉阴影
        centerTitle: true,
      ),
      body: const HomePage(),
      drawer: DrawerList(),
      endDrawer: DrawerList(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Home'),
      ),
    );
  }
}

class DrawerList extends StatelessWidget {
  const DrawerList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('images/img_mn_02.jpg'),
            ),
            accountName: Text('维术'),
            accountEmail: Text('lichao@163.com'),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/img_mn_01.jpg'),
                    fit: BoxFit.cover)),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('设置'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.account_balance),
            title: Text('余额'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('我的'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.back_hand),
            title: Text('回退'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () => Navigator.pop(context),
          ),
          Divider(),
          AboutListTile(
            child: Text('关于'),
            applicationName: "维术呀",
            applicationVersion: 'v1.0.0',
            icon: CircleAvatar(
              child: Text('维术'),
            ),
            applicationLegalese: '隐私政策',
            aboutBoxChildren: [Text('条例一:xxxx'), Text('条例二:xxxx')],
            applicationIcon: Image.asset(
              'images/img_mn_03.jpg',
              width: 50,
              height: 50,
            ),
          )
        ],
      ),
    );
  }
}

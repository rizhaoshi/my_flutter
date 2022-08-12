import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("DataTable"),
        leading: const Icon(Icons.menu),
        actions: const [Icon(Icons.settings)],
        elevation: 0.0,
        //去掉阴影
        centerTitle: true,
      ),
      body: const MyUserList(),
    );
  }
}

class MyDataTable extends StatefulWidget {
  const MyDataTable({Key? key}) : super(key: key);

  @override
  State<MyDataTable> createState() => _MyDataTableState();
}

class _MyDataTableState extends State<MyDataTable>
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
    return Container();
  }
}

class User {
  String name;
  int age;
  bool selected;

  User(this.name, this.age, {this.selected = false});
}

class MyUserList extends StatefulWidget {
  const MyUserList({Key? key}) : super(key: key);

  @override
  State<MyUserList> createState() => _MyUserListState();
}

class _MyUserListState extends State<MyUserList>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  List<User> data = [
    User('张三', 16),
    User('张山疯', 116),
    User('张翠山', 36),
    User('张珊珊', 20, selected: true),
  ];
  var _sortAscending = true;

  List<DataRow> _getUseRows() {
    List<DataRow> dataRows = [];

    for (int i = 0; i < data.length; i++) {
      dataRows.add(DataRow(
          selected: data[i].selected,
          onSelectChanged: (selected) {
            setState(() {
              data[i].selected = selected!;
            });
          },
          cells: [
            DataCell(Text('${data[i].name}')),
            DataCell(Text('${data[i].age}')),
            DataCell(Text('男')),
            DataCell(Text('--')),
          ]));
    }
    return dataRows;
  }

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
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          sortColumnIndex: 1,
          sortAscending: _sortAscending,
          dataRowHeight: 100,
          horizontalMargin: 20,
          columnSpacing: 100,
          columns: [
            DataColumn(label: Text('姓名')),
            DataColumn(
              numeric: true,
              onSort: (int columnIndex, bool asscending) {
                setState(() {
                  _sortAscending = asscending;
                  if (asscending) {
                    data.sort((a, b) => a.age.compareTo(b.age));
                  } else {
                    data.sort((a, b) => b.age.compareTo(a.age));
                  }
                });
              },
              label: Text('年龄'),
            ),
            DataColumn(label: Text('性别')),
            DataColumn(label: Text('简介')),
          ],
          rows: _getUseRows(),
          // [
          //   DataRow(cells: [
          //     DataCell(Text('张三')),
          //     DataCell(Text('18')),
          //     DataCell(Text('男')),
          //     DataCell(Text('一个男人')),
          //   ]),
          //   DataRow(cells: [
          //     DataCell(Text('张三')),
          //     DataCell(Text('18')),
          //     DataCell(Text('男')),
          //     DataCell(Text('一个男人')),
          //   ]),
          //   DataRow(cells: [
          //     DataCell(Text('张三')),
          //     DataCell(Text('18')),
          //     DataCell(Text('男')),
          //     DataCell(Text('一个男人')),
          //   ]),
          //   DataRow(cells: [
          //     DataCell(Text('张三')),
          //     DataCell(Text('18')),
          //     DataCell(Text('男')),
          //     DataCell(Text('一个男人')),
          //   ]),
          //   DataRow(cells: [
          //     DataCell(Text('张三')),
          //     DataCell(Text('18')),
          //     DataCell(Text('男')),
          //     DataCell(Text('一个男人')),
          //   ]),
          // ],
        ),
      ),
    );
  }
}

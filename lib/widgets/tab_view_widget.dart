import 'package:flutter/material.dart';

class TabViewWidget extends StatefulWidget {
  const TabViewWidget({Key? key}) : super(key: key);

  @override
  _TabViewWidgetState createState() => _TabViewWidgetState();
}

class _TabViewWidgetState extends State<TabViewWidget>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tab view"),
        // bottom: TabBar(
        //   controller: tabController,
        //   tabs: [Text("Tab 1"), Text("Tab 2"), Text("Tab 3")],
        // ),
      ),
      body: Column(
        children: [
          TabBar(
            indicatorWeight: 5,
            padding: EdgeInsets.only(left: 20, top: 10),
            labelColor: Colors.blue,
            labelStyle: TextStyle(fontSize: 20),
            indicatorColor: Colors.green,
            // custom color
            // Color(0xff000000),
            controller: tabController,
            tabs: [Icon(Icons.home), Icon(Icons.phone), Icon(Icons.message)],
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                Container(color: Colors.limeAccent),
                Container(color: Colors.green),
                Container(color: Colors.black),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

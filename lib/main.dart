import 'package:android_and_ios/list.dart';
import 'package:android_and_ios/navigation/route_generator.dart';
import 'package:android_and_ios/new_screen.dart';
import 'package:android_and_ios/text_field_widgets.dart';
import 'package:android_and_ios/widgets/post_widget.dart';
import 'package:android_and_ios/widgets/tab_view_widget.dart';
import 'package:flutter/material.dart';
import 'page_view_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: ourRouteGenerator,
      initialRoute: "/splash_screen",
      //PageViewWidget(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
//  Scaffold

    /// Container

    /// Row
    /// Column
    /// ListView
    ///
    /// Padding
    /// MaterialButton/FlatButton
    /// InkWell
    /// Image (network, file, asset )
    /// Icon
    /// Text

    /// ListView
    /// SingleChildScrollView
    /// Gridview

    /// Demonstartion of column
    return ListLearning();
  }
}

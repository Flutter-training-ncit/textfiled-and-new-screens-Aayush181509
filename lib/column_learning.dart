import 'package:flutter/material.dart';

class ColumnLearning extends StatelessWidget {
  const ColumnLearning({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Flexible(
              child: Container(
                height: 100,
                color: Colors.red,
              ),
            ),
            Expanded(child: Container(height: 100, color: Colors.purple)),
            Container(
              height: 200,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Icon(Icons.home),
                  Icon(Icons.home),
                  Icon(Icons.home),
                  Icon(Icons.home),
                  Icon(Icons.home),
                  Icon(Icons.home),
                ],
              ),
            ),
            // Container(height: 100, color: Colors.white),
            Container(height: 100, color: Colors.black),
            Container(height: 100, color: Colors.white)
          ],
        ));
  }
}

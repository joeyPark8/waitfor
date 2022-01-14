import 'package:flutter/material.dart';
import 'package:waitfor/util/dday-cal/cal.dart';

class ChristmasPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ChristmasPage();
  }
}

class _ChristmasPage extends State<ChristmasPage> {
  var cal = Calculator();
  var days = 0;

  @override
  void initState() {
    days = cal.calculate(2022, 12, 25);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.navigate_before),
                  color: Colors.blueAccent,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                IconButton(
                  icon: Icon(Icons.home),
                  color: Colors.blueAccent,
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed('/');
                  },
                ),
              ],
            ),
            const SizedBox(height: 100,),
            const Text(
              '2023년 12월 25일까지',
              style: TextStyle(
                fontSize: 40
              ),
            ),
            Text(
              '$days일 남았어!',
              style: const TextStyle(
                fontSize: 40
              ),
            )
          ],
        ),
      ),
    );
  }
}
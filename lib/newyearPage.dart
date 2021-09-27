import 'package:flutter/material.dart';
import 'package:waitfor/dday-cal/cal.dart';

class NewYearPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NewYearPage();
  }
}

class _NewYearPage extends State<NewYearPage> {
  var cal = Calculator();
  var days;

  @override
  Widget build(BuildContext context) {
    days = cal.calculate(2022, 1, 1);

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
            SizedBox(height: 100,),
            Text(
              '2022년 1월 1일까지',
              style: TextStyle(
                fontSize: 40
              ),
            ),
            Text(
              '$days일 남았어!',
              style: TextStyle(
                fontSize: 40
              ),
            )
          ],
        )
      ),
    );
  }
}
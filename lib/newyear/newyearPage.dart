import 'package:flutter/material.dart';
import 'package:waitfor/util/dday-cal/cal.dart';

class NewYearPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NewYearPage();
  }
}

class _NewYearPage extends State<NewYearPage> {
  var cal = Calculator();
  var days = 0;

  var text1 = '';
  var text2 = '';

  @override
  void initState() {
    days = cal.calculate(2022, 1, 1);

    text1 = (days <= 0) ? '여러분!' : '2022년 1월 1일까지';
    text2 = (days <= 0) ? '새해 복 많이 받으세요.' : '$days일 남았어!';
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
            SizedBox(height: 100,),
            Text(
              text1,
              style: TextStyle(
                fontSize: 40
              ),
            ),
            Text(
              text2,
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
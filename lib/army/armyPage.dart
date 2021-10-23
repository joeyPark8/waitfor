import 'package:flutter/material.dart';

import 'package:waitfor/util/dday-cal/cal.dart';

class ArmyPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ArmyPage();
  }
}

class _ArmyPage extends State<ArmyPage> {
  var cal = Calculator();
  var days = 0;

  var year = 2121;
  var month = 1;
  var date = 1;

  var text = '';

  @override
  Widget build(BuildContext context) {
    days = cal.calculate(year, month, date);

    text = (days == 1) ? '군대 잘갔다와!!' : '';

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
            RaisedButton(
              child: Text(
                '입영 날짜 선택하기',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white
                ),
              ),
              onPressed: () async {
                var selectedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2021),
                  lastDate: DateTime(2100)
                );

                if (selectedDate != null) {
                  if (selectedDate is DateTime) {
                    setState(() {
                      year = selectedDate.year;
                      month = selectedDate.month;
                      date = selectedDate.day;
                    });
                  }
                }
              },
              color: Colors.blueAccent,
            ),
            SizedBox(height: 40,),
            Text(
              '$year년 $month월 $date일까지',
              style: TextStyle(
                  fontSize: 40
              ),
            ),
            Text(
              '$days일 남았어!',
              style: TextStyle(
                  fontSize: 40
              ),
            ),
            SizedBox(height: 50,),
            Text(
              text,
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

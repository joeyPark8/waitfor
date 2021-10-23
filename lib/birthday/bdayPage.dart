import 'package:flutter/material.dart';
import 'package:waitfor/myScrollBehavior.dart';

import 'package:waitfor/util/dday-cal/cal.dart';

class BdayPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BdayPage();
  }
}

class _BdayPage extends State<BdayPage> {
  var birthdays = <String, List>{
    'semin': [7, 27]
  };

  var cal = Calculator();
  var days = 0;

  var date = DateTime(DateTime.now().year, 7, 27);

  var text1 = '';
  var text2 = '';

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();

    if (!(date.month == now.month && date.day == now.day))
      date = (date.isBefore(now)) ? DateTime(now.year + 1, date.month, date.day) : date;

    days = cal.calculate(date.year, date.month, date.day);

    text1 = (days == 0) ? '생일 진심으로 축하해!' : '${date.year}년 ${date.month}월 ${date.day}일까지';
    text2 = (days == 0) ? '' : '$days일 남았어!';

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
                  '사람 선택하기',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20
                  ),
                ),
                color: Colors.blueAccent,
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      var list = birthdays.keys.toList();

                      return Container(
                        child: ScrollConfiguration(
                          behavior: MyScrollBehavior(),
                          child: ListView.builder(
                            itemBuilder: (context, position) {
                              return GestureDetector(
                                child: Container(
                                  child: Column(
                                    children: <Widget>[
                                      SizedBox(height: 15,),
                                      Text(
                                        list[position],
                                        style: TextStyle(
                                            fontSize: 45
                                        ),
                                      ),
                                      SizedBox(height: 15,)
                                    ],
                                    mainAxisAlignment: MainAxisAlignment.start,
                                  ),
                                ),
                                onTap: () {
                                  setState(() {
                                    var valuesList = birthdays.values.toList();

                                    if (valuesList[position] is List) {
                                      date = DateTime(
                                          now.year,
                                          valuesList[position][0],
                                          valuesList[position][1]
                                      );
                                    }
                                  });

                                  Navigator.pop(context);
                                },
                              );
                            },
                            itemCount: list.length,
                          ),
                        )
                      );
                    }
                  );
                },
              ),
              SizedBox(height: 40,),
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
              ),
              SizedBox(height: 250,),
              // RaisedButton(
              //   color: Colors.blueAccent,
              //   child: Text(
              //     '자신의 생일 신청하기',
              //     style: TextStyle(
              //       color: Colors.white,
              //       fontSize: 20
              //     ),
              //   ),
              //   onPressed: () {
              //     Navigator.of(context).pushNamed('/birthday/apply');
              //   },
              // ),
              Text(
                '자신의 생일 등록 문의 \n'
                    'joeypark128@gmail.com',
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 17
                ),
              )
            ],
          )
      ),
    );
  }
}
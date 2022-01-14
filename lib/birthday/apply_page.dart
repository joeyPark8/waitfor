import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class ApplyPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ApplyPage();
  }
}

class _ApplyPage extends State<ApplyPage> {
  var textCtrl_name = TextEditingController();
  var textCtrl_date = TextEditingController();

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
              SizedBox(
                child: TextFormField(
                    decoration: InputDecoration(
                        icon: Icon(Icons.person),
                        hintText: '이름',
                        labelText: 'Name *'
                    ),
                    controller: textCtrl_name,
                    keyboardType: TextInputType.text
                ),
                width: 200,
              ),
              SizedBox(height: 25,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    child: TextFormField(
                        decoration: InputDecoration(
                            icon: Icon(Icons.date_range),
                            hintText: '생일',
                            labelText: 'Birthday Date *'
                        ),
                        controller: textCtrl_date,
                        keyboardType: TextInputType.datetime
                    ),
                    width: 200,
                  ),
                  Text(
                    '예시) 7.27',
                    style: TextStyle(
                        color: Colors.grey
                    ),
                  )
                ],
              ),
              SizedBox(height: 10,),
              RaisedButton(
                color: Colors.blueAccent,
                child: Text(
                  '날짜 선택하기',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15
                  ),
                ),
                onPressed: () async {
                  var now = DateTime.now();

                  var result = await showDatePicker(
                      context: context,
                      firstDate: DateTime(now.year),
                      lastDate: DateTime(now.year, 12, 31),
                      initialDate: now
                  );

                  if (result != null) {
                    if (result is DateTime) {
                      textCtrl_date.text = '${result.month}.${result.day}';
                    }
                  }
                },
              ),
              SizedBox(height: 150,),
              RaisedButton(
                color: Colors.blueAccent,
                child: Text(
                  '제출하기',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20
                  ),
                ),
                onPressed: () {
                  if (
                  textCtrl_name.value.text == ''
                      || textCtrl_date.value.text == ''
                  ) {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            child: SizedBox(
                              child: Column(
                                children: <Widget>[
                                  SizedBox(height: 20,),
                                  Text(
                                    '빈칸을 기입해주세요.',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 30
                                    ),
                                  ),
                                  SizedBox(height: 20,),
                                ],
                              ),
                              height: 100,
                            ),
                            backgroundColor: Colors.indigoAccent,
                          );
                        }
                    );
                  } else {
                    // sendApplication(
                    //   textCtrl_name.value.text,
                    //   textCtrl_date.value.text,
                    // );
                  }
                },
              )
            ],
          )
      ),
    );
  }

  void sendApplication(var name, var date) async {
    final smtpServer = gmail('choonjapark23', 'psm135790.1');

    final message = Message()
      ..from = Address('choonjapark23@gmail.com')
      ..recipients.add('choonjapark23@gmail.com')
      ..subject = '[Waitfor] birthday page application'
      ..text = 'name: $name \ndate: $date';

    try {
      final sendReport = await send(message, smtpServer);

      print('Message sent: ' + sendReport.toString());
    } on MailerException catch (e) {
      print('Message not sent.');

      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
      }
    }
  }
}
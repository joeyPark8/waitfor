import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

class GradeCalPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _GradeCalPage();
  }
}

class _GradeCalPage extends State<GradeCalPage> {
  var scoreController = new TextEditingController();
  var averageController = new TextEditingController();
  var deviationController = new TextEditingController();
  var studentController = new TextEditingController();

  var grade;
  var percent;

  @override
  void initState() {
    grade = '';
    percent = '';
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
              SizedBox(height: 180,),
              //http://www.studyholic.com/m/student/grade/sd.asp?sc=90&av=80&sd=10&sn=100
              SizedBox(
                width: 150,
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: '원점수',
                      labelText: 'Score'
                  ),
                  controller: scoreController,
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(height: 20,),
              SizedBox(
                width: 150,
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: '과목평균점수',
                      labelText: 'Average Score'
                  ),
                  controller: averageController,
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(height: 20,),
              SizedBox(
                width: 150,
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: '표준편차',
                      labelText: 'Standard Deviation'
                  ),
                  controller: deviationController,
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(height: 20,),
              SizedBox(
                width: 150,
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: '학생수',
                      labelText: 'Student Count'
                  ),
                  controller: studentController,
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(height: 15,),
              RaisedButton(
                child: Text(
                  '계산하기',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20
                  ),
                ),
                color: Colors.blueAccent,
                onPressed: () async {
                  var sc = scoreController.value.text;
                  var av = averageController.value.text;
                  var sd = deviationController.value.text;
                  var sn = studentController.value.text;

                  var url = 'http://www.studyholic.com/m/student/grade/sd.asp?sc=$sc&av=$av&sd=$sd&sn=$sn';

                  var response = http.get(
                    Uri.parse(url),
                    headers: {
                      "Access-Control_Allow_Origin": "*"
                    }
                  );

                  var doc = parse(response);
                  var content = doc.getElementsByClassName('font18 b');
                  var content2 = doc.getElementsByClassName('font18 b corg');

                  setState(() {
                    grade = '$content';
                    percent = '$content2';
                  });

                  // await launch(url);
                },
              ),
              SizedBox(height: 80,),
              Text(
                '$grade \n'
                '$percent',
                style: TextStyle(
                  fontSize: 50
                ),
              )
            ]
          )
      ),
    );
  }
}
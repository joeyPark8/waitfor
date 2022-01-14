import 'dart:convert';

import 'package:flutter/material.dart';
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
    percent = 0;
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
                  icon: const Icon(Icons.navigate_before),
                  color: Colors.blueAccent,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.home),
                  color: Colors.blueAccent,
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed('/');
                  },
                ),
              ],
            ),
            const SizedBox(height: 180,),
            SizedBox(
              width: 150,
              child: TextFormField(
                decoration: const InputDecoration(
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
                decoration: const InputDecoration(
                    hintText: '과목평균점수',
                    labelText: 'Average Score'
                ),
                controller: averageController,
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(height: 20,),
            SizedBox(
              width: 150,
              child: TextFormField(
                decoration: const InputDecoration(
                    hintText: '표준편차',
                    labelText: 'Standard Deviation'
                ),
                controller: deviationController,
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(height: 20,),
            SizedBox(
              width: 150,
              child: TextFormField(
                decoration: const InputDecoration(
                    hintText: '학생수',
                    labelText: 'Student Count'
                ),
                controller: studentController,
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(height: 15,),
            RaisedButton(
              child: const Text(
                '계산하기',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20
                ),
              ),
              color: Colors.blueAccent,
              onPressed: () async {
                var score = int.parse(scoreController.value.text);
                var average = double.parse(averageController.value.text);
                var deviation = double.parse(deviationController.value.text);
                var students = int.parse(studentController.value.text);

                var url = Uri.parse('http://58.239.82.155:5000/calculate');
                var response = await http.post(
                  url,
                  body: jsonEncode({
                    'score': score,
                    'average': average,
                    'deviation': deviation
                  }),
                  headers: {
                    'Content-Type': 'application/json'
                  }
                );

                var decodedData = jsonDecode(response.body) as Map<String, dynamic>;

                setState(() {
                  percent = decodedData['percentage'];
                  grade = '${students * (percent * 0.01)}등';
                });

              },
            ),
            const SizedBox(height: 80,),
            Text(
              '$grade \n'
                  '상위 $percent%',
              style: const TextStyle(
                  fontSize: 50
              ),
            )
          ]
        ),
      ),
    );
  }
}
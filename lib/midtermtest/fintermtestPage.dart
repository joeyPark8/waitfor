import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:waitfor/util/dday-cal/cal.dart';

class FintermtestPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FintermtestPage();
  }
}

class _FintermtestPage extends State<FintermtestPage> {
  var cal = Calculator();
  var days = 0;

  var text1 = '';
  var text2 = '';
  var text3 = '';

  var img_url = 'https://lh3.googleusercontent.com/'
      'fife/AAWUweUxzy6qgxeiPbQuDN0gzpO6QIgpTty9zMv1u7iINdZOWDPju8hqrKMxzP6d406c9PK6F'
      '-QNrpsSbT7KB-86WhpA6zUAOs7QKgPLUwvp5IxsmYmaQqxZg1NUGejc9JWRSHYUuoHWmrLMcKKH1jqedUlPfkjTkxTy9BGy80UJo4iG5oy'
      '_hGZwZG8pEOjoMj7xGTs4RZE3trjgF6YNXzoFz95JC7Y8FvlOPEDvaGPrFSbxHWzaId770oL1YEuBQRuKqOY24I5v69LhUkBqtIHYlQSzgT'
      '2J6kaXX91WT7sgHCxCOpuXKeJSnsF6JTFKgS2kXDK_R5kIywIko852MWA2R5vJTYFZY0CHQi7aCfrXudd1w-P_biBt7DcGJdgU1jZFOty'
      'Ibfl51mcr2sL9oADHkTRy1oAohxk_uGsOHq3Mui3kQTdCYA9FgO58qAWMopiEkiph1brSh4UvxL9kvNFsCfZuzmILgACdrG-ofqIcDm6'
      'NXrkoyoSpthSaYei_k3iCffY9PXrKGC9LCZsOQhZhcLvOKilMAOtbQk7alE-B-Fjhw7PYymsPw3f-9VQ9LW2CnobuVGwWGMU8p29bZT9'
      'W1BZL72NrTg5Sp7htZ43VSLzyh80VniCNMEkk8UQeAm0tcG8WQkChAVS_8CvAdEBuPPuBcT6BKI-fO140WmpKj4B6L6vQlkHPEH0jYIb'
      '26UYyrU8kVDNMRC7KIhsmnOS6A8R_GKbvd8Ua3XQ=w1920-h937-ft';

  @override
  void initState() {
    days = cal.calculate(2021, 12, 6);

    text1 = (days == 1) ? '그동안 열심히 잘해왔으니까 \n이번 시험도 잘칠거야. 화이팅!' : '';

    text2 = (days <= 0) ? '그동안 열심히 잘해왔으니까' : '2021년 12월 6일까지';
    text3 = (days <= 0) ? '이번 시험도 잘칠거야. 화이팅!' : '$days일 남았어!';
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
              text2,
              style: TextStyle(
                  fontSize: 40
              ),
            ),
            Text(
              text3,
              style: TextStyle(
                  fontSize: 40
              ),
            ),
            SizedBox(height: 50,),
            Text(
              text1,
              style: TextStyle(
                fontSize: 40
              ),
            ),
            SizedBox(height: 30,),
            // RaisedButton(
            //   child: Text(
            //     '시험범위 보기',
            //     style: TextStyle(
            //       color: Colors.white,
            //       fontSize: 20
            //     ),
            //   ),
            //   onPressed: () async {
            //     if (await canLaunch(img_url)) {
            //       await launch(img_url);
            //     }
            //   },
            //   color: Colors.blueAccent,
            // )
          ],
        )
      ),
    );
  }
}
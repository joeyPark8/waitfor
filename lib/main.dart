import 'package:flutter/material.dart';
import 'package:waitfor/newyearPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wait For',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/newyear': (context) => NewYearPage()
      },
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: SizedBox(
            child: Card(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 30),
                  Image(
                    image: NetworkImage(
                        'https://images.unsplash.com/'
                        'photo-1631606305238-b76ec0f86af3?'
                        'ixlib=rb-1.2.1'
                        '&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8'
                        '&auto=format&fit=crop&w=1170&q=80'
                    ),
                    height: 200,
                  ),
                  Text(
                    '새해 2022년까지 얼마나 남았을까?',
                    style: TextStyle(
                      fontSize: 20
                    ),
                  ),
                  SizedBox(height: 130,),
                  RaisedButton(
                    child: Text(
                      '보러가기',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white
                      ),
                    ),
                    color: Colors.blueAccent,
                    onPressed: () {
                      Navigator.of(context).pushNamed('/newyear');
                    },
                  )
                ],
              ),
            ),
            width: 350,
            height: 450,
          )
        ),
      ),
    );
  }
}

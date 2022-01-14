import 'package:flutter/material.dart';
import 'package:waitfor/army/army_page.dart';
import 'package:waitfor/birthday/apply_page.dart';
import 'package:waitfor/birthday/bday_page.dart';
import 'package:waitfor/cardform.dart';
import 'package:waitfor/christmas/christmas_page.dart';
import 'package:waitfor/fintermtest/test_page.dart';
import 'package:waitfor/fintermtest/grade_cal_page.dart';
import 'package:waitfor/newyear/newyear_page.dart';
import 'package:waitfor/scroll_behavior.dart';

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
        '/newyear': (context) => NewYearPage(),
        '/test': (context) => FintermtestPage(),
        '/test/calculate': (context) => GradeCalPage(),
        '/army': (context) => ArmyPage(),
        '/birthday': (context) => BdayPage(),
        '/birthday/apply': (context) => ApplyPage(),
        '/christmas': (context) => ChristmasPage()
      },
    );
  }
}

class Home extends StatelessWidget {
  List<CardForm> cards = [];

  @override
  Widget build(BuildContext context) {
    cards.add(
        CardForm(
            imgUrl: 'https://images.unsplash.com/'
                'photo-1631606305238-b76ec0f86af3?'
                'ixlib=rb-1.2.1'
                '&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8'
                '&auto=format&fit=crop&w=1170&q=80',
            content: '2023년 새해까지 얼마나 남았을까?',
            routeName: 'newyear'
        )
    );

    cards.add(
        CardForm(
            imgUrl: 'https://images.unsplash.com/'
                'photo-1530103862676-de8c9debad1d?'
                'ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8'
                '&ixlib=rb-1.2.1&auto=format&fit=crop&w=1170&q=80',
            content: '생일까지 얼마나 남았을까?',
            routeName: 'birthday'
        )
    );

    cards.add(
        CardForm(
            imgUrl: 'https://images.unsplash.com/'
                'photo-1520004434532-668416a08753?'
                'ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8'
                '&ixlib=rb-1.2.1&auto=format&fit=crop&w=1170&q=80',
            content: '시험까지 얼마나 남았을까?',
            routeName: 'test'
        )
    );

    cards.add(
        CardForm(
            imgUrl: 'https://media.istockphoto.com/'
                'photos/republic-of-korea-army-soldier-and-korean-flag-taegeukgi-picture-id1090301312?'
                'b=1&k=20&m=1090301312&s=170667a&w=0&h=MgMX5R_13xUmo7iI2A8weip8bjo_Eb2oozm2kzqsTac=',
            content: '군대 갈때까지 얼마나 남았을까?',
            routeName: 'army'
        )
    );

    cards.add(
        CardForm(
            imgUrl: 'https://images.unsplash.com/'
                'photo-1595588982209-5c45ceb4f350?'
                'ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8'
                '&ixlib=rb-1.2.1&auto=format&fit=crop&w=1170&q=80',
            content: '크리스마스까지 얼마나 남았을까?',
            routeName: 'christmas'
        )
    );

    return Scaffold(
      body: Container(
        child: Center(
            child: Container(
              child: ScrollConfiguration(
                behavior: MyScrollBehavior(),
                child: ListView.builder(
                  itemBuilder: (context, position) {
                    return SizedBox(
                      child: Card(
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 30),
                            Image(
                              image: NetworkImage(
                                  cards[position].imgUrl
                              ),
                              height: 200,
                            ),
                            SizedBox(height: 20,),
                            Text(
                              cards[position].content,
                              style: const TextStyle(
                                  fontSize: 20
                              ),
                            ),
                            const SizedBox(height: 90,),
                            RaisedButton(
                              child: Text(
                                cards[position].btnText,
                                style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.white
                                ),
                              ),
                              color: Colors.blueAccent,
                              onPressed: () {
                                Navigator.of(context).pushNamed('/'+cards[position].routeName);
                              },
                            )
                          ],
                        ),
                      ),
                      width: 350,
                      height: 450,
                    );
                  },
                  itemCount: cards.length,
                ),
              ),
              width: 350,
            )
        ),
      ),
    );
  }
}
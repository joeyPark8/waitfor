import 'package:flutter/material.dart';
import 'package:waitfor/cardForm.dart';
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
        content: '새해 2022년까지 얼마나 남았을까?',
        routeName: 'newyear'
      )
    );

    return Scaffold(
      body: Container(
        child: Center(
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
                        style: TextStyle(
                            fontSize: 20
                        ),
                      ),
                      SizedBox(height: 90,),
                      RaisedButton(
                        child: Text(
                          cards[position].btnText,
                          style: TextStyle(
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
          )
        ),
      ),
    );
  }
}

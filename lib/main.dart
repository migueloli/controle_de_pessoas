import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
          title: "Contador de Pessoas",
          home: Home()
         ) //MaterialApp
      ); //RunApp
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _people = 0;
  String _infoText = "Pode entrar!";

  void _changePeople(int delta){
    setState(() {
      if(_people < 10 || delta < 0) {
        _people += delta;
      }

      if(_people < 0) {
        _infoText = "Mundo invertido!";
      } else if(_people < 10) {
        _infoText = "Pode entrar!";
      } else {
        _infoText = "Lotado!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "images/fundo.jpg",
          fit: BoxFit.cover,
          height: 1000.0,
        ),
        Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Pessoas: $_people",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold) //TextStyle
              ), //Text
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: FlatButton(
                        child: Text(
                          "+1",
                          style: TextStyle(
                              color: Colors.white, fontSize: 40.0), //TextStyle
                        ), //Text
                        onPressed: () {
                          _changePeople(1);
                        }, //OnPressed
                      ), //FlatButton
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: FlatButton(
                        child: Text(
                          "-1",
                          style: TextStyle(
                              color: Colors.white, fontSize: 40.0), //TextStyle
                        ), //Text
                          onPressed: () {
                            _changePeople(-1);
                          }, //OnPressed
                      ), //FlatButton
                    ),
                  ] //<Widget>[]
              ), //Row
              Text(_infoText,
                  style: TextStyle(
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                      fontSize: 30.0) //TextStyle
              ) //Text
            ] //<Widget>[]
        ) //Column
      ], //<Widget>[]
    );//Stack
  }
}

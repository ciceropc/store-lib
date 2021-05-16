import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InfoAssist - Admin',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          headline1: TextStyle(
            color: Colors.white,
            fontSize: 8.0,
          ),
        ),
      ),
      home: Material(
        child: Container(
          color: Color.fromRGBO(11, 86, 148, 1),
          child: Column(
            children: [
              Spacer(flex: 1),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'InfoAssist - Sistema',
                    style: Theme.of(context).textTheme.headline1.copyWith(
                          color: Colors.white,
                          fontSize: 28.0,
                        ),
                  ),
                  SizedBox(height: 20.0),
                  Container(
                    height: 220,
                    width: 280,
                    padding: EdgeInsets.symmetric(
                      horizontal: 35.0,
                      vertical: 20.0,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        TextFormField(
                          autofocus: true,
                          maxLines: 1,
                        ),
                        SizedBox(height: 20.0),
                        TextFormField(
                          obscureText: true,
                        ),
                        SizedBox(height: 20.0),
                        FlatButton(
                          onPressed: () => print('Teste'),
                          child: Text(
                            'Logar',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          color: Color.fromRGBO(11, 86, 148, 1),
                          height: 44.0,
                          minWidth: 220.0,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Spacer(flex: 1),
            ],
          ),
        ),
      ),
    );
  }
}

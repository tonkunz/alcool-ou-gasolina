import 'package:alcoolougasolina/widgets/input.widget.dart';
import 'package:alcoolougasolina/widgets/loading-button.widget.dart';
import 'package:alcoolougasolina/widgets/logo.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Álcool ou Gasolina',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  var _gasCtrl = new MoneyMaskedTextController();
  var _alcoolCtrl = new MoneyMaskedTextController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: ListView(
        children: <Widget>[
          Logo(),
          Container(
            margin: EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.8),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 50,
                ),
                Text(
                  "Compensa utilizar álcool",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 40,
                    fontFamily: "Big Shoulders Display",
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                ),
                LoadingButton(
                  busy: false,
                  invert: true,
                  func: () {},
                  text: 'CALCULAR NOVAMENTE'
                ),
              ],
            ),
          ),
          Input(
            controller: _gasCtrl,
            label: "Gasolina",
          ),
          Input(
            controller: _alcoolCtrl,
            label: "Álcool",
          ),
          LoadingButton(
            busy: false,
            invert: false,
            func: () {},
            text: 'CALCULAR'
          ),
        ],
      ),
    );
  }
}

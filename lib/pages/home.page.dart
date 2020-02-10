import 'package:alcoolougasolina/widgets/logo.widget.dart';
import 'package:alcoolougasolina/widgets/submit-form.widget.dart';
import 'package:alcoolougasolina/widgets/success.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color _color = Colors.deepPurple;
  var _gasCtrl = new MoneyMaskedTextController();
  var _alcoolCtrl = new MoneyMaskedTextController();
  var _busy = false;
  var _completed = false;
  var _resultText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: AnimatedContainer(
        duration: Duration(milliseconds: 1200),
        color: _color,
        child: ListView(
          children: <Widget>[
            Logo(),
            _completed
              ? SuccessSession(
                  result: _resultText,
                  reset: reset,
                )
              : SubmitForm(
                  gasCtrl: _gasCtrl,
                  alcCtrl: _alcoolCtrl,
                  busy: _busy,
                  submitFunc: calculate,
                ),
          ],
        ),
      ),
    );
  }

  Future calculate() {
    double alc =
      double.parse(_alcoolCtrl.text.replaceAll(new RegExp(r'[,.]'), '')) / 100;

    double gas =
      double.parse(_gasCtrl.text.replaceAll(new RegExp(r'[,.]'), '')) / 100;

    double res = alc / gas;

    setState(() {
      _completed = false;
      _busy = true;
      _color = Colors.deepPurpleAccent;
    });

    return new Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        if(res >= 0.7) {
          _resultText = "Compensa utilizar Gasolina!";
        } else {
          _resultText = "Compensa utilizar Álcool";
        }

        _busy = false;
        _completed = true;     
      });
    });
  }

  reset() {
    setState(() {
      _alcoolCtrl = new MoneyMaskedTextController();
      _gasCtrl = new MoneyMaskedTextController();
      _completed = false;
      _busy = false;
      _color = Colors.deepPurple;
    });
  }
}
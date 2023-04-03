import 'package:eog/widgets/logo.widget.dart';
import 'package:eog/widgets/submit-form.dart';
import 'package:eog/widgets/success.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

class HomePage  extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color _color = Colors.deepPurple;
  var _gasController = MoneyMaskedTextController();
  var _etanController = MoneyMaskedTextController();
  var _busy = false;
  var _completed = false;
  var _resultText = "Compensa utilizar álcool";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: AnimatedContainer(
        duration:  const Duration(
          microseconds: 1200,
        ),
        color: _color,
        child: ListView(
          children: <Widget> [
            Logo(),
            _completed
                ? Success(
                result: _resultText,
                reset: reset )
                : SubmitForm(
                gasController: _gasController,
                etanController: _etanController,
                busy: _busy,
                submitFunc: calculate
            ),
          ],
        ),
      ),
    );
  }

  Future calculate()  {
    double? alcool = double.parse(_etanController.text.replaceAll(RegExp(r'[,.]'), '')) / 100;
    double? gasolina = double.parse(_gasController.text.replaceAll(RegExp(r'[,.]'), '')) / 100;
    double resultado = alcool / gasolina;

    if(alcool == 0 || gasolina == 0){

      return
      showDialog(
          context: context,

          builder: (context) => const AlertDialog(

            titleTextStyle: TextStyle(
              fontSize: 30,
              color: Colors.red,
            ),
            title:Text("Atenção"),
            content: Text('Os valores precisam ser maiores que zero (0,00)'),
            actions: [

            ],

          ),

      );


    }

    setState(() {
      _color = Colors.deepPurpleAccent;
      _completed = false;
      _busy = true;
    });

    return Future.delayed(
        const Duration(seconds: 1),
            () => {
              setState(() {
                if (resultado >= 0.7) {
                  _resultText = "Compensa utilizar Gasolina!";
                } else {
                  _resultText = "Compensa utilizar Álcool!";
                }
                _busy = false;
                _completed = true;
              })
        });
  }

  reset() {
    setState(() {
      _etanController = MoneyMaskedTextController();
      _gasController = MoneyMaskedTextController();
      _completed = false;
      _busy = false;
      _color = Colors.deepPurple;
    });
  }
}
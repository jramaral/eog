import 'package:eog/widgets/input.widget.dart';
import 'package:eog/widgets/loading-button.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

class SubmitForm extends StatelessWidget {
  var gasController = MoneyMaskedTextController();
  var etanController = MoneyMaskedTextController();
  var busy = false;
  VoidCallback submitFunc;

  SubmitForm({
    Key? key,
    required this.gasController,
    required this.etanController,
    required this.busy,
    required this.submitFunc,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget> [
        Padding(
          padding: const EdgeInsets.only(left: 0, right: 0),
            child: Input(
              label: "Gasolina",
              ctrl: gasController,
            ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 0, right: 0),
          child: Input(
            label: "Alcool",
            ctrl: etanController,
          ),
        ),
        LoadingButton(
            busy: busy,
            func: submitFunc,
            invert: false,
            text: "CALCULAR"
        ),
      ],

    );
  }
}

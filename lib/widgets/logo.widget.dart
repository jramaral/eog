import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>  [
        const SizedBox(
          height: 60,
        ),
        Image.asset("assets/images/aog-white.png",
          height: 60,
        ),
        const SizedBox(
          height: 2,
        ),
        const Text(
          "Álcool ou Gasolina",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontFamily: "Big Shoulders Display",

          ),
          textAlign: TextAlign.center,

        ),
        const SizedBox(
          height: 30,
        )
      ],
    );
  }
}

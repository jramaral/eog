import 'package:flutter/material.dart';

class LoadingButton extends StatelessWidget {
  var busy = false;
  var invert = false;
  VoidCallback func;
  var text = "";

  LoadingButton({Key? key,
    required this.busy,
    required this.func,
    required this.invert,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return busy
        ? Container(
            alignment: Alignment.center,
            height: 50,
            child: const CircularProgressIndicator(
              backgroundColor: Colors.white,
            ),
          )
        : Container(
            margin: const EdgeInsets.all(30),
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
              color: invert
                  ? Theme.of(context).primaryColor
                  : Colors.white.withOpacity(0.8),
              borderRadius: BorderRadius.circular(15),
            ),
            child: TextButton(
              style: const ButtonStyle(
                  // foregroundColor: MaterialStatePropertyAll(Color),
                  ),
              onPressed: func,
              child: Text(
                text,
                style: TextStyle(
                    fontSize: 25,
                    fontFamily: "Big Shoulders Display",
                    color:
                        invert ? Colors.white : Theme.of(context).primaryColor),
              ),
            ),
          );
  }
}

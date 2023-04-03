import 'package:eog/pages/home.page.dart';
import 'package:eog/widgets/loading-button.widget.dart';
import 'package:eog/widgets/logo.widget.dart';
import 'package:eog/widgets/submit-form.dart';
import 'package:eog/widgets/success.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

import 'widgets/input.widget.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alcool ou Gasolina',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purpleAccent),
        useMaterial3: true,
      ),
      home:  const HomePage(),
    );
  }
}



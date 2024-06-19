import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GeneratorPage extends StatefulWidget {
  const GeneratorPage({super.key, required this.min, required this.max});
  final int min;
  final int max;

  @override
  State<GeneratorPage> createState() => _GeneratorPageState();
}

class _GeneratorPageState extends State<GeneratorPage> {
  int? generatedInt;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text('Generator Page'),
      ),
      body: Center(
          child: Text(
        generatedInt == null
            ? "Click generate button below"
            : 'Generated random number between range of ${widget.min} to ${widget.max} is: $generatedInt',
        style: const TextStyle(fontSize: 42),
      )),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          setState(() {
            generatedInt =
                widget.min + Random().nextInt((widget.max - widget.min) + 1);
          });
        },
        label: const Text('Generate'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

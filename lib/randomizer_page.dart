import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class GeneratorPage extends HookWidget {
  GeneratorPage({super.key, required this.min, required this.max});
  final int min;
  final int max;
  final randomGenerator = Random();

  @override
  Widget build(BuildContext context) {
    final generatedNumber = useState<int?>(null);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text('Randomize'),
      ),
      body: Center(
          child: Text(
        generatedNumber.value?.toString() ?? 'Click generate button below',
        style: const TextStyle(fontSize: 42),
      )),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          generatedNumber.value =
              min + randomGenerator.nextInt((max - min) + 1);
        },
        label: const Text('Generate'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

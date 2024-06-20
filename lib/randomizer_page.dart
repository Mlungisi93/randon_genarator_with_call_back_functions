import 'package:flutter/material.dart';

import 'package:randon_genarator_with_call_back_functions/random_generator_change_notifier.dart';
import 'package:provider/provider.dart';

class RandomizerPage extends StatelessWidget {
  const RandomizerPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text('Randomize'),
      ),
      body: Center(child: Consumer<RandomizerChangeNotifier>(
        builder: (context, notifier, child) {
          return Text(
            //without consumer this won't change the value
            notifier.generatedRandomNumber?.toString() ??
                'Click generate button below',
            style: const TextStyle(fontSize: 42),
          );
        },
      )),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context.read<RandomizerChangeNotifier>().generateRandomNumber();
          // this would work without consumer in the text field(widget) you change to trigger rebuild
        },
        label: const Text('Generate'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:randon_genarator_with_call_back_functions/main.dart';

class RandomizerPage extends ConsumerWidget {
  const RandomizerPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef widgetRef) {
    final randomizerNotifier = widgetRef.watch(randomizerProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text('Randomizer'),
      ),
      body: Center(
        child: Text(
          //without consumer this won't change the value
          randomizerNotifier.generatedNumber?.toString() ??
              'Click generate button below',
          style: const TextStyle(fontSize: 42),
        ),

        //used this in the StatelessWidget but riverpod comes with ConsumerWidget
        /*child: Consumer(
        builder: (context, widgetRef, child) {
          final randomizerNotifier = widgetRef.watch(randomizerProvider);
          return Text(
            //without consumer this won't change the value
            randomizerNotifier.generatedRandomNumber?.toString() ??
                'Click generate button below',
            style: const TextStyle(fontSize: 42),
          );
        },
      )*/
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          widgetRef.read(randomizerProvider.notifier).generateRandomNumber();
          // this would work without consumer in the text field(widget) you change to trigger rebuild
        },
        label: const Text('Generate'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

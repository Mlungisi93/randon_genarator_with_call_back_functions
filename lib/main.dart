import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:randon_genarator_with_call_back_functions/random_generator_change_notifier.dart';

import 'package:randon_genarator_with_call_back_functions/range_selector_page.dart';

void main() {
  runApp(const MyApp());
}

final randomizerProvider =
    ChangeNotifierProvider((ref) => RandomizerChangeNotifier());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Random Range Generator',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3:
              true, // this will force us to assign background color of every appBar
        ),
        home:
            RangeSelectorPage(), //home page should be renamed to Range selector Page
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

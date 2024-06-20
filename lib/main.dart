import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:randon_genarator_with_call_back_functions/random_generator_change_notifier.dart';
import 'package:randon_genarator_with_call_back_functions/range_selector_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RandomizerChangeNotifier(),
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

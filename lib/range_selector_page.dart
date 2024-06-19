import 'package:flutter/material.dart';
import 'package:randon_genarator_with_call_back_functions/randomizer_page.dart';
import 'package:randon_genarator_with_call_back_functions/range_selector_form.dart';

class RangeSelectorPage extends StatefulWidget {
  const RangeSelectorPage({super.key, required this.title});

  final String title;

  @override
  State<RangeSelectorPage> createState() => _RangeSelectorState();
}

class _RangeSelectorState extends State<RangeSelectorPage> {
  int _min = 0, _max = 0;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(widget.title),
      ),
      body: RangeSelectorForm(
          formKey: _formKey,
          intMinValueSetter: (value) => _min = value,
          intMaxValueSetter: (value) => _max = value),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_formKey.currentState!.validate() == true) {
            _formKey.currentState!.save();
            Navigator.of(context).push(MaterialPageRoute(
                builder: (xontext) => GeneratorPage(
                      min: _min,
                      max: _max,
                    )));
          }
        },
        child: const Icon(Icons.arrow_right),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

import 'package:flutter/material.dart';
import 'package:randon_genarator_with_call_back_functions/randomizer_page.dart';

import 'package:randon_genarator_with_call_back_functions/range_selector_form.dart';

class RangeSelectorPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  RangeSelectorPage({
    super.key,
  });
//Or old school RangeSelectorPage({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text("Select Page"),
      ),
      body: RangeSelectorForm(
        formKey: _formKey,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_formKey.currentState!.validate() == true) {
            _formKey.currentState!.save();
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const RandomizerPage()));
          }
        },
        child: const Icon(Icons.arrow_right),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

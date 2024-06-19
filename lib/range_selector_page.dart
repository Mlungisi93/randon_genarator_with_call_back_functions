import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:randon_genarator_with_call_back_functions/randomizer_page.dart';
import 'package:randon_genarator_with_call_back_functions/range_selector_form.dart';

class RangeSelectorPage extends HookWidget {
  final _formKey = GlobalKey<FormState>();

  RangeSelectorPage({
    super.key,
  });
//Or old school RangeSelectorPage({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    final min = useState<int>(0);
    final max = useState<int>(0);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text("Select Page"),
      ),
      body: RangeSelectorForm(
          formKey: _formKey,
          intMinValueSetter: (value) => min.value = value,
          intMaxValueSetter: (value) => max.value = value),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_formKey.currentState!.validate() == true) {
            _formKey.currentState!.save();
            Navigator.of(context).push(MaterialPageRoute(
                builder: (xontext) => GeneratorPage(
                      min: min.value,
                      max: max.value,
                    )));
          }
        },
        child: const Icon(Icons.arrow_right),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

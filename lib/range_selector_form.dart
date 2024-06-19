import 'package:flutter/material.dart';

typedef IntValueSetter = void Function(int value);

class RangeSelectorForm extends StatelessWidget {
  const RangeSelectorForm({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.intMinValueSetter,
    required this.intMaxValueSetter,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final IntValueSetter intMinValueSetter;
  final IntValueSetter intMaxValueSetter;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RangeSelectorTextFormField(
              labelText: "Minimum",
              intValueSetter: intMinValueSetter,
            ),
            const SizedBox(
              height: 12,
            ),
            RangeSelectorTextFormField(
                labelText: "Maximum", intValueSetter: intMaxValueSetter),
          ],
        ),
      ),
    );
  }
}

class RangeSelectorTextFormField extends StatelessWidget {
  const RangeSelectorTextFormField({
    super.key,
    required this.labelText,
    required this.intValueSetter,
  });

  final String labelText;

  final IntValueSetter intValueSetter;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: labelText,
          hintText: "Enter an Integer",
        ),
        keyboardType: const TextInputType.numberWithOptions(
          decimal: false,
          signed: true,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Please enter text";
          } else if ((int.tryParse(value.toString())) == null) {
            //this does not throw exception
            return "Please enter valid number";
          } else {
            return null;
          }
        },
        onSaved: (newValue) => intValueSetter(
              int.parse(newValue ?? ''),
            ));
  }
}

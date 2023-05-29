import 'package:flutter/material.dart';
import 'package:todo/comon/utils/extensions.dart';

import 'package:todo/comon/utils/funtion_utils.dart';

class AtristaDownItemInput extends StatelessWidget {
  final List<String> items;
  final String? labelText;
  final String? selected;
  final Function(String value)? onChanged;

  const AtristaDownItemInput({
    super.key,
    required this.items,
    required this.labelText,
    this.onChanged,
    this.selected,
  });

  List<DropdownMenuItem<String>> _listBuilder(List<String> items, BuildContext context) {
    final List<DropdownMenuItem<String>> newItems = [
      DropdownMenuItem(
        value: 'Select A $labelText',
        child: Text(
          toSentenceCase('Select A $labelText'),
          style: const TextStyle(
            color: Colors.black38,
          ),
        ),
      )
    ];
    for (final element in items) {
      newItems.add(
        DropdownMenuItem(
          value: element,
          child: Text(
            toSentenceCase(element),
            style: context.textTheme.bodyLarge,
          ),
        ),
      );
    }
    return newItems;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: labelText,
      ),
      hint: Text(labelText!),
      isExpanded: true,
      value: selected ?? 'Select A $labelText',
      elevation: 16,
      onChanged: (String? value) {
        if (value != 'Select A $labelText' && value != null) {
          onChanged!(value);
        }
      },
      items: _listBuilder(items, context),
    );
  }
}

import 'package:flutter/material.dart';

class FilterCheckbox extends StatefulWidget {
  final String label;
  final ValueChanged<bool> onChanged;

  const FilterCheckbox({
    required this.label,
    required this.onChanged,
    super.key,
  });

  @override
  State<StatefulWidget> createState() => FilterCheckboxState();
}

class FilterCheckboxState extends State<FilterCheckbox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Checkbox(
            value: isChecked,
            onChanged: (value) {
              setState(() {
                isChecked = value!;
                widget.onChanged(value);
              });
            },
          ),
          Text(widget.label),
          const SizedBox(width: 12),
        ],
      ),
    );
  }
}

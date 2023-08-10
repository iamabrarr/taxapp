import 'package:flutter/material.dart';

// enum Filter { all, income, expense, allowableExpense,recurring}

// extension FilterExt on Filter {
//   String get label {
//     switch (this) {
//       case Filter.all:
//         return 'All';
//       case Filter.income:
//         return 'Income';
//       case Filter.expense:
//         return 'Expense';
//       case Filter.allowableExpense:
//         return 'Allowable expense by UK Gov.';
//       case Filter.recurring: // Add this case
//         return 'Recurring'; // Add this line
//     }
//   }
// }
// for (final item in Filter.values) ...[
enum Filter { all, income, expense, allowableExpense }

extension FilterExt on Filter {
  String get label {
    switch (this) {
      case Filter.all:
        return 'All';
      case Filter.income:
        return 'Income';
      case Filter.expense:
        return 'Expense';
      case Filter.allowableExpense:
        return 'Allowable expense by UK Gov.';
    }
  }
}

class FilterSwitcher extends StatefulWidget {
  const FilterSwitcher({super.key, this.value = Filter.all, required this.onUpdate});

  final Filter value;
  final void Function(Filter value) onUpdate;

  @override
  State<FilterSwitcher> createState() => _FilterSwitcherState();
}

class _FilterSwitcherState extends State<FilterSwitcher> {
  late Filter selectedValue;

  @override
  void initState() {
    selectedValue = widget.value;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant FilterSwitcher oldWidget) {
    selectedValue = widget.value;
    super.didUpdateWidget(oldWidget);
  }

  bool isSelected(Filter item, Filter selectedValue) {
    if (selectedValue == Filter.allowableExpense) {
      return item == Filter.expense;
    }
    return item == selectedValue;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 50.0,
          width: double.infinity,
          constraints: const BoxConstraints(maxWidth: 500.0),
          margin: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: const Color(0xFFD6D6D6)),
            borderRadius: const BorderRadius.all(Radius.circular(12.0)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (final item in Filter.values.sublist(0, 3)) ...[
                TabButton(
                  label: item.label,
                  selected: isSelected(item, selectedValue),
                  onTap: () {
                    if (selectedValue == item) {
                      return;
                    }
                    setState(() => selectedValue = item);
                    widget.onUpdate(item);
                  },
                ),
              ],
            ],
          ),
        ),
        if (selectedValue == Filter.expense ||
            selectedValue == Filter.allowableExpense) ...[
          CheckboxListTile(
            value: selectedValue == Filter.allowableExpense,
            title: Text(Filter.allowableExpense.label),
            onChanged: (value) {
              selectedValue = value == true ? Filter.allowableExpense : Filter.expense;
              setState(() {});
              widget.onUpdate(selectedValue);
            },
          ),
        ],
      ],
    );
  }
}

class TabButton extends StatelessWidget {
  const TabButton(
      {super.key, required this.onTap, required this.label, required this.selected});

  final Function()? onTap;
  final String label;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final bgColor = selected ? Colors.black : Colors.white;
    final textColor = selected ? Colors.white : Colors.black;
    const radius = BorderRadius.all(Radius.circular(10.0));
    final style = TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0, color: textColor);
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 35,
          margin: const EdgeInsets.all(4.0),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: radius,
            border: Border.all(color: const Color(0xFFD6D6D6)),
          ),
          child: Center(child: Text(label, style: style)),
        ),
      ),
    );
  }
}


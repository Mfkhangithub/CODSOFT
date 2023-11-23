// widgets/date_picker.dart
import 'package:flutter/material.dart';

class DatePicker extends StatelessWidget {
  final DateTime selectedDate;
  final Function(DateTime) onDateChanged;

  DatePicker({required this.selectedDate, required this.onDateChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          onPressed: () async {
            final DateTime? picked = await showDatePicker(
              context: context,
              initialDate: selectedDate,
              firstDate: DateTime.now(),
              lastDate: DateTime(2101),
            );
            if (picked != null && picked != selectedDate) {
              onDateChanged(picked);
            }
          },
          child: Text(
            'Pick Date',
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
        ),
        SizedBox(width: 10),
        Text(
          'Selected Date: ${selectedDate.toLocal()}',
        ),
      ],
    );
  }
}

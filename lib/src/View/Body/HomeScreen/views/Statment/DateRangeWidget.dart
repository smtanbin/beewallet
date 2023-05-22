import 'package:flutter/material.dart';

class DateRangeWidget extends StatelessWidget {
  const DateRangeWidget(
      {Key? key, required this.fromDate, required this.toDate})
      : super(key: key);

  final DateTime fromDate;
  final DateTime toDate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextFormField(
            controller:
                TextEditingController(text: fromDate.toLocal().toString()),
            decoration: InputDecoration(
              labelText: 'From Date',
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.onSurface, width: 0.0),
                borderRadius: BorderRadius.circular(5.0),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
          ),
          TextFormField(
            controller:
                TextEditingController(text: toDate.toLocal().toString()),
            decoration: InputDecoration(
              labelText: 'To Date',
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.onSurface, width: 0.0),
                borderRadius: BorderRadius.circular(5.0),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Do something with the date range
            },
            child: Text('Search'),
          ),
        ],
      ),
    );
  }
}

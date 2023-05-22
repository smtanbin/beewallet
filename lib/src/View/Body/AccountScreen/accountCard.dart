import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AccountCard extends StatelessWidget {
  final String name;
  final String accountNo;
  final String regDate;
  final String? expDate;
  final double balance;
  final String? status;

  AccountCard({
    Key? key,
    required this.name,
    required this.accountNo,
    required this.regDate,
    required this.expDate,
    required this.balance,
    this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    if (status == 'F') {
      backgroundColor = Theme.of(context).colorScheme.error;
    } else if (status == 'C') {
      backgroundColor = Theme.of(context).colorScheme.surfaceVariant; //update;
    } else {
      backgroundColor = Theme.of(context).colorScheme.primaryContainer;
    }
    return Card(
      color: backgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        NumberFormat("### ########")
                            .format(int.parse(accountNo))
                            .toString(),
                        style: TextStyle(
                          fontSize: 20.0,
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Text(
                        name.toUpperCase(),
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Theme.of(context)
                              .colorScheme
                              .onPrimaryContainer
                              .withOpacity(0.7),
                        ),
                      ),
                      const SizedBox(height: 5.0),
                      Row(children: [
                        Icon(
                          Icons.calendar_today,
                          size: 16.0,
                          color: Theme.of(context)
                              .colorScheme
                              .onPrimaryContainer
                              .withOpacity(0.5),
                        ),
                        const SizedBox(width: 4.0),
                        Text(
                          regDate,
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer
                                .withOpacity(0.5),
                          ),
                        ),
                        const SizedBox(width: 8.0),
                      ]),
                    ],
                  ),
                ),
                const SizedBox(width: 16.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Balance',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Theme.of(context)
                            .colorScheme
                            .onPrimaryContainer
                            .withOpacity(0.5),
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      '৳${balance.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    expDate != null
                        ? Row(
                            children: [
                              Icon(
                                Icons.calendar_today,
                                size: 16.0,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onPrimaryContainer
                                    .withOpacity(0.5),
                              ),
                              const SizedBox(width: 4.0),
                              Text(
                                expDate!,
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onPrimaryContainer
                                      .withOpacity(0.5),
                                ),
                              ),
                            ],
                          )
                        : Text(
                            'No Exp Date',
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer
                                  .withOpacity(0.5),
                            ),
                          ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Visibility(
                  visible: status != 'F' && status != 'C',
                  child: ElevatedButton(
                    child: Text(
                      'See More',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      // ...
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

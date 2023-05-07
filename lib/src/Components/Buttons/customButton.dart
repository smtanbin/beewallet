// ignore: file_names
import 'package:flutter/material.dart';

// ignore: camel_case_types
class customButton extends StatelessWidget {
  const customButton({
    required this.onPressed,
    required this.icon,
    this.label = 'Default Button',
    this.notificationCount = 0,
    Key? key,
  }) : super(key: key);

  final VoidCallback onPressed;
  final IconData? icon;
  final String label;
  final int notificationCount;

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);
    // final buttonColor = theme.colorScheme.primary;
    // final textColor = theme.colorScheme.inversePrimary;
    // final buttonSize = MediaQuery.of(context).size.width / 3;

    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(color: Colors.grey),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border:
              const Border(bottom: BorderSide(width: 2, color: Colors.grey)),
        ),
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            const Icon(Icons.refresh),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Label', style: TextStyle(fontSize: 18)),
                Text('Sublabel',
                    style: TextStyle(fontSize: 14, color: Colors.grey)),
              ],
            ),
            Expanded(child: Container()),
            const Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}

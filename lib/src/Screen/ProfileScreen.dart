import 'package:awesome_card/credit_card.dart';
import 'package:awesome_card/style/card_background.dart';
import 'package:awesome_card/awesome_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final String cardNumber = '5464754654';
  final String cardHolderName = 'fdfbr tsdgt';
  final String expiryDate = '353';
  final String cvv = '353';
  final bool showBack = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 40,
            ),
            CreditCard(
              cardNumber: cardNumber,
              cardExpiry: expiryDate,
              cardHolderName: cardHolderName,
              cvv: cvv,
              bankName: 'Standard Bank',
              showBackSide: showBack,
              frontBackground: CardBackgrounds.custom(0xFF281B10),
              backBackground: CardBackgrounds.white,
              showShadow: true,
            ),

            const SizedBox(
              height: 40,
            ),

            // Padding(
            //   padding: const EdgeInsets.fromLTRB(25,10,25,0),
            //   child:
            //   Row(
            //     mainAxisSize: MainAxisSize.min,
            //     children: <Widget>[
            //
            //       ElevatedButton(
            //         onPressed: () {},
            //         style: ElevatedButton.styleFrom(
            //           shape: RoundedRectangleBorder(
            //             borderRadius: BorderRadius.circular(12),
            //           ),
            //         ),
            //         child: Row(
            //           mainAxisSize: MainAxisSize.min,
            //           children: const [
            //             Icon(Icons.money),
            //             SizedBox(height: 100.0,width: 8),
            //             Text('Button'),
            //           ],
            //         ),
            //       ),
            //
            //       const SizedBox(
            //         height: 10,
            //       ),
            //       ElevatedButton(
            //         onPressed: () {},
            //         style: ElevatedButton.styleFrom(
            //           shape: RoundedRectangleBorder(
            //             borderRadius: BorderRadius.circular(12),
            //           ),
            //         ),
            //         child: Row(
            //           mainAxisSize: MainAxisSize.min,
            //           children: const [
            //             Icon(Icons.money),
            //             SizedBox(height: 100.0,width: 8),
            //             Text('Button'),
            //           ],
            //         ),
            //       ),
            //       const SizedBox(
            //         height: 10,
            //       ),
            //       ElevatedButton(
            //         onPressed: () {},
            //         style: ElevatedButton.styleFrom(
            //           shape: RoundedRectangleBorder(
            //             borderRadius: BorderRadius.circular(12),
            //           ),
            //         ),
            //         child: Row(
            //           mainAxisSize: MainAxisSize.min,
            //           children: const [
            //             Icon(Icons.money),
            //             SizedBox(height: 100.0,width: 8),
            //             Text('Button'),
            //           ],
            //         ),
            //       ),
            //
            //       const SizedBox(
            //         height: 10,
            //       ),
            //       ElevatedButton(
            //         onPressed: () {},
            //         style: ElevatedButton.styleFrom(
            //           shape: RoundedRectangleBorder(
            //             borderRadius: BorderRadius.circular(12),
            //           ),
            //         ),
            //         child: Row(
            //           mainAxisSize: MainAxisSize.min,
            //           children: const [
            //             Icon(Icons.money),
            //             SizedBox(height: 100.0,width: 8),
            //             Text('Button'),
            //           ],
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ]),
    );
  }
}

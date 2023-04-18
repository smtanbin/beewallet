import 'package:awesome_card/credit_card.dart';
import 'package:awesome_card/extra/card_type.dart';
import 'package:awesome_card/extra/helper.dart';
import 'package:awesome_card/style/card_background.dart';
import 'package:flutter/material.dart';

// import '../Assect/CardTemplate/CreditCard.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  final String cardNumber = '5576670101022070';
  final String cardHolderName = 'Tanbin Hassan Bappi';
  final String expiryDate = '02/25';
  final String cvv = '000';
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
              frontBackground: Container(
                width: double.maxFinite,
                height: double.maxFinite,
                decoration:  BoxDecoration(
                  gradient: LinearGradient(
                    colors: [ Colors.green.shade800,Colors.green.shade600,Colors.green.shade500,Colors.green.shade400,Colors.green.shade300],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
              backBackground: CardBackgrounds.white,
              showShadow: true,
              mask: getCardTypeMask(cardType: CardType.visa),
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




import 'package:flutter/material.dart';
import 'package:ui_components/ui_components/widgets/custom_buttons.dart';

enum ImageSourceType {
  asset,
  network,
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Widget Reutilizável')),
        body: Center(
          child: CreditCardWidget(
            title: 'BEST 0% APR CREDIT CARD',
            cardName: 'Wells Fargo Active Cash Card',
            aprRates: '20.24%, 25.24%, or 29.99% variable APR',
            rateAndFee: 5.0,
            annualFee: '\$0',
            creditScore: 'Excellent, Good (700 - 749)',
            imageUrl: 'lib/assets/creditcard.png',
            imageSourceType: ImageSourceType.asset,
          ),
        ),
      ),
    );
  }
}

class CreditCardWidget extends StatelessWidget {
  final String title;
  final String cardName;
  final String aprRates;
  final double rateAndFee;
  final String annualFee;
  final String creditScore;
  final String imageUrl;
  final ImageSourceType imageSourceType;

  CreditCardWidget({
    required this.title,
    required this.cardName,
    required this.aprRates,
    required this.rateAndFee,
    required this.annualFee,
    required this.creditScore,
    required this.imageUrl,
    this.imageSourceType = ImageSourceType.asset, // Valor padrão é 'asset'
  });

  Widget _buildImage() {
    if (imageSourceType == ImageSourceType.asset) {
      return Image.asset(imageUrl);
    } else {
      return Image.network(imageUrl);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Color(0xFFB7E7FD),
                borderRadius: BorderRadius.circular(6.0),
              ),
              child: Text(title,
                  style: TextStyle(fontSize: 15, color: Colors.black)),
            ),
            SizedBox(height: 12.0),
            Text(cardName,
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                    color: Colors.black)),
            SizedBox(height: 12.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: _buildImage()),
                SizedBox(width: 12.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Rates & Fee', style: TextStyle(fontSize: 16)),
                      Container(
                        padding: EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(4.0),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(6.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 1,
                                        blurRadius: 1,
                                        offset: Offset(0, 1),
                                      ),
                                    ],
                                  ),
                                  child: Text('$rateAndFee',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                ),
                                Row(
                                  children: List.generate(
                                      rateAndFee.toInt(),
                                      (index) => Icon(Icons.star,
                                          color: Color(0xFFFFC109),
                                          size: 18.0)),
                                ),
                              ],
                            ),
                            SizedBox(height: 8.0),
                            Text(annualFee, style: TextStyle(fontSize: 16)),
                            SizedBox(height: 4.0),
                            Text('Annual Fee', style: TextStyle(fontSize: 14)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.0),
            Text(aprRates, style: TextStyle(fontSize: 14)),
            SizedBox(height: 8.0),
            Text(creditScore,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            SizedBox(height: 12.0),
            CustomButton(
              styleType: ButtonStyleType.filled,
              buttonColor: ButtonVariant.primary,
              asset: ButtonAssets.none,
              buttonText: "MORE DETAILS",
              borderRadius: 8.0,
              buttonSize: 25.0,
            ),
          ],
        ),
      ),
    );
  }
}

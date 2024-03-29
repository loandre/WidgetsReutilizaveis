import 'package:flutter/material.dart';
import 'custom_buttons.dart';

enum ImageSourceType {
  asset,
  network,
}

class RatingStar extends StatelessWidget {
  final double rating;

  RatingStar({required this.rating});

  @override
  Widget build(BuildContext context) {
    List<Widget> stars = [];

    for (int i = 1; i <= 5; i++) {
      if (rating > i) {
        stars.add(Icon(Icons.star, color: Color(0xFFFFC109), size: 12.5));
      } else if (rating > i - 1) {
        double filledWidth = 12.5 * (rating - (i - 1));
        stars.add(
          Stack(
            alignment: Alignment.centerLeft,
            children: [
              Icon(Icons.star, color: Colors.grey, size: 12.5),
              Container(
                width: filledWidth,
                decoration: BoxDecoration(),  // Adicionado esta linha.
                child: Icon(Icons.star, color: Color(0xFFFFC109), size: 12.5),
                clipBehavior: Clip.hardEdge,
              )
            ],
          ),
        );
      } else {
        stars.add(Icon(Icons.star, color: Colors.grey, size: 12.5));
      }
    }

    return Row(children: stars);
  }
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Widget Reutilizável')),
        body: const Center(
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

class RatesAndFeeSection extends StatelessWidget {
  final double rateAndFee;
  final String annualFee;

  const RatesAndFeeSection({
    Key? key,
    required this.rateAndFee,
    required this.annualFee,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Align(
          alignment: Alignment.center,
          child: Text('Rates & Fee',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        ),
        const SizedBox(height: 2.0),
        Container(
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: const Color(0xFFF1F4F9),
            borderRadius: BorderRadius.circular(6.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                spreadRadius: 2,
                blurRadius: 10,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE3E6F5),
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    child: Text(rateAndFee.toString(),
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500)),
                  ),
                  RatingStar(
                      rating: rateAndFee), // Usando o widget RatingStar aqui
                ],
              ),
              Text(annualFee,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold)),
              const Text('Annual Fee', style: TextStyle(fontSize: 14)),
            ],
          ),
        ),
      ],
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

  const CreditCardWidget({
    Key? key,
    required this.title,
    required this.cardName,
    required this.aprRates,
    required this.rateAndFee,
    required this.annualFee,
    required this.creditScore,
    required this.imageUrl,
    this.imageSourceType = ImageSourceType.asset,
  }) : super(key: key);

  Widget _buildImage() {
    if (imageSourceType == ImageSourceType.asset) {
      return Image.asset(imageUrl);
    } else {
      return Image.network(imageUrl);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Card(
        color: const Color(0xFFF5F7Fa),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0),
          side: const BorderSide(color: Color(0xFFCDD4DA), width: 1.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: const Color(0xFFB7E7FD),
                  borderRadius: BorderRadius.circular(6.0),
                ),
                child: Text(title,
                    style: const TextStyle(fontSize: 15, color: Colors.black)),
              ),
              const SizedBox(height: 9.0),
              Text(cardName,
                  style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                      color: Colors.black)),
              const SizedBox(height: 8.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(flex: 6, child: _buildImage()),
                  const SizedBox(width: 10.0),
                  Expanded(
                    flex: 4,
                    child: RatesAndFeeSection(
                      rateAndFee: rateAndFee,
                      annualFee: annualFee,
                    ),
                  ),
                ],
              ),
              Divider(color: Colors.grey[300], thickness: 1.0),
              IntrinsicHeight(
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Regular APR",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF979FB2),
                                  fontWeight: FontWeight.w400)),
                          const SizedBox(height: 4.0),
                          Text(aprRates,
                              style: const TextStyle(
                                  fontSize: 14.5,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black)),
                        ],
                      ),
                    ),
                    Container(
                      width: 1.0,
                      height: double.infinity,
                      color: Colors.grey[300],
                    ),
                    const SizedBox(width: 8.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Credit Score",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF979FB2),
                                  fontWeight: FontWeight.w400)),
                          const SizedBox(height: 4.0),
                          Text(creditScore,
                              style: const TextStyle(
                                  fontSize: 14.5,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16.0),
              const CustomButton(
                styleType: ButtonStyleType.filled,
                buttonColor: ButtonVariant.primary,
                buttonText: "MORE DETAILS",
                borderRadius: 8.0,
                buttonSize: 25.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
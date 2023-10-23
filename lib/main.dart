import 'package:flutter/material.dart';
import 'package:ui_components/ui_components/widgets/custom_buttons.dart';
import 'package:ui_components/ui_components/widgets/textfield.dart';
import 'package:ui_components/ui_components/widgets/card_information.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget _space() => const SizedBox(height: 20);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: CustomTextField(
                  labelText: "Label",
                  supportingText: "Supporting text",
                  showLabel: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ),
              _space(),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: CustomTextField(
                  labelText: "Label",
                  supportingText: "Supporting text",
                  showLabel: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ),
              _space(),

              // Adicionando o widget CardInformation
              const CreditCardWidget(
                title: 'BEST 0% APR CREDIT CARD',
                cardName: 'Wells Fargo Active Cash Card',
                aprRates: '20.24%, 25.24%, or 29.99% variable APR',
                rateAndFee: 5.0,
                annualFee: '\$0',
                creditScore: 'Excellent, Good (700 - 749)',
                imageUrl:
                    'lib/assets/creditcard.png', // Substitua por sua URL real aqui
                imageSourceType:
                    ImageSourceType.asset, // Indicando que é uma imagem de URL
              ),

              _space(),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: _buildPrimaryButtons(),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: _buildSecondaryButtons(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildPrimaryButtons() {
    return [
      const CustomButton(
        styleType: ButtonStyleType.filled,
        buttonColor: ButtonVariant.primary,
        asset: ButtonAssets.image,
        imagePath: 'lib/assets/eth.png',
        buttonText: "Button",
        borderRadius: 8.0,
        buttonSize: 25.0,
      ),
      _space(),
      const CustomButton(
        styleType: ButtonStyleType.filled,
        buttonColor: ButtonVariant.primary,
        asset: ButtonAssets.add_photo_alternate,
        buttonText: "Button",
        borderRadius: 8.0,
        buttonSize: 25.0,
      ),
      _space(),
      const CustomButton(
        styleType: ButtonStyleType.outlined,
        buttonColor: ButtonVariant.primary,
        asset: ButtonAssets.add,
        buttonText: "Button",
        borderRadius: 10.0,
        buttonSize: 30.0,
      ),
      _space(),
      const CustomButton(
        styleType: ButtonStyleType.transparent,
        buttonColor: ButtonVariant.primary,
        asset: ButtonAssets.none,
        buttonText: "Button",
        borderRadius: 0.0,
        buttonSize: 30.0,
      ),
      _space(),
    ];
  }

  List<Widget> _buildSecondaryButtons() {
    return [
      const CustomButton(
        styleType: ButtonStyleType.filled,
        buttonColor: ButtonVariant.secondary,
        asset: ButtonAssets.image,
        imagePath: 'lib/assets/eth.png',
        buttonText: "Que Loucura!",
        borderRadius: 8.0,
        buttonSize: 25.0,
      ),
      _space(),
      const CustomButton(
        styleType: ButtonStyleType.filled,
        buttonColor: ButtonVariant.secondary,
        asset: ButtonAssets.add_photo_alternate,
        buttonText: "Que Loucura!",
        borderRadius: 8.0,
        buttonSize: 25.0,
      ),
      _space(),
      const CustomButton(
        styleType: ButtonStyleType.outlined,
        buttonColor: ButtonVariant.secondary,
        asset: ButtonAssets.add,
        buttonText: "Que Loucura!",
        borderRadius: 10.0,
        buttonSize: 30.0,
      ),
      _space(),
      const CustomButton(
        styleType: ButtonStyleType.transparent,
        buttonColor: ButtonVariant.secondary,
        asset: ButtonAssets.none,
        buttonText: "Que Loucura!",
        borderRadius: 0.0,
        buttonSize: 30.0,
      ),
      _space(),
    ];
  }
}

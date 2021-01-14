import 'package:flutter/material.dart';
import 'constants.dart';
import 'reuseable_card.dart';
import 'bottom_button.dart';
import 'package:admob_flutter/admob_flutter.dart';

class ResultsPage extends StatefulWidget {
  ResultsPage(
      {@required this.bmiResult,
      @required this.resultText,
      @required this.interpretation});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  _ResultsPageState createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  AdmobInterstitial _admobInterstitial;

  @override
  void initState() {
    _admobInterstitial = createAdvert();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('คำนวนดัชนีมวลกาย BMI'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 9,
            child: ReusableCard(
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    widget.resultText,
                    style: kResultTextStyle,
                  ),
                  Text(
                    widget.bmiResult,
                    style: kBMITextStyle,
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Text(
                      widget.interpretation,
                      style: kBodyTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: BottomButton(
                onTap: () {
                  _admobInterstitial.load();
                  Navigator.pop(context);
                },
                buttonTitle: 'กลับหน้าแรก'),
          )
        ],
      ),
    );
  }

  AdmobInterstitial createAdvert() {
    return AdmobInterstitial(
        adUnitId: 'ca-app-pub-9743744880206393/4068842336',
        listener: (AdmobAdEvent event, Map<String, dynamic> args) {
          if (event == AdmobAdEvent.loaded) {
            _admobInterstitial.show();
          } else if (event == AdmobAdEvent.closed) {
            _admobInterstitial.dispose();
          }
        });
  }
}

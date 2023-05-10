import 'package:luminexa_mobile/widgets/barChart/individualBar.dart';

class currentIntensity {
  final double IntensityHourOne;
  final double IntensityHourTwo;
  final double IntensityHourThree;
  final double IntensityHourFour;
  final double IntensityHourFive;
  final double IntensityHourSix;
  final double IntensityHourSeven;

  currentIntensity({
    required this.IntensityHourOne,
    required this.IntensityHourTwo,
    required this.IntensityHourThree,
    required this.IntensityHourFour,
    required this.IntensityHourFive,
    required this.IntensityHourSix,
    required this.IntensityHourSeven,
  });

  List<individualBar> barData = [];

  void initializeBarData() {
    barData = [
      individualBar(x: 11, y: IntensityHourOne),
      individualBar(x: 12, y: IntensityHourTwo),
      individualBar(x: 1, y: IntensityHourThree),
      individualBar(x: 2, y: IntensityHourFour),
      individualBar(x: 3, y: IntensityHourFive),
      individualBar(x: 4, y: IntensityHourSix),
      individualBar(x: 5, y: IntensityHourSeven),
    ];
  }
}

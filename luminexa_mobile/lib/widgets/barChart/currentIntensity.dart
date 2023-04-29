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
      individualBar(x: 0, y: IntensityHourOne),
      individualBar(x: 1, y: IntensityHourTwo),
      individualBar(x: 2, y: IntensityHourThree),
      individualBar(x: 3, y: IntensityHourFour),
      individualBar(x: 4, y: IntensityHourFive),
      individualBar(x: 5, y: IntensityHourSix),
      individualBar(x: 6, y: IntensityHourSeven),
    ];
  }
}

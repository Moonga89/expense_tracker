import 'individual_bar_chart.dart';

class BarData {
  final double sunAmount;
  final double monAmount;
  final double tueAmount;
  final double wedAmount;
  final double thurAmount;
  final double friAmount;
  final double satAmount;

  BarData({
    required this.sunAmount,
    required this.monAmount,
    required this.tueAmount,
    required this.wedAmount,
    required this.thurAmount,
    required this.friAmount,
    required this.satAmount,
  });

  List<IndividualBar> barData = [];

  // Initialize bar data
  void initializeBarData() {
    barData = [
    // Sunday
    IndividualBar(x: 0, y: sunAmount),

    // Monday
    IndividualBar(x: 1, y: monAmount),

    // Tuesday
    IndividualBar(x: 2, y: tueAmount),

    // Wednesday
    IndividualBar(x: 3, y: wedAmount),

    // Thursday
    IndividualBar(x: 4, y: thurAmount),

    // Friday
    IndividualBar(x: 5, y: friAmount),

    // Saturday
    IndividualBar(x: 6, y: satAmount)

    ];

  }
}
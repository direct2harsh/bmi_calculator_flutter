import 'dart:math';

class BmiBrain {
  final int height;
  final int weight;
  BmiBrain({this.weight, this.height});
  double _bmi;
  String calculate() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'normal';
    } else {
      return 'Underweight';
    }
  }

  String getIneterpretation() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight .Try to exercise more.';
    } else if (_bmi > 18.5) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower than normal body weight.';
    }
  }
}

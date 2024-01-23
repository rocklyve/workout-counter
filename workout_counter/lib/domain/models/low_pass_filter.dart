class LowPassFilter {
  double alpha;
  double currentValue;

  LowPassFilter({required this.alpha, this.currentValue = 0.0});

  double filter(double newValue) {
    currentValue = alpha * newValue + (1.0 - alpha) * currentValue;

    return currentValue;
  }
}

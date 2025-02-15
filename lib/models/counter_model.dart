/// A simple counter model that tracks a count value.
class CounterModel {
  int count;

  CounterModel({this.count = 0});

  @override
  String toString() => 'CounterModel(count: $count)';
}

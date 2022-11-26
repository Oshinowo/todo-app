part of 'counter_bloc.dart';

class CounterState extends Equatable {
  final int counter;

  const CounterState({required this.counter});

  factory CounterState.initial() {
    return const CounterState(counter: 0);
  }

  CounterState copyWith({
    int? counter,
  }) {
    return CounterState(
      counter: counter ?? this.counter,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [counter];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'counter': counter,
    };
  }

  factory CounterState.fromMap(Map<String, dynamic> map) {
    return CounterState(
      counter: map['counter'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory CounterState.fromJson(String source) =>
      CounterState.fromMap(json.decode(source) as Map<String, dynamic>);
}

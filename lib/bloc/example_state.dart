part of 'example_bloc.dart';



abstract class ExampleState extends Equatable {
  const ExampleState();

  @override
  List<Object?> get props => [];
}

class CovidInitial extends ExampleState {}

class CovidLoading extends ExampleState {

}

class CovidLoaded extends ExampleState {
  final CovidModel covidModel;
  const CovidLoaded(this.covidModel);

  @override
  List<Object?> get props => [covidModel];
}

class CovidError extends ExampleState {
  final String? message;
  const CovidError(this.message);
  @override
  List<Object?> get props => [message];
}
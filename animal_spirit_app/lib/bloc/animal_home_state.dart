import 'package:animal_spirit_app/model/animal.dart';

/// Class to hold the state of the main Animals Home Page
class AnimalHomeState {
  AnimalHomeState({
    required this.isLoading,
    required this.dataFechted,
    required this.animals,
    required this.error,
  });

  /// The initial State of the Home
  factory AnimalHomeState.initial() => AnimalHomeState(
        isLoading: false,
        dataFechted: false,
        animals: [],
        error: false,
      );

  /// The state that indicates that the home is loading
  factory AnimalHomeState.isLoading() => AnimalHomeState(
        isLoading: true,
        dataFechted: false,
        animals: [],
        error: false,
      );

  /// States tha indicate the data was fetchted with success
  /// Along with the data that was fetched
  factory AnimalHomeState.fetched({
    required List<Animal> animals,
  }) =>
      AnimalHomeState(
        isLoading: false,
        dataFechted: true,
        animals: animals,
        error: false,
      );

  /// The state that indicates a error ocurred
  factory AnimalHomeState.error() => AnimalHomeState(
        isLoading: false,
        dataFechted: false,
        animals: [],
        error: true,
      );

  final bool isLoading;
  final bool dataFechted;
  final List<Animal> animals;
  final bool error;
}

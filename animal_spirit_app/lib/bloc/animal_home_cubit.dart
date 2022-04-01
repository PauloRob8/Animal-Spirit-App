import 'package:animal_spirit_app/bloc/animal_home_state.dart';
import 'package:animal_spirit_app/data/fake_data_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnimalHomeCubit extends Cubit<AnimalHomeState> {
  AnimalHomeCubit() : super(AnimalHomeState.initial());

  final _dataRepository = FakeDataRepository();

  /// Gets the list of animals from our local repository
  Future<void> getAllData() async {
    emit(AnimalHomeState.isLoading());
    try {
      final animalsList = await _dataRepository.getallAnimals();

      emit(AnimalHomeState.fetched(animals: animalsList));
    } on Exception {
      emit(AnimalHomeState.error());
    }
  }
}

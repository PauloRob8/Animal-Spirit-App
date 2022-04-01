import 'package:animal_spirit_app/bloc/animal_home_cubit.dart';
import 'package:animal_spirit_app/bloc/animal_home_state.dart';
import 'package:animal_spirit_app/model/animal.dart';
import 'package:animal_spirit_app/pages/home/animals_home_page.dart';
import 'package:animal_spirit_app/pages/widgets/animal_card_widget.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Create a Mock of the Animal Home Cubit so we can manipulate it for test
class _MockAnimalHomeCubit extends MockCubit<AnimalHomeState>
    implements AnimalHomeCubit {}

final _animalsList = [
  Animal(
    description: 'test',
    imagePath: 'assets/doggy.jpeg',
    location: 'On a test',
    maxAge: 20,
    name: 'Homo Sapiens',
    type: 'a test of course',
  ),
  Animal(
    description: 'test',
    imagePath: 'assets/doggy.jpeg',
    location: 'On a test',
    maxAge: 20,
    name: 'Homo Sapiens',
    type: 'a test of course',
  ),
];

late AnimalHomeCubit cubit;
void main() {
  setUp(() {
    cubit = _MockAnimalHomeCubit();
  });

  setUpAll(() {
    registerFallbackValue(AnimalHomeState.isLoading());
  });

  testWidgets('Test find animals cards widgets on home', (tester) async {
    // Mock a call to the state, once is called we return the state that we want
    when(() => cubit.state).thenReturn(AnimalHomeState.fetched(
      animals: _animalsList,
    ));

    await _createWidget(tester);

    expect(find.byType(AnimalCardWidget), findsNWidgets(2));
  });

  testWidgets('Test loading state', (tester) async {
    // Mock a call to the state, once is called we return the state that we want
    when(() => cubit.state).thenReturn(AnimalHomeState.isLoading());

    await _createWidget(tester);

    expect(find.byType(AnimalCardWidget), findsNothing);
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('Test error state', (tester) async {
    // Mock a call to the state, once is called we return the state that we want
    when(() => cubit.state).thenReturn(AnimalHomeState.error());

    await _createWidget(tester);

    expect(find.byType(AnimalCardWidget), findsNothing);
    expect(find.widgetWithText(MaterialButton, 'RELOAD DATA'), findsOneWidget);
  });
}

Future<void> _createWidget(
  WidgetTester tester,
) async {
  await tester.pumpWidget(
    MaterialApp(
      home: BlocProvider<AnimalHomeCubit>.value(
        value: cubit,
        child: const AnimalsHomePage(),
      ),
    ),
  );

  await tester.pump();
}

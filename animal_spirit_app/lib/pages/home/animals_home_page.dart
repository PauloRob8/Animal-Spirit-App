import 'package:animal_spirit_app/bloc/animal_home_cubit.dart';
import 'package:animal_spirit_app/bloc/animal_home_state.dart';
import 'package:animal_spirit_app/pages/widgets/animal_card_widget.dart';
import 'package:animal_spirit_app/pages/widgets/logo_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnimalsHomePage extends StatefulWidget {
  const AnimalsHomePage({Key? key}) : super(key: key);

  /// Crates a route to navigate for this page
  /// Creating the Cubit once is called
  static PageRoute<dynamic> route() => MaterialPageRoute(
        builder: (_) => BlocProvider<AnimalHomeCubit>(
          create: (_) => AnimalHomeCubit()..getAllData(),
          child: const AnimalsHomePage(),
        ),
      );

  @override
  State<AnimalsHomePage> createState() => _AnimalsHomeState();
}

class _AnimalsHomeState extends State<AnimalsHomePage> {
  AnimalHomeCubit get cubit => context.read<AnimalHomeCubit>();

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.blue[50],
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 190, 219, 243),
          elevation: 0.0,
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(Icons.logout),
            ),
          ],
          title: const LogoTextWidget(),
        ),
        body: BlocBuilder<AnimalHomeCubit, AnimalHomeState>(
          builder: _builder,
        ),
      );

  /// Handles the state, showing widgets based on the current state
  Widget _builder(BuildContext context, AnimalHomeState state) {
    if (state.isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (state.error) {
      return Center(
        child: MaterialButton(
          color: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: const Text(
            'RELOAD DATA',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          onPressed: () => cubit.getAllData(),
        ),
      );
    }
    return ListView.builder(
      itemCount: state.animals.length,
      itemBuilder: (context, index) {
        return AnimalCardWidget(animal: state.animals[index]);
      },
    );
  }
}

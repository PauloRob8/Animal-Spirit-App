import 'package:animal_spirit_app/data/fake_data_repository.dart';
import 'package:animal_spirit_app/model/animal.dart';
import 'package:animal_spirit_app/pages/widgets/animal_card_widget.dart';
import 'package:animal_spirit_app/pages/widgets/logo_text_widget.dart';
import 'package:flutter/material.dart';

class AnimalsHomePage extends StatefulWidget {
  const AnimalsHomePage({Key? key}) : super(key: key);

  @override
  State<AnimalsHomePage> createState() => _AnimalsHomeState();
}

class _AnimalsHomeState extends State<AnimalsHomePage> {
  late List<Animal> animals;
  late FakeDataRepository repository;
  @override
  void initState() {
    super.initState();

    repository = FakeDataRepository();
    animals = [];
  }

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
        body: _buildBody(),
      );

  Widget _buildBody() {
    if (animals.isEmpty) {
      return Center(
        child: MaterialButton(
          color: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: const Text(
            'CLICK TO LOAD COOL ANIMAL DATA',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          onPressed: () async {
            final data = await repository.getallAnimals();
            setState(() {
              animals = data;
            });
          },
        ),
      );
    } else {
      return ListView.builder(
        itemCount: animals.length,
        itemBuilder: (context, index) {
          return AnimalCardWidget(animal: animals[index]);
        },
      );
    }
  }
}

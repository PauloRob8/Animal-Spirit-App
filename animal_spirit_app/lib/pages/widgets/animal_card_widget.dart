import 'package:animal_spirit_app/model/animal.dart';
import 'package:flutter/material.dart';

class AnimalCardWidget extends StatelessWidget {
  const AnimalCardWidget({
    required this.animal,
    Key? key,
  }) : super(key: key);

  final Animal animal;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(12.0),
        child: Card(
          elevation: 0.0,
          color: Colors.blueGrey[300],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              20.0,
            ),
          ),
          child: Column(
            children: [
              Image.asset(
                animal.imagePath,
                fit: BoxFit.contain,
              ),
              ExpansionTile(
                title: Text(
                  animal.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 24.0,
                  ),
                ),
                collapsedTextColor: Colors.black,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Container(
                      height: 5.0,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  _makeDescriptionsText('Type: ', animal.type),
                  const SizedBox(
                    height: 15.0,
                  ),
                  _makeDescriptionsText('Max Age: ', animal.maxAge.toString()),
                  const SizedBox(
                    height: 15.0,
                  ),
                  _makeDescriptionsText('Where to find: ', animal.location),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: _makeDescriptionsText(
                      'More info: \n',
                      animal.description,
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                ],
              ),
            ],
          ),
        ),
      );

  Widget _makeDescriptionsText(String label, String text) => RichText(
        textAlign: TextAlign.start,
        text: TextSpan(
          children: [
            TextSpan(
              text: label,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
                color: Colors.white,
              ),
            ),
            TextSpan(
              text: text,
              style: const TextStyle(
                fontSize: 14.0,
              ),
            ),
          ],
        ),
      );
}

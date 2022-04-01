import 'package:animal_spirit_app/model/animal.dart';
import 'package:animal_spirit_app/pages/widgets/animal_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

final testAnimal = Animal(
  description: 'test',
  imagePath: 'assets/doggy.jpeg',
  location: 'On a test',
  maxAge: 20,
  name: 'Homo Sapiens',
  type: 'a test of course',
);

void main() {
  testWidgets('Test a animal card widget components', (tester) async {
    await _createWidget(tester, animal: testAnimal);

    // Finds image and esnure that is the provided image
    final image = tester.widget<Image>(find.byType(Image));
    expect(
      (image.image as AssetImage).assetName,
      testAnimal.imagePath,
    );
    expect(find.text(testAnimal.name), findsOneWidget);

    expect(find.byType(RichText), findsNWidgets(2));

    // Initially dont show the others componets cause they are hidden
    expect(find.text('Type: ${testAnimal.type}'), findsNothing);

    // Tap the widget to expand
    await tester.tap(find.byType(ExpansionTile));

    await tester.pump();
    await tester.pump();
    await tester.pumpAndSettle();

    // Now find the remaining components
    expect(find.byType(RichText), findsNWidgets(6));
  });
}

Future<void> _createWidget(
  WidgetTester tester, {
  required Animal animal,
}) async {
  await tester.pumpWidget(
    MaterialApp(
      home: AnimalCardWidget(
        animal: animal,
      ),
    ),
  );

  await tester.pump();
}

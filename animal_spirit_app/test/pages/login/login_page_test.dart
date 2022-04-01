import 'package:animal_spirit_app/pages/login/login_page.dart';
import 'package:animal_spirit_app/pages/widgets/logo_text_widget.dart';
import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Tests to ensure corrects widgets appear on login page',
      (tester) async {
    await _createWidget(tester);

    // Finds image and esnure that is the cat avatar image
    final image = tester.widget<CircleAvatar>(find.byType(CircleAvatar));
    expect(
      (image.backgroundImage as AssetImage).assetName,
      'assets/kitten_avatar.jpeg',
    );

    // Finds the Logo
    expect(find.byType(LogoTextWidget), findsOneWidget);

    expect(
        find.text('Come and see cool facts about animals !'), findsOneWidget);

    // Finds the text fields of login page
    expect(find.byType(TextFormField), findsNWidgets(2));

    expect(find.widgetWithText(MaterialButton, 'LOGIN'), findsOneWidget);

    expect(find.text('Sign Up for free !'), findsOneWidget);
  });

  testWidgets(
      'Test enter empty text on login field should show invalid login error text',
      (tester) async {
    await _createWidget(tester);

    await tester.enterText(find.byType(TextFormField).first, '');
    await tester.pump();
    await tester.pump();

    await tester.tap(find.widgetWithText(MaterialButton, 'LOGIN'));
    await tester.pump();
    await tester.pump();

    expect(find.text('Insert your email to proceed!'), findsOneWidget);
  });

  testWidgets(
      'Test enter empty text on password field should show invalid password error text',
      (tester) async {
    await _createWidget(tester);

    await tester.enterText(find.byType(TextFormField).first, 'email@com');
    await tester.enterText(find.byType(TextFormField).last, '');
    await tester.pump();
    await tester.pump();

    await tester.tap(find.widgetWithText(MaterialButton, 'LOGIN'));
    await tester.pump();
    await tester.pump();

    // The email text isnt empty anymore, so shouldnt show this text
    expect(find.text('Insert your email to proceed!'), findsNothing);
    // Must show only the password error text
    expect(find.text('Insert your password!'), findsOneWidget);
  });
}

Future<void> _createWidget(
  WidgetTester tester,
) async {
  await tester.pumpWidget(
    const MaterialApp(
      home: LoginPage(),
    ),
  );

  await tester.pump();
}

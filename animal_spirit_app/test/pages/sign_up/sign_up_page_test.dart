import 'package:animal_spirit_app/pages/sing_up/sign_up_page.dart';
import 'package:animal_spirit_app/pages/widgets/logo_text_widget.dart';
import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Tests to ensure corrects widgets appear on sing up page',
      (tester) async {
    await _createWidget(tester);

    // Finds the Logo
    expect(find.byType(LogoTextWidget), findsOneWidget);

    // Finds the text fields of login page
    expect(find.byType(TextFormField), findsNWidgets(3));

    expect(find.widgetWithText(MaterialButton, 'SIGN UP'), findsOneWidget);

    expect(find.widgetWithText(MaterialButton, 'BACK'), findsOneWidget);
  });

  testWidgets(
      'Test enter empty text on login field should show invalid login error text',
      (tester) async {
    await _createWidget(tester);

    await tester.enterText(find.byType(TextFormField).first, '');
    await tester.pump();
    await tester.pump();

    await tester.tap(find.widgetWithText(MaterialButton, 'SIGN UP'));
    await tester.pump();
    await tester.pump();

    expect(find.text('Insert your email to proceed!'), findsOneWidget);
  });

  testWidgets(
      'Test enter empty text on password field should show invalid passwords error text',
      (tester) async {
    await _createWidget(tester);

    await tester.enterText(find.byType(TextFormField).first, 'email@com');
    await tester.enterText(find.byType(TextFormField).last, '');
    await tester.pump();
    await tester.pump();

    await tester.tap(find.widgetWithText(MaterialButton, 'SIGN UP'));
    await tester.pump();
    await tester.pump();

    // The email text isnt empty anymore, so shouldnt show this text
    expect(find.text('Insert your email to proceed!'), findsNothing);
    // Must show only the password error text and the confirm password text
    expect(find.text('Insert your password to proceed!'), findsOneWidget);
    expect(find.text('Confirm your password!'), findsOneWidget);
  });
  testWidgets('Test find error text when passwords doesnt match',
      (tester) async {
    await _createWidget(tester);

    await tester.enterText(find.byType(TextFormField).first, 'email@com');
    await tester.enterText(find.byType(TextFormField).at(1), '123');
    await tester.enterText(find.byType(TextFormField).last, '1234');
    await tester.pump();
    await tester.pump();

    await tester.tap(find.widgetWithText(MaterialButton, 'SIGN UP'));
    await tester.pump();
    await tester.pump();

    // The email text isnt empty anymore, so shouldnt show this text
    expect(find.text('Insert your email to proceed!'), findsNothing);
    expect(find.text('Insert your password to proceed!'), findsNothing);
    // Must show only the password doesnt match text
    expect(find.text('Passwords doesnt match!'), findsOneWidget);
  });
}

Future<void> _createWidget(
  WidgetTester tester,
) async {
  await tester.pumpWidget(
    const MaterialApp(
      home: SignUpPage(),
    ),
  );

  await tester.pump();
}

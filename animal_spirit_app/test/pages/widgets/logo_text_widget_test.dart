import 'package:animal_spirit_app/pages/widgets/logo_text_widget.dart';
import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Test widget', (tester) async {
    await _createWidget(tester);

    final textWidget = tester.widget<RichText>(find.byType(RichText));

    expect(textWidget.text.toPlainText(), 'Animal Spirit');
  });
}

Future<void> _createWidget(
  WidgetTester tester,
) async {
  await tester.pumpWidget(
    const MaterialApp(
      home: LogoTextWidget(),
    ),
  );

  await tester.pump();
}

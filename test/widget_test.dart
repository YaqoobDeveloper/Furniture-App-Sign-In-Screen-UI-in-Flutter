import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:furniture_app/main.dart';

void main() {
  testWidgets('shows validation errors on empty submit', (tester) async {
    await tester.pumpWidget(const FurnitureApp());

    await tester.tap(find.widgetWithText(FilledButton, 'Sign In'));
    await tester.pump();

    expect(find.text('Please enter your email'), findsOneWidget);
    expect(find.text('Please enter your password'), findsOneWidget);
  });
}

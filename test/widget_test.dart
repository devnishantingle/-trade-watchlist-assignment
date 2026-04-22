import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:assgnment/main.dart';

void main() {
  testWidgets('shows watchlist screen with dummy stocks', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const Assgnment());
    await tester.pumpAndSettle();

    expect(find.text('Watchlist'), findsWidgets);
    expect(find.text('Watchlist 1'), findsOneWidget);
    expect(find.text('RELIANCE'), findsOneWidget);
    expect(find.text('HDFCBANK'), findsOneWidget);
  });

  testWidgets('opens edit watchlist screen', (WidgetTester tester) async {
    await tester.pumpWidget(const Assgnment());
    await tester.pumpAndSettle();

    await tester.tap(find.byIcon(Icons.edit_outlined).first);
    await tester.pumpAndSettle();

    expect(find.text('Edit Watchlist 1'), findsOneWidget);
    expect(find.text('Save Watchlist'), findsOneWidget);
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_learn/main.dart';

void main(){
  testWidgets('Testing Next button !!!', (WidgetTester tester) async{   //test for 'Next' button
    await tester.pumpWidget(MyApp());

    await tester.tap(find.text('Next'));
    await tester.pump();

    expect(find.text('Next Button Tapped !!!'), findsOneWidget);

    //await tester.pumpAndSettle(const Duration(seconds: 10));
  });

  testWidgets('Testing Like button !!!', (WidgetTester tester) async{   //test for 'Like' button
    await tester.pumpWidget(MyApp());

    await tester.tap(find.text('Like'));
    await tester.pump();

    expect(find.text('Like Button Tapped !!!'), findsOneWidget);

    //await tester.pumpAndSettle(const Duration(seconds: 10));
  });

  testWidgets('Checking the favorite page !!!', (WidgetTester tester) async{   //test for empty favorite screen
    await tester.pumpWidget(MyApp());

    await tester.tap(find.text('Favorites'));
    await tester.pump();

    expect(find.text('No favorites yet.'), findsOneWidget);

    await tester.pumpAndSettle(const Duration(seconds: 10));
  });

  testWidgets('Checking the list of favorites in its page !!!', (WidgetTester tester) async{   //test for favorite screen after hitting like
    await tester.pumpWidget(MyApp());
    for(int i=0; i<4; i++){
      await tester.tap(find.text('Like'));
      await tester.pump();
      await tester.tap(find.text('Next'));
      await tester.pump();
    }
    await tester.tap(find.text('Favorites'));
    await tester.pump();
    expect(find.text('You have 4 favorites:'), findsOneWidget);

    await tester.pumpAndSettle(const Duration(seconds: 10));
  });
}
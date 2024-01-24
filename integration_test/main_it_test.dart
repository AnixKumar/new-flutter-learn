import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_learn/main.dart';

void main(){
  group('Test full flow of App', () {
    testWidgets('The app flow!!!', (WidgetTester tester) async{
      await tester.pumpWidget(MyApp());
      await tester.pumpAndSettle(const Duration(seconds: 3));

      await tester.tap(find.byIcon(Icons.favorite));
      await tester.pumpAndSettle(const Duration(seconds: 3));

      expect(find.text('No favorites yet.'), findsOneWidget);       //checking the empty favorites lists

      await tester.tap(find.text('Home')); 
      await tester.pumpAndSettle(const Duration(seconds: 3));       //coming back to home page now

      await tester.tap(find.text('Next'));    
      await tester.pumpAndSettle(const Duration(seconds: 3));

      expect(find.text('Next Button Tapped !!!'), findsOneWidget);  //checking functionality of Next button (1)

      //await tester.pumpWidget(MyApp());

      await tester.tap(find.text('Like'));
      await tester.pumpAndSettle(const Duration(seconds: 3));

      expect(find.text('Like Button Tapped !!!'), findsOneWidget);  //checking functionality of Like button (1)

      //await tester.pumpWidget(MyApp());

      await tester.tap(find.text('Next'));
      await tester.pumpAndSettle(const Duration(seconds: 3));

      expect(find.text('Next Button Tapped !!!'), findsOneWidget);  //checking functionality of Next button (2)

      //await tester.pumpWidget(MyApp());

      await tester.tap(find.text('Like'));
      await tester.pumpAndSettle(const Duration(seconds: 3));

      expect(find.text('Like Button Tapped !!!'), findsOneWidget);  //checking functionality of Like button (2)
    });
   });
}
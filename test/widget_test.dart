import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

import 'package:myportofolio_mobile/main.dart';
import 'package:myportofolio_mobile/services/api_client.dart';

void main() {
  testWidgets('Home page renders', (WidgetTester tester) async {
    // Use a phone-sized portrait screen instead of the default 800x600.
    tester.view.physicalSize = const Size(430, 932);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);

    // Fake HTTP client so the test never touches the real network.
    final apiClient = ApiClient(
      client: MockClient((request) async => http.Response('[]', 200)),
    );

    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp(apiClient: apiClient));

    // Verify that the home page is shown.
    expect(find.text('MyPortfolio'), findsOneWidget);
    expect(find.text('Selamat datang di MyPortfolio Mobile!'), findsOneWidget);
  });
}

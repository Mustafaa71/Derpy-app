import 'package:derpy/View/derpy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  final apiKey = dotenv.env['API_KEY'];
  final url = dotenv.env['PROJECT_URL'];

  if (apiKey == null || url == null) {
    throw Exception('API_KEY and PROJECT_URL must be set in .env file');
  }

  await Supabase.initialize(
    url: url,
    anonKey: apiKey,
  );
  runApp(
    const ProviderScope(
      child: Derpy(),
    ),
  );
}

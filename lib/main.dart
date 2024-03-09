import 'package:derpy/View/derpy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://huhpecopmraolbvshwdy.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imh1aHBlY29wbXJhb2xidnNod2R5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTk1NTc0NTIsImV4cCI6MjAxNTEzMzQ1Mn0.dWuaBmg_ncxxxT3ShOlNZjQ2ujWjbYt2wJqUQpxJ1kY',
  );
  runApp(const ProviderScope(child: Derpy()));
}

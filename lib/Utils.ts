import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  await Supabase.initialize(
    url: 'https://duofmjhkxdnsognnazif.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImR1b2ZtamhreGRuc29nbm5hemlmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDQ2NjU0MzksImV4cCI6MjAyMDI0MTQzOX0.V6DQTTVJxV8uKxOIqWdw4G47lO0ER3LoosN70brvaJo',
  );
  runApp(MyApp());
}
        

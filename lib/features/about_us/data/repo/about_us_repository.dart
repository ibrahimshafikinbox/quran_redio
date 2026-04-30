import 'package:splash/features/about_us/data/models/about_us_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AboutUsRepository {
  final SupabaseClient _client = Supabase.instance.client;

  Future<AboutUsModel> fetchAboutUs() async {
    final response = await _client.from('about_us').select().limit(1).single();

    return AboutUsModel.fromJson(response);
  }
}

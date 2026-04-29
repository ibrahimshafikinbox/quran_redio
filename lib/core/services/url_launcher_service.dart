import 'package:url_launcher/url_launcher.dart' as launcher;

class UrlLauncherService {
  UrlLauncherService._();

  static Future<void> launchCustomUrl(String url) async {
    final uri = Uri.parse(url);
    if (await launcher.canLaunchUrl(uri)) {
      await launcher.launchUrl(uri, mode: launcher.LaunchMode.externalApplication);
    }
  }

  static Future<void> launchWhatsApp(String phone) async {
    final cleaned = phone.replaceAll(RegExp(r'[^0-9+]'), '');
    final url = 'https://wa.me/$cleaned';
    await launchCustomUrl(url);
  }
}

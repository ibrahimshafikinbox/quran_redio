class AboutUsModel {
  final int id;
  final String companyName;
  final String companySpecialty;
  final String email;
  final String website;
  final String phone;
  final String? facebookUrl;
  final String? twitterUrl;
  final String? linkedinUrl;
  final String? appStoreUrl;
  final String? playStoreUrl;

  const AboutUsModel({
    required this.id,
    required this.companyName,
    required this.companySpecialty,
    required this.email,
    required this.website,
    required this.phone,
    this.facebookUrl,
    this.twitterUrl,
    this.linkedinUrl,
    this.appStoreUrl,
    this.playStoreUrl,
  });

  factory AboutUsModel.fromJson(Map<String, dynamic> json) {
    return AboutUsModel(
      id: json['id'] as int,
      companyName: json['company_name'] as String,
      companySpecialty: json['company_specialty'] as String,
      email: json['email'] as String,
      website: json['website'] as String,
      phone: json['phone'] as String,
      facebookUrl: json['facebook_url'] as String?,
      twitterUrl: json['twitter_url'] as String?,
      linkedinUrl: json['linkedin_url'] as String?,
      appStoreUrl: json['app_store_url'] as String?,
      playStoreUrl: json['play_store_url'] as String?,
    );
  }
}

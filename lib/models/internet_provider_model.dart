class InternetProviderModel {
  InternetProviderModel({
    required this.id,
    required this.name,
  });

  final int id;
  final String name;

  factory InternetProviderModel.fromJson(Map<String, dynamic> json) {
    return InternetProviderModel(id: json['id'], name: json['name']);
  }
}

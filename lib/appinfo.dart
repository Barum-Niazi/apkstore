class AppInfo {
  final int id;
  final String name;
  final String image1Url;
  final String image2Url;
  final String image3Url;
  final String image4Url; // Added image4Url
  final String instagramDescription;
  final String category;
  final String downloadLink;
  final String size;
  final double rating;

  AppInfo({
    required this.id,
    required this.name,
    required this.image1Url,
    required this.image2Url,
    required this.image3Url,
    required this.image4Url, // Added image4Url
    required this.instagramDescription,
    required this.category,
    required this.downloadLink,
    required this.size,
    required this.rating,
  });

  factory AppInfo.fromJson(Map<String, dynamic> json) {
    return AppInfo(
      id: json['id'],
      name: json['name'],
      image1Url: json['image1Url'],
      image2Url: json['image2Url'],
      image3Url: json['image3Url'],
      image4Url: json['image4Url'], // Added image4Url
      instagramDescription: json['instagramDescription'],
      category: json['category'],
      downloadLink: json['downloadLink'],
      size: json['size'],
      rating: json['rating'].toDouble(),
    );
  }
}

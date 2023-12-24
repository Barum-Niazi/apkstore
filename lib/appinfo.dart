class AppInfo {
  final int id;
  final String imageUrl;
  final String image1Url;
  final String image2Url;
  final String instagramDescription;
  final String downloadLink;

  AppInfo({
    required this.id,
    required this.imageUrl,
    required this.image1Url,
    required this.image2Url,
    required this.instagramDescription,
    required this.downloadLink,
  });

  factory AppInfo.fromJson(Map<String, dynamic> json) {
    return AppInfo(
      id: json['id'],
      imageUrl: json['imageUrl'],
      image1Url: json['image1Url'],
      image2Url: json['image2Url'],
      instagramDescription: json['instagramDescription'],
      downloadLink: json['downloadLink'],
    );
  }
}

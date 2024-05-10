class Links {
  final String category;
  final String heading;
  final String url;

  Links({
    required this.category,
    required this.heading,
    required this.url,
  });

  factory Links.fromJson(Map<String, dynamic> json) {
    return Links(
      category: json['category'],
      heading: json['heading'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'category': category,
      'heading': heading,
      'url': url,
    };
  }
}

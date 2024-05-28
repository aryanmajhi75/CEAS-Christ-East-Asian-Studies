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

class GeneralInfo {
  final String description;
  final String educationPolicy;

  GeneralInfo({
    required this.description,
    required this.educationPolicy,
  });

  factory GeneralInfo.fromJson(Map<String, dynamic> json) {
    return GeneralInfo(
      description: json['Description'],
      educationPolicy: json['Education_Policy'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Description': description,
      'Education_Policy': educationPolicy,
    };
  }
}

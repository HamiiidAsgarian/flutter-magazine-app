class MyCardItem {
  final String? titel;
  final String? description;
  final String? backgroundImageUrl;
  final String? foregroundImageUrl;
  final String? topGroundImageUrl;
  final String? fullImage;

  MyCardItem(
      {this.titel,
      this.description,
      this.backgroundImageUrl,
      this.foregroundImageUrl,
      this.topGroundImageUrl,
      this.fullImage});

  factory MyCardItem.fromMap(Map<String, dynamic> item) {
    String titel = item["title"];
    String description = item["description"];
    // String titel = item["title"];
    String backgroundImageUrl = item['coverImages']["backgroundImage"];
    String foregroundImageUrl = item['coverImages']["foregroundImage"];
    String topGroundImageUrl = item['coverImages']["effectImage"];
    String fullImage = item['coverImages']["fullImage"];

    return MyCardItem(
        titel: titel,
        description: description,
        backgroundImageUrl: backgroundImageUrl,
        foregroundImageUrl: foregroundImageUrl,
        topGroundImageUrl: topGroundImageUrl,
        fullImage: fullImage);
  }

  static List<Map<String, dynamic>> data = [
    {
      "title": "Spiderman",
      "description": "frinedlySpider",
      "coverImages": {
        "backgroundImage": "assets/images/b1.png",
        "foregroundImage": "assets/images/f1.png",
        "effectImage": "assets/images/e1.png",
        "fullImage": "assets/images/c1.png"
      }
    },
    {
      "title": "Capitan",
      "description": "cap",
      "coverImages": {
        "backgroundImage": "assets/images/b2.png",
        "foregroundImage": "assets/images/f2.png",
        "effectImage": "",
        "fullImage": "assets/images/c2.png"
      }
    },
    {
      "title": "Capitan",
      "description": "cap",
      "coverImages": {
        "backgroundImage": "assets/images/b3.png",
        "foregroundImage": "assets/images/f3.png",
        "effectImage": "assets/images/e3.png",
        "fullImage": "assets/images/c3.png"
      }
    },
    {
      "title": "Capitan",
      "description": "cap",
      "coverImages": {
        "backgroundImage": "assets/images/b4.png",
        "foregroundImage": "assets/images/f4.png",
        "effectImage": "assets/images/e4.png",
        "fullImage": "assets/images/c4.png"
      }
    },
    {
      "title": "Capitan",
      "description": "cap",
      "coverImages": {
        "backgroundImage": "assets/images/b5.png",
        "foregroundImage": "assets/images/f5.png",
        "effectImage": "",
        "fullImage": "assets/images/c5.png"
      }
    }
  ];
}

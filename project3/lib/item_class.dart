class MyCarouselItem {
  final String? titel;
  final String? description;
  final String? backgroundImageUrl;
  final String? foregroundImageUrl;
  final String? topGroundImageUrl;
  final String? fullImage;
  final List<String>? moreImages;

  MyCarouselItem({
    this.titel,
    this.description,
    this.backgroundImageUrl,
    this.foregroundImageUrl,
    this.topGroundImageUrl,
    this.fullImage,
    this.moreImages,
  });

  factory MyCarouselItem.fromMap(Map<String, dynamic> item) {
    String titel = item["title"];
    String description = item["description"];
    // String titel = item["title"];
    String backgroundImageUrl = item['coverImages']["backgroundImage"];
    String foregroundImageUrl = item['coverImages']["foregroundImage"];
    String topGroundImageUrl = item['coverImages']["effectImage"];
    String fullImage = item['coverImages']["fullImage"];
    List<String> moreImages =
        item.containsKey('moreImages') ? item["moreImages"] : [];

    return MyCarouselItem(
        titel: titel,
        description: description,
        backgroundImageUrl: backgroundImageUrl,
        foregroundImageUrl: foregroundImageUrl,
        topGroundImageUrl: topGroundImageUrl,
        fullImage: fullImage,
        moreImages: moreImages);
  }

  static Map<String, dynamic> data = {
    "otherHeroes": [
      {
        "title": "Spiderman",
        "description": "frinedlySpider",
        "coverImages": {
          "backgroundImage": "assets/images/b1.png",
          "foregroundImage": "assets/images/f1.png",
          "effectImage": "assets/images/e1.png",
          "fullImage": "assets/images/i3.png"
        }
      },
      {
        "title": "cap",
        "description": "frinedlySpider",
        "coverImages": {
          "backgroundImage": "assets/images/b1.png",
          "foregroundImage": "assets/images/f1.png",
          "effectImage": "assets/images/e1.png",
          "fullImage": "assets/images/i1.png"
        }
      },
      {
        "title": "hulk",
        "description": "frinedlySpider",
        "coverImages": {
          "backgroundImage": "assets/images/b1.png",
          "foregroundImage": "assets/images/f1.png",
          "effectImage": "assets/images/e1.png",
          "fullImage": "assets/images/i2.png"
        }
      },
      {
        "title": "logan",
        "description": "frinedlySpider",
        "coverImages": {
          "backgroundImage": "assets/images/b1.png",
          "foregroundImage": "assets/images/f1.png",
          "effectImage": "assets/images/e1.png",
          "fullImage": "assets/images/i4.png"
        }
      },
      {
        "title": "iron",
        "description": "frinedlySpider",
        "coverImages": {
          "backgroundImage": "assets/images/b1.png",
          "foregroundImage": "assets/images/f1.png",
          "effectImage": "assets/images/e1.png",
          "fullImage": "assets/images/i5.png"
        }
      },
      {
        "title": "Spiderman",
        "description": "frinedlySpider",
        "coverImages": {
          "backgroundImage": "assets/images/b1.png",
          "foregroundImage": "assets/images/f1.png",
          "effectImage": "assets/images/e1.png",
          "fullImage": "assets/images/i6.png"
        }
      },
    ],
    "carousels": [
      {
        "title": "Spiderman",
        "description": "frinedlySpider",
        "coverImages": {
          "backgroundImage": "assets/images/b1.png",
          "foregroundImage": "assets/images/f1.png",
          "effectImage": "assets/images/e1.png",
          "fullImage": ""
        },
        "moreImages": [
          "assets/images/spider1.png",
          "assets/images/spider2.png",
          "assets/images/spider3.png",
        ]
      },
      {
        "title": "cap",
        "description": "cap",
        "coverImages": {
          "backgroundImage": "assets/images/b2.png",
          "foregroundImage": "assets/images/f2.png",
          "effectImage": "",
          "fullImage": ""
        }
      },
      {
        "title": "hulk",
        "description": "cap",
        "coverImages": {
          "backgroundImage": "assets/images/b3.png",
          "foregroundImage": "assets/images/f3.png",
          "effectImage": "assets/images/e3.png",
          "fullImage": ""
        }
      },
      {
        "title": "logan",
        "description": "cap",
        "coverImages": {
          "backgroundImage": "assets/images/b4.png",
          "foregroundImage": "assets/images/f4.png",
          "effectImage": "assets/images/e4.png",
          "fullImage": ""
        }
      },
      {
        "title": "iron",
        "description": "cap",
        "coverImages": {
          "backgroundImage": "assets/images/b5.png",
          "foregroundImage": "assets/images/f5.png",
          "effectImage": "",
          "fullImage": ""
        }
      },
    ],
  };

  // static List<Map<String, dynamic>> data = [
  // {
  //   "title": "Spiderman",
  //   "description": "frinedlySpider",
  //   "coverImages": {
  //     "backgroundImage": "assets/images/b1.png",
  //     "foregroundImage": "assets/images/f1.png",
  //     "effectImage": "assets/images/e1.png",
  //     "fullImage": "assets/images/c1.png"
  //   }
  // },
  // {
  //   "title": "Capitan",
  //   "description": "cap",
  //   "coverImages": {
  //     "backgroundImage": "assets/images/b2.png",
  //     "foregroundImage": "assets/images/f2.png",
  //     "effectImage": "",
  //     "fullImage": "assets/images/c2.png"
  //   }
  // },
  // {
  //   "title": "Capitan",
  //   "description": "cap",
  //   "coverImages": {
  //     "backgroundImage": "assets/images/b3.png",
  //     "foregroundImage": "assets/images/f3.png",
  //     "effectImage": "assets/images/e3.png",
  //     "fullImage": "assets/images/c3.png"
  //   }
  // },
  // {
  //   "title": "Capitan",
  //   "description": "cap",
  //   "coverImages": {
  //     "backgroundImage": "assets/images/b4.png",
  //     "foregroundImage": "assets/images/f4.png",
  //     "effectImage": "assets/images/e4.png",
  //     "fullImage": "assets/images/c4.png"
  //   }
  // },
  // {
  //   "title": "Capitan",
  //   "description": "cap",
  //   "coverImages": {
  //     "backgroundImage": "assets/images/b5.png",
  //     "foregroundImage": "assets/images/f5.png",
  //     "effectImage": "",
  //     "fullImage": "assets/images/c5.png"
  //   }
  // }
  // ];
}

class MyListItem {
  final String? titel;
  final String? description;
  final String? backgroundImageUrl;
  final String? foregroundImageUrl;
  final String? topGroundImageUrl;
  final String? fullImage;

  MyListItem(
      {this.titel,
      this.description,
      this.backgroundImageUrl,
      this.foregroundImageUrl,
      this.topGroundImageUrl,
      this.fullImage});

  factory MyListItem.fromMap(Map<String, dynamic> item) {
    String titel = item["title"];
    String description = item["description"];
    // String titel = item["title"];
    String backgroundImageUrl = item['coverImages']["backgroundImage"];
    String foregroundImageUrl = item['coverImages']["foregroundImage"];
    String topGroundImageUrl = item['coverImages']["effectImage"];
    String fullImage = item['coverImages']["fullImage"];

    return MyListItem(
        titel: titel,
        description: description,
        backgroundImageUrl: backgroundImageUrl,
        foregroundImageUrl: foregroundImageUrl,
        topGroundImageUrl: topGroundImageUrl,
        fullImage: fullImage);
  }
}

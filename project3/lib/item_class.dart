import 'package:flutter/material.dart';

class MyCarouselItem {
  final String? titel;
  final String? description;
  final String? backgroundImageUrl;
  final String? foregroundImageUrl;
  final String? topGroundImageUrl;
  final String? fullImage;
  final List<String>? moreImages;
  final String? logoUrl;

  final double? rate;
  final String? category;
  final String? name;
  final String? author;
  final String? paragraph1;
  final String? title2;
  final String? paragraph2;
  final Color? themeColor;

  final List<RelatedCharacters>? relatedCharacters;

  MyCarouselItem(
      {this.titel,
      this.description,
      this.backgroundImageUrl,
      this.foregroundImageUrl,
      this.topGroundImageUrl,
      this.fullImage,
      this.moreImages,
      this.logoUrl,
      this.rate,
      this.category,
      this.name,
      this.author,
      this.paragraph1,
      this.title2,
      this.paragraph2,
      this.relatedCharacters,
      this.themeColor});

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

    String logoUrl = item['logoUrl'];

    Color themeColor = Colors.white;
    switch (item['themeColor']) {
      case 'red':
        themeColor = Colors.red;
        break;

      case "black":
        themeColor = Colors.black;
        break;
      default:
        themeColor = Colors.white;
    }

    double rate = item['rate'];
    String category = item['category'];
    String name = item['name'];
    String author = item['author'];
    String paragraph1 = item['paragraph1'];
    String title2 = item['title2'];
    String paragraph2 = item['paragraph2'];

    List<RelatedCharacters> relatedCharacters = [];
    //  item['relatedCharacters']
    //     .map((e) => RelatedCharacters("e['name']", "e['imageUrl']"))
    //     .toList();

    // List<RelatedCharacters> b =
    //     item['relatedCharacters'].map((e) => RelatedCharacters("name", "ssd"));
    // print(b);
    // List<RelatedCharacters> a = [];
    for (Map<String, dynamic> e in item['relatedCharacters']) {
      relatedCharacters.add(RelatedCharacters(e["name"], e["imageUrl"]));
    }

    return MyCarouselItem(
        titel: titel,
        description: description,
        backgroundImageUrl: backgroundImageUrl,
        foregroundImageUrl: foregroundImageUrl,
        topGroundImageUrl: topGroundImageUrl,
        fullImage: fullImage,
        moreImages: moreImages,
        logoUrl: logoUrl,
        rate: rate,
        category: category,
        name: name,
        author: author,
        paragraph1: paragraph1,
        title2: title2,
        paragraph2: paragraph2,
        relatedCharacters: relatedCharacters,
        themeColor: themeColor);
  }

  static Map<String, dynamic> data = {
    "carousels": [
      {
        "title": "Spiderman",
        "description": "frinedlySpider",
        "coverImages": {
          "backgroundImage": "assets/images/b1.png",
          "foregroundImage": "assets/images/f1.png",
          "effectImage": "assets/images/e1.png",
          "fullImage": "assets/images/c1.png"
        },
        "moreImages": [
          "assets/images/screen2/spider0.png",
          "assets/images/screen2/spider1.png",
          "assets/images/screen2/spider2.png",
          "assets/images/screen2/spider3.png",
          "assets/images/screen2/spider4.png",
        ],
        "logoUrl": "assets/images/screen2/spiderLogo.png",
        "themeColor": "red",
        "rate": 4.7,
        "category": "Marvel-Avengers",
        "name": "Peter Parker - Earth 616",
        "author": "Stan lee, Larry, Hamed Oscar",
        "paragraph1":
            "Hope you were watching, Uncle Ben-Mrx. 'Cause I did that for you. Kept everyone safe.Kept Kasm Kotlet, Kept them from being scared. And I made it fun. It doesn't matter that most of 'em wouldn't have lifted a finger for Peter Parker. That's not why you do it. You do it 'cause it's the right thing to do. Because it's what you would've done. You were more than a father to me, Ben Parker. More than a role model...You were my hero. Now it's my turn. Because from now on, I'm going to be yours! You'll see. I'm going to give it my all! We'll have fun! I'll never quit--and it's going to be amazing! Quote2.png—Spider-Man (Peter Parker)[src]Sometimes student, sometimes scientist and sometimes photographer, Peter Parker is a full-time super hero better known as the web-slinging and wall-crawling Spider-Man. As an orphaned child, Peter was raised by his Uncle Ben and Aunt May. At a science expo, Peter was bitten by an errant radioactive spider which granted him an array of arachnid powers. He initially became Spider-Man to use his powers as an entertainer, growing so conceited he didn't bother stopping a passerby burglar. In a twist of fate, the same burglar wound up killing Peter's Uncle Ben, leading him to realize that he needed to use his powers responsibly.[10] From then on, Spider-Man became a crime-fighting vigilante.[117]",
        "title2": "Early Life",
        "paragraph2":
            "Peter Ebrahim Parker was born in Queens to CIA agents Richard and Mary Parker,[124] who were killed by the Red Skull and framed for treason during a mission.[125]Peter with his parents Before their deaths, however, Richard and Mary had another basterd child as Irgc, a daughter and Peter's younger sister, Teresa.[82] Following his parents' death, a young Parker was adopted by his uncle and aunt, Ben and May Parker, moving in with them at their residence in Forest Hills, New York. After their adopting of him, they became his surrogate parents and raised him as if he were their own son. Over the years into being a teenager, Parker grew to be a prodigy in multiple scholastic subjects at Midtown High School and achieving high honors among his classmates. However, his reserved nature and enthusiasm for knowledge often made him a target for bullying, primarily football star Eugene \"Flash\" Thompson.",
        "relatedCharacters": [
          {"name": "Capitan", "imageUrl": "assets/images/screen2/related1.png"},
          {"name": "Capitan", "imageUrl": "assets/images/screen2/related2.png"},
          {"name": "Capitan", "imageUrl": "assets/images/screen2/related3.png"},
          {"name": "Capitan", "imageUrl": "assets/images/screen2/related4.png"},
          {"name": "Capitan", "imageUrl": "assets/images/screen2/related5.png"},
          {"name": "Capitan", "imageUrl": "assets/images/screen2/related6.png"},
        ]
      },
      {
        "title": "cap",
        "description": "cap",
        "coverImages": {
          "backgroundImage": "assets/images/b2.png",
          "foregroundImage": "assets/images/f2.png",
          "effectImage": "",
          "fullImage": "",
        },
        "moreImages": [
          "assets/images/screen2/spider1.png",
          "assets/images/screen2/spider2.png",
          "assets/images/screen2/spider3.png",
          "assets/images/screen2/spider4.png",
        ],
        "logoUrl": "assets/images/screen2/spiderLogo.png",
        "themeColor": "red",
        "rate": 4.7,
        "category": "Marvel-Avengers",
        "name": "Peter Parker - Earth 616",
        "author": "Stan lee, Larry,Don kerky",
        "paragraph1":
            "Hope you were watching, Uncle Ben. 'Cause I did that for you. Kept everyone safe. Kept them from being scared. And I made it fun. It doesn't matter that most of 'em wouldn't have lifted a finger for Peter Parker. That's not why you do it. You do it 'cause it's the right thing to do. Because it's what you would've done. You were more than a father to me, Ben Parker. More than a role model...You were my hero. Now it's my turn. Because from now on, I'm going to be yours! You'll see. I'm going to give it my all! We'll have fun! I'll never quit--and it's going to be amazing! Quote2.png—Spider-Man (Peter Parker)[src]Sometimes student, sometimes scientist and sometimes photographer, Peter Parker is a full-time super hero better known as the web-slinging and wall-crawling Spider-Man. As an orphaned child, Peter was raised by his Uncle Ben and Aunt May. At a science expo, Peter was bitten by an errant radioactive spider which granted him an array of arachnid powers. He initially became Spider-Man to use his powers as an entertainer, growing so conceited he didn't bother stopping a passerby burglar. In a twist of fate, the same burglar wound up killing Peter's Uncle Ben, leading him to realize that he needed to use his powers responsibly.[10] From then on, Spider-Man became a crime-fighting vigilante.[117]",
        "title2": "Early Life",
        "paragraph2":
            "Peter Benjamin Parker was born in Queens to CIA agents Richard and Mary Parker,[124] who were killed by the Red Skull and framed for treason during a mission.[125]Peter with his parents Before their deaths, however, Richard and Mary had another child unknown to Peter, a daughter and Peter's younger sister, Teresa.[82] Following his parents' death, a young Parker was adopted by his uncle and aunt, Ben and May Parker, moving in with them at their residence in Forest Hills, New York. After their adopting of him, they became his surrogate parents and raised him as if he were their own son. Over the years into being a teenager, Parker grew to be a prodigy in multiple scholastic subjects at Midtown High School and achieving high honors among his classmates. However, his reserved nature and enthusiasm for knowledge often made him a target for bullying, primarily football star Eugene \"Flash\" Thompson.",
        "relatedCharacters": [
          {"name": "Capitan", "imageUrl": "assets/images/screen2/related1.png"},
          {"name": "Capitan", "imageUrl": "assets/images/screen2/related2.png"},
          {"name": "Capitan", "imageUrl": "assets/images/screen2/related3.png"},
          {"name": "Capitan", "imageUrl": "assets/images/screen2/related4.png"},
          {"name": "Capitan", "imageUrl": "assets/images/screen2/related5.png"},
          {"name": "Capitan", "imageUrl": "assets/images/screen2/related6.png"},
        ]
      },
      {
        "title": "hulk",
        "description": "cap",
        "coverImages": {
          "backgroundImage": "assets/images/b3.png",
          "foregroundImage": "assets/images/f3.png",
          "effectImage": "assets/images/e3.png",
          "fullImage": ""
        },
        "moreImages": [
          "assets/images/screen2/spider1.png",
          "assets/images/screen2/spider2.png",
          "assets/images/screen2/spider3.png",
          "assets/images/screen2/spider4.png",
        ],
        "logoUrl": "assets/images/screen2/spiderLogo.png",
        "themeColor": "red",
        "rate": 4.7,
        "category": "Marvel-Avengers",
        "name": "Peter Parker - Earth 616",
        "author": "Stan lee, Larry,Don kerky",
        "paragraph1":
            "Hope you were watching, Uncle Ben. 'Cause I did that for you. Kept everyone safe. Kept them from being scared. And I made it fun. It doesn't matter that most of 'em wouldn't have lifted a finger for Peter Parker. That's not why you do it. You do it 'cause it's the right thing to do. Because it's what you would've done. You were more than a father to me, Ben Parker. More than a role model...You were my hero. Now it's my turn. Because from now on, I'm going to be yours! You'll see. I'm going to give it my all! We'll have fun! I'll never quit--and it's going to be amazing! Quote2.png—Spider-Man (Peter Parker)[src]Sometimes student, sometimes scientist and sometimes photographer, Peter Parker is a full-time super hero better known as the web-slinging and wall-crawling Spider-Man. As an orphaned child, Peter was raised by his Uncle Ben and Aunt May. At a science expo, Peter was bitten by an errant radioactive spider which granted him an array of arachnid powers. He initially became Spider-Man to use his powers as an entertainer, growing so conceited he didn't bother stopping a passerby burglar. In a twist of fate, the same burglar wound up killing Peter's Uncle Ben, leading him to realize that he needed to use his powers responsibly.[10] From then on, Spider-Man became a crime-fighting vigilante.[117]",
        "title2": "Early Life",
        "paragraph2":
            "Peter Benjamin Parker was born in Queens to CIA agents Richard and Mary Parker,[124] who were killed by the Red Skull and framed for treason during a mission.[125]Peter with his parents Before their deaths, however, Richard and Mary had another child unknown to Peter, a daughter and Peter's younger sister, Teresa.[82] Following his parents' death, a young Parker was adopted by his uncle and aunt, Ben and May Parker, moving in with them at their residence in Forest Hills, New York. After their adopting of him, they became his surrogate parents and raised him as if he were their own son. Over the years into being a teenager, Parker grew to be a prodigy in multiple scholastic subjects at Midtown High School and achieving high honors among his classmates. However, his reserved nature and enthusiasm for knowledge often made him a target for bullying, primarily football star Eugene \"Flash\" Thompson.",
        "relatedCharacters": [
          {"name": "Capitan", "imageUrl": "assets/images/screen2/related1.png"},
          {"name": "Capitan", "imageUrl": "assets/images/screen2/related2.png"},
          {"name": "Capitan", "imageUrl": "assets/images/screen2/related3.png"},
          {"name": "Capitan", "imageUrl": "assets/images/screen2/related4.png"},
          {"name": "Capitan", "imageUrl": "assets/images/screen2/related5.png"},
          {"name": "Capitan", "imageUrl": "assets/images/screen2/related6.png"},
        ]
      },
      {
        "title": "logan",
        "description": "cap",
        "coverImages": {
          "backgroundImage": "assets/images/b4.png",
          "foregroundImage": "assets/images/f4.png",
          "effectImage": "assets/images/e4.png",
          "fullImage": ""
        },
        "moreImages": [
          "assets/images/screen2/spider1.png",
          "assets/images/screen2/spider2.png",
          "assets/images/screen2/spider3.png",
          "assets/images/screen2/spider4.png",
        ],
        "logoUrl": "assets/images/screen2/spiderLogo.png",
        "themeColor": "red",
        "rate": 4.7,
        "category": "Marvel-Avengers",
        "name": "Peter Parker - Earth 616",
        "author": "Stan lee, Larry,Don kerky",
        "paragraph1":
            "Hope you were watching, Uncle Ben. 'Cause I did that for you. Kept everyone safe. Kept them from being scared. And I made it fun. It doesn't matter that most of 'em wouldn't have lifted a finger for Peter Parker. That's not why you do it. You do it 'cause it's the right thing to do. Because it's what you would've done. You were more than a father to me, Ben Parker. More than a role model...You were my hero. Now it's my turn. Because from now on, I'm going to be yours! You'll see. I'm going to give it my all! We'll have fun! I'll never quit--and it's going to be amazing! Quote2.png—Spider-Man (Peter Parker)[src]Sometimes student, sometimes scientist and sometimes photographer, Peter Parker is a full-time super hero better known as the web-slinging and wall-crawling Spider-Man. As an orphaned child, Peter was raised by his Uncle Ben and Aunt May. At a science expo, Peter was bitten by an errant radioactive spider which granted him an array of arachnid powers. He initially became Spider-Man to use his powers as an entertainer, growing so conceited he didn't bother stopping a passerby burglar. In a twist of fate, the same burglar wound up killing Peter's Uncle Ben, leading him to realize that he needed to use his powers responsibly.[10] From then on, Spider-Man became a crime-fighting vigilante.[117]",
        "title2": "Early Life",
        "paragraph2":
            "Peter Benjamin Parker was born in Queens to CIA agents Richard and Mary Parker,[124] who were killed by the Red Skull and framed for treason during a mission.[125]Peter with his parents Before their deaths, however, Richard and Mary had another child unknown to Peter, a daughter and Peter's younger sister, Teresa.[82] Following his parents' death, a young Parker was adopted by his uncle and aunt, Ben and May Parker, moving in with them at their residence in Forest Hills, New York. After their adopting of him, they became his surrogate parents and raised him as if he were their own son. Over the years into being a teenager, Parker grew to be a prodigy in multiple scholastic subjects at Midtown High School and achieving high honors among his classmates. However, his reserved nature and enthusiasm for knowledge often made him a target for bullying, primarily football star Eugene \"Flash\" Thompson.",
        "relatedCharacters": [
          {"name": "Capitan", "imageUrl": "assets/images/screen2/related1.png"},
          {"name": "Capitan", "imageUrl": "assets/images/screen2/related2.png"},
          {"name": "Capitan", "imageUrl": "assets/images/screen2/related3.png"},
          {"name": "Capitan", "imageUrl": "assets/images/screen2/related4.png"},
          {"name": "Capitan", "imageUrl": "assets/images/screen2/related5.png"},
          {"name": "Capitan", "imageUrl": "assets/images/screen2/related6.png"},
        ]
      },
      {
        "title": "iron",
        "description": "cap",
        "coverImages": {
          "backgroundImage": "assets/images/b5.png",
          "foregroundImage": "assets/images/f5.png",
          "effectImage": "",
          "fullImage": ""
        },
        "moreImages": [
          "assets/images/screen2/spider1.png",
          "assets/images/screen2/spider2.png",
          "assets/images/screen2/spider3.png",
          "assets/images/screen2/spider4.png",
        ],
        "logoUrl": "assets/images/screen2/spiderLogo.png",
        "themeColor": "red",
        "rate": 4.7,
        "category": "Marvel-Avengers",
        "name": "Peter Parker - Earth 616",
        "author": "Stan lee, Larry,Don kerky",
        "paragraph1":
            "Hope you were watching, Uncle Ben. 'Cause I did that for you. Kept everyone safe. Kept them from being scared. And I made it fun. It doesn't matter that most of 'em wouldn't have lifted a finger for Peter Parker. That's not why you do it. You do it 'cause it's the right thing to do. Because it's what you would've done. You were more than a father to me, Ben Parker. More than a role model...You were my hero. Now it's my turn. Because from now on, I'm going to be yours! You'll see. I'm going to give it my all! We'll have fun! I'll never quit--and it's going to be amazing! Quote2.png—Spider-Man (Peter Parker)[src]Sometimes student, sometimes scientist and sometimes photographer, Peter Parker is a full-time super hero better known as the web-slinging and wall-crawling Spider-Man. As an orphaned child, Peter was raised by his Uncle Ben and Aunt May. At a science expo, Peter was bitten by an errant radioactive spider which granted him an array of arachnid powers. He initially became Spider-Man to use his powers as an entertainer, growing so conceited he didn't bother stopping a passerby burglar. In a twist of fate, the same burglar wound up killing Peter's Uncle Ben, leading him to realize that he needed to use his powers responsibly.[10] From then on, Spider-Man became a crime-fighting vigilante.[117]",
        "title2": "Early Life",
        "paragraph2":
            "Peter Benjamin Parker was born in Queens to CIA agents Richard and Mary Parker,[124] who were killed by the Red Skull and framed for treason during a mission.[125]Peter with his parents Before their deaths, however, Richard and Mary had another child unknown to Peter, a daughter and Peter's younger sister, Teresa.[82] Following his parents' death, a young Parker was adopted by his uncle and aunt, Ben and May Parker, moving in with them at their residence in Forest Hills, New York. After their adopting of him, they became his surrogate parents and raised him as if he were their own son. Over the years into being a teenager, Parker grew to be a prodigy in multiple scholastic subjects at Midtown High School and achieving high honors among his classmates. However, his reserved nature and enthusiasm for knowledge often made him a target for bullying, primarily football star Eugene \"Flash\" Thompson.",
        "relatedCharacters": [
          {"name": "Capitan", "imageUrl": "assets/images/screen2/related1.png"},
          {"name": "Capitan", "imageUrl": "assets/images/screen2/related2.png"},
          {"name": "Capitan", "imageUrl": "assets/images/screen2/related3.png"},
          {"name": "Capitan", "imageUrl": "assets/images/screen2/related4.png"},
          {"name": "Capitan", "imageUrl": "assets/images/screen2/related5.png"},
          {"name": "Capitan", "imageUrl": "assets/images/screen2/related6.png"},
        ]
      },
    ],
    "otherHeroes": [
      {
        "title": "Spiderman",
        "description": "frinedlySpider",
        "coverImages": {
          "backgroundImage": "assets/images/b1.png",
          "foregroundImage": "assets/images/f1.png",
          "effectImage": "assets/images/e1.png",
          "fullImage": "assets/images/i3.png"
        },
        "moreImages": [
          "assets/images/screen2/spider1.png",
          "assets/images/screen2/spider2.png",
          "assets/images/screen2/spider3.png",
          "assets/images/screen2/spider4.png",
        ],
        "logoUrl": "assets/images/screen2/spiderLogo.png",
        "themeColor": "red",
        "rate": 4.7,
        "category": "Marvel-Avengers",
        "name": "Peter Parker - Earth 616",
        "author": "Stan lee, Larry,Don kerky",
        "paragraph1":
            "Hope you were watching, Uncle Ben. 'Cause I did that for you. Kept everyone safe. Kept them from being scared. And I made it fun. It doesn't matter that most of 'em wouldn't have lifted a finger for Peter Parker. That's not why you do it. You do it 'cause it's the right thing to do. Because it's what you would've done. You were more than a father to me, Ben Parker. More than a role model...You were my hero. Now it's my turn. Because from now on, I'm going to be yours! You'll see. I'm going to give it my all! We'll have fun! I'll never quit--and it's going to be amazing! Quote2.png—Spider-Man (Peter Parker)[src]Sometimes student, sometimes scientist and sometimes photographer, Peter Parker is a full-time super hero better known as the web-slinging and wall-crawling Spider-Man. As an orphaned child, Peter was raised by his Uncle Ben and Aunt May. At a science expo, Peter was bitten by an errant radioactive spider which granted him an array of arachnid powers. He initially became Spider-Man to use his powers as an entertainer, growing so conceited he didn't bother stopping a passerby burglar. In a twist of fate, the same burglar wound up killing Peter's Uncle Ben, leading him to realize that he needed to use his powers responsibly.[10] From then on, Spider-Man became a crime-fighting vigilante.[117]",
        "title2": "Early Life",
        "paragraph2":
            "Peter Benjamin Parker was born in Queens to CIA agents Richard and Mary Parker,[124] who were killed by the Red Skull and framed for treason during a mission.[125]Peter with his parents Before their deaths, however, Richard and Mary had another child unknown to Peter, a daughter and Peter's younger sister, Teresa.[82] Following his parents' death, a young Parker was adopted by his uncle and aunt, Ben and May Parker, moving in with them at their residence in Forest Hills, New York. After their adopting of him, they became his surrogate parents and raised him as if he were their own son. Over the years into being a teenager, Parker grew to be a prodigy in multiple scholastic subjects at Midtown High School and achieving high honors among his classmates. However, his reserved nature and enthusiasm for knowledge often made him a target for bullying, primarily football star Eugene \"Flash\" Thompson.",
        "relatedCharacters": [
          {"name": "Capitan", "imageUrl": "assets/images/screen2/related1.png"},
          {"name": "Capitan", "imageUrl": "assets/images/screen2/related2.png"},
          {"name": "Capitan", "imageUrl": "assets/images/screen2/related3.png"},
          {"name": "Capitan", "imageUrl": "assets/images/screen2/related4.png"},
          {"name": "Capitan", "imageUrl": "assets/images/screen2/related5.png"},
          {"name": "Capitan", "imageUrl": "assets/images/screen2/related6.png"},
        ]
      },
      {
        "title": "cap",
        "description": "frinedlySpider",
        "coverImages": {
          "backgroundImage": "assets/images/b1.png",
          "foregroundImage": "assets/images/f1.png",
          "effectImage": "assets/images/e1.png",
          "fullImage": "assets/images/i1.png"
        },
        "moreImages": [
          "assets/images/screen2/spider1.png",
          "assets/images/screen2/spider2.png",
          "assets/images/screen2/spider3.png",
          "assets/images/screen2/spider4.png",
        ],
        "logoUrl": "assets/images/screen2/spiderLogo.png",
        "themeColor": "red",
        "rate": 4.7,
        "category": "Marvel-Avengers",
        "name": "Peter Parker - Earth 616",
        "author": "Stan lee, Larry,Don kerky",
        "paragraph1":
            "Hope you were watching, Uncle Ben. 'Cause I did that for you. Kept everyone safe. Kept them from being scared. And I made it fun. It doesn't matter that most of 'em wouldn't have lifted a finger for Peter Parker. That's not why you do it. You do it 'cause it's the right thing to do. Because it's what you would've done. You were more than a father to me, Ben Parker. More than a role model...You were my hero. Now it's my turn. Because from now on, I'm going to be yours! You'll see. I'm going to give it my all! We'll have fun! I'll never quit--and it's going to be amazing! Quote2.png—Spider-Man (Peter Parker)[src]Sometimes student, sometimes scientist and sometimes photographer, Peter Parker is a full-time super hero better known as the web-slinging and wall-crawling Spider-Man. As an orphaned child, Peter was raised by his Uncle Ben and Aunt May. At a science expo, Peter was bitten by an errant radioactive spider which granted him an array of arachnid powers. He initially became Spider-Man to use his powers as an entertainer, growing so conceited he didn't bother stopping a passerby burglar. In a twist of fate, the same burglar wound up killing Peter's Uncle Ben, leading him to realize that he needed to use his powers responsibly.[10] From then on, Spider-Man became a crime-fighting vigilante.[117]",
        "title2": "Early Life",
        "paragraph2":
            "Peter Benjamin Parker was born in Queens to CIA agents Richard and Mary Parker,[124] who were killed by the Red Skull and framed for treason during a mission.[125]Peter with his parents Before their deaths, however, Richard and Mary had another child unknown to Peter, a daughter and Peter's younger sister, Teresa.[82] Following his parents' death, a young Parker was adopted by his uncle and aunt, Ben and May Parker, moving in with them at their residence in Forest Hills, New York. After their adopting of him, they became his surrogate parents and raised him as if he were their own son. Over the years into being a teenager, Parker grew to be a prodigy in multiple scholastic subjects at Midtown High School and achieving high honors among his classmates. However, his reserved nature and enthusiasm for knowledge often made him a target for bullying, primarily football star Eugene \"Flash\" Thompson.",
        "relatedCharacters": [
          {"name": "Capitan", "imageUrl": "assets/images/screen2/related1.png"},
          {"name": "Capitan", "imageUrl": "assets/images/screen2/related2.png"},
          {"name": "Capitan", "imageUrl": "assets/images/screen2/related3.png"},
          {"name": "Capitan", "imageUrl": "assets/images/screen2/related4.png"},
          {"name": "Capitan", "imageUrl": "assets/images/screen2/related5.png"},
          {"name": "Capitan", "imageUrl": "assets/images/screen2/related6.png"},
        ]
      },
      {
        "title": "Batman",
        "description": "DC-Justice League",
        "coverImages": {
          "backgroundImage": "assets/images/b1.png",
          "foregroundImage": "assets/images/f1.png",
          "effectImage": "assets/images/e1.png",
          "fullImage": "assets/images/i2.png"
        },
        "moreImages": [
          "assets/images/screen2/batman1.png",
          "assets/images/screen2/batman2.png",
          "assets/images/screen2/batman3.png",
          "assets/images/screen2/batman4.png",
        ],
        "logoUrl": "assets/images/screen2/batLogo.png",
        "themeColor": "black",
        "rate": 4.9,
        "category": "DC-Justice League",
        "name": "bruce wayne",
        "author": " Bob Kane, Bill Finger",
        "paragraph1":
            "The Batman[a] is a superhero appearing in American comic books published by DC Comics. The character was created by artist Bob Kane and writer Bill Finger, and debuted in the 27th issue of the comic book Detective Comics on March 30, 1939. In the DC Universe continuity, Batman is the alias of Bruce Wayne, a wealthy American playboy, philanthropist, and industrialist who resides in Gotham City. Batman's origin story features him swearing vengeance against criminals after witnessing the murder of his parents Thomas and Martha as a child, a vendetta tempered with the ideal of justice. He trains himself physically and intellectually, crafts a bat-inspired persona, and monitors the Gotham streets at night. Kane, Finger, and other creators accompanied Batman with supporting characters, including his sidekicks Robin and Batgirl; allies Alfred Pennyworth, James Gordon, and Catwoman; and foes such as the Penguin, the Riddler, Two-Face, and his archenemy, the Joker.",
        "title2": "Youth",
        "paragraph2":
            "Kane conceived Batman in early 1939 to capitalize on the popularity of DC's Superman; although Kane frequently claimed sole creation credit, Finger substantially developed the concept from a generic superhero into something more bat-like. The character received his own spin-off publication, Batman, in 1940. Batman was originally introduced as a ruthless vigilante who frequently killed or maimed criminals, but evolved into a character with a stringent moral code and strong sense of justice. Unlike most superheroes, Batman does not possess any superpowers, instead relying on his intellect, fighting skills, and wealth. The 1960s Batman television series used a camp aesthetic, which continued to be associated with the character for years after the show ended. Various creators worked to return the character to his darker roots in the 1970s and 1980s, culminating with the 1986 miniseries The Dark Knight Returns by Frank Miller.DC has featured Batman in many comic books, including comics published under its imprints such as Vertigo and Black Label. The longest-running Batman comic, Detective Comics, is the longest-running comic book in the United States. Batman is frequently depicted alongside other DC superheroes, such as Superman and Wonder Woman, as a member of organizations such as the Justice League and the Outsiders. In addition to Bruce Wayne, other characters have taken on the Batman persona on different occasions, such as Jean-Paul Valley / Azrael in the 1993–1994 \"Knightfall\" story arc; Dick Grayson, the first Robin, from 2009 to 2011; and Jace Fox, son of Wayne's ally Lucius, as of 2021.[4] DC has also published comics featuring alternate versions of Batman, including the incarnation seen in The Dark Knight Returns and its successors, the incarnation from the Flashpoint (2011) event, and numerous interpretations from Elseworlds stories.",
        "relatedCharacters": [
          {"name": "Capitan", "imageUrl": "assets/images/screen2/related6.png"},
          {"name": "Capitan", "imageUrl": "assets/images/screen2/related5.png"},
          {"name": "Capitan", "imageUrl": "assets/images/screen2/related3.png"},
          {"name": "Capitan", "imageUrl": "assets/images/screen2/related4.png"},
          {"name": "Capitan", "imageUrl": "assets/images/screen2/related1.png"},
          {"name": "Capitan", "imageUrl": "assets/images/screen2/related2.png"},
        ]
      },
      {
        "title": "logan",
        "description": "frinedlySpider",
        "coverImages": {
          "backgroundImage": "assets/images/b1.png",
          "foregroundImage": "assets/images/f1.png",
          "effectImage": "assets/images/e1.png",
          "fullImage": "assets/images/i4.png"
        },
        "moreImages": [
          "assets/images/screen2/spider1.png",
          "assets/images/screen2/spider2.png",
          "assets/images/screen2/spider3.png",
          "assets/images/screen2/spider4.png",
        ],
        "logoUrl": "assets/images/screen2/spiderLogo.png",
        "themeColor": "red",
        "rate": 4.7,
        "category": "Marvel-Avengers",
        "name": "Peter Parker - Earth 616",
        "author": "Stan lee, Larry,Don kerky",
        "paragraph1":
            "Hope you were watching, Uncle Ben. 'Cause I did that for you. Kept everyone safe. Kept them from being scared. And I made it fun. It doesn't matter that most of 'em wouldn't have lifted a finger for Peter Parker. That's not why you do it. You do it 'cause it's the right thing to do. Because it's what you would've done. You were more than a father to me, Ben Parker. More than a role model...You were my hero. Now it's my turn. Because from now on, I'm going to be yours! You'll see. I'm going to give it my all! We'll have fun! I'll never quit--and it's going to be amazing! Quote2.png—Spider-Man (Peter Parker)[src]Sometimes student, sometimes scientist and sometimes photographer, Peter Parker is a full-time super hero better known as the web-slinging and wall-crawling Spider-Man. As an orphaned child, Peter was raised by his Uncle Ben and Aunt May. At a science expo, Peter was bitten by an errant radioactive spider which granted him an array of arachnid powers. He initially became Spider-Man to use his powers as an entertainer, growing so conceited he didn't bother stopping a passerby burglar. In a twist of fate, the same burglar wound up killing Peter's Uncle Ben, leading him to realize that he needed to use his powers responsibly.[10] From then on, Spider-Man became a crime-fighting vigilante.[117]",
        "title2": "Early Life",
        "paragraph2":
            "Peter Benjamin Parker was born in Queens to CIA agents Richard and Mary Parker,[124] who were killed by the Red Skull and framed for treason during a mission.[125]Peter with his parents Before their deaths, however, Richard and Mary had another child unknown to Peter, a daughter and Peter's younger sister, Teresa.[82] Following his parents' death, a young Parker was adopted by his uncle and aunt, Ben and May Parker, moving in with them at their residence in Forest Hills, New York. After their adopting of him, they became his surrogate parents and raised him as if he were their own son. Over the years into being a teenager, Parker grew to be a prodigy in multiple scholastic subjects at Midtown High School and achieving high honors among his classmates. However, his reserved nature and enthusiasm for knowledge often made him a target for bullying, primarily football star Eugene \"Flash\" Thompson.",
        "relatedCharacters": [
          {"name": "Capitan", "imageUrl": "assets/images/screen2/related1.png"},
          {"name": "Capitan", "imageUrl": "assets/images/screen2/related2.png"},
          {"name": "Capitan", "imageUrl": "assets/images/screen2/related3.png"},
          {"name": "Capitan", "imageUrl": "assets/images/screen2/related4.png"},
          {"name": "Capitan", "imageUrl": "assets/images/screen2/related5.png"},
          {"name": "Capitan", "imageUrl": "assets/images/screen2/related6.png"},
        ]
      },
      {
        "title": "iron",
        "description": "frinedlySpider",
        "coverImages": {
          "backgroundImage": "assets/images/b1.png",
          "foregroundImage": "assets/images/f1.png",
          "effectImage": "assets/images/e1.png",
          "fullImage": "assets/images/i5.png"
        },
        "moreImages": [
          "assets/images/screen2/spider1.png",
          "assets/images/screen2/spider2.png",
          "assets/images/screen2/spider3.png",
          "assets/images/screen2/spider4.png",
        ],
        "logoUrl": "assets/images/screen2/spiderLogo.png",
        "themeColor": "red",
        "rate": 4.7,
        "category": "Marvel-Avengers",
        "name": "Peter Parker - Earth 616",
        "author": "Stan lee, Larry,Don kerky",
        "paragraph1":
            "Hope you were watching, Uncle Ben. 'Cause I did that for you. Kept everyone safe. Kept them from being scared. And I made it fun. It doesn't matter that most of 'em wouldn't have lifted a finger for Peter Parker. That's not why you do it. You do it 'cause it's the right thing to do. Because it's what you would've done. You were more than a father to me, Ben Parker. More than a role model...You were my hero. Now it's my turn. Because from now on, I'm going to be yours! You'll see. I'm going to give it my all! We'll have fun! I'll never quit--and it's going to be amazing! Quote2.png—Spider-Man (Peter Parker)[src]Sometimes student, sometimes scientist and sometimes photographer, Peter Parker is a full-time super hero better known as the web-slinging and wall-crawling Spider-Man. As an orphaned child, Peter was raised by his Uncle Ben and Aunt May. At a science expo, Peter was bitten by an errant radioactive spider which granted him an array of arachnid powers. He initially became Spider-Man to use his powers as an entertainer, growing so conceited he didn't bother stopping a passerby burglar. In a twist of fate, the same burglar wound up killing Peter's Uncle Ben, leading him to realize that he needed to use his powers responsibly.[10] From then on, Spider-Man became a crime-fighting vigilante.[117]",
        "title2": "Early Life",
        "paragraph2":
            "Peter Benjamin Parker was born in Queens to CIA agents Richard and Mary Parker,[124] who were killed by the Red Skull and framed for treason during a mission.[125]Peter with his parents Before their deaths, however, Richard and Mary had another child unknown to Peter, a daughter and Peter's younger sister, Teresa.[82] Following his parents' death, a young Parker was adopted by his uncle and aunt, Ben and May Parker, moving in with them at their residence in Forest Hills, New York. After their adopting of him, they became his surrogate parents and raised him as if he were their own son. Over the years into being a teenager, Parker grew to be a prodigy in multiple scholastic subjects at Midtown High School and achieving high honors among his classmates. However, his reserved nature and enthusiasm for knowledge often made him a target for bullying, primarily football star Eugene \"Flash\" Thompson.",
        "relatedCharacters": [
          {"name": "Capitan", "imageUrl": "assets/images/screen2/related1.png"},
          {"name": "Capitan", "imageUrl": "assets/images/screen2/related2.png"},
          {"name": "Capitan", "imageUrl": "assets/images/screen2/related3.png"},
          {"name": "Capitan", "imageUrl": "assets/images/screen2/related4.png"},
          {"name": "Capitan", "imageUrl": "assets/images/screen2/related5.png"},
          {"name": "Capitan", "imageUrl": "assets/images/screen2/related6.png"},
        ]
      },
      {
        "title": "Spiderman",
        "description": "frinedlySpider",
        "coverImages": {
          "backgroundImage": "assets/images/b1.png",
          "foregroundImage": "assets/images/f1.png",
          "effectImage": "assets/images/e1.png",
          "fullImage": "assets/images/i6.png"
        },
        "moreImages": [
          "assets/images/screen2/spider1.png",
          "assets/images/screen2/spider2.png",
          "assets/images/screen2/spider3.png",
          "assets/images/screen2/spider4.png",
        ],
        "logoUrl": "assets/images/screen2/spiderLogo.png",
        "themeColor": "red",
        "rate": 4.7,
        "category": "Marvel-Avengers",
        "name": "Peter Parker - Earth 616",
        "author": "Stan lee, Larry,Don kerky",
        "paragraph1":
            "Hope you were watching, Uncle Ben. 'Cause I did that for you. Kept everyone safe. Kept them from being scared. And I made it fun. It doesn't matter that most of 'em wouldn't have lifted a finger for Peter Parker. That's not why you do it. You do it 'cause it's the right thing to do. Because it's what you would've done. You were more than a father to me, Ben Parker. More than a role model...You were my hero. Now it's my turn. Because from now on, I'm going to be yours! You'll see. I'm going to give it my all! We'll have fun! I'll never quit--and it's going to be amazing! Quote2.png—Spider-Man (Peter Parker)[src]Sometimes student, sometimes scientist and sometimes photographer, Peter Parker is a full-time super hero better known as the web-slinging and wall-crawling Spider-Man. As an orphaned child, Peter was raised by his Uncle Ben and Aunt May. At a science expo, Peter was bitten by an errant radioactive spider which granted him an array of arachnid powers. He initially became Spider-Man to use his powers as an entertainer, growing so conceited he didn't bother stopping a passerby burglar. In a twist of fate, the same burglar wound up killing Peter's Uncle Ben, leading him to realize that he needed to use his powers responsibly.[10] From then on, Spider-Man became a crime-fighting vigilante.[117]",
        "title2": "Early Life",
        "paragraph2":
            "Peter Benjamin Parker was born in Queens to CIA agents Richard and Mary Parker,[124] who were killed by the Red Skull and framed for treason during a mission.[125]Peter with his parents Before their deaths, however, Richard and Mary had another child unknown to Peter, a daughter and Peter's younger sister, Teresa.[82] Following his parents' death, a young Parker was adopted by his uncle and aunt, Ben and May Parker, moving in with them at their residence in Forest Hills, New York. After their adopting of him, they became his surrogate parents and raised him as if he were their own son. Over the years into being a teenager, Parker grew to be a prodigy in multiple scholastic subjects at Midtown High School and achieving high honors among his classmates. However, his reserved nature and enthusiasm for knowledge often made him a target for bullying, primarily football star Eugene \"Flash\" Thompson.",
        "relatedCharacters": [
          {"name": "Capitan", "imageUrl": "assets/images/screen2/related1.png"},
          {"name": "Capitan", "imageUrl": "assets/images/screen2/related2.png"},
          {"name": "Capitan", "imageUrl": "assets/images/screen2/related3.png"},
          {"name": "Capitan", "imageUrl": "assets/images/screen2/related4.png"},
          {"name": "Capitan", "imageUrl": "assets/images/screen2/related5.png"},
          {"name": "Capitan", "imageUrl": "assets/images/screen2/related6.png"},
        ]
      },
    ],
  };
}

// class ItemTest extends MyCarouselItem {}

// class MyListItem {
//   final String? titel;
//   final String? description;
//   final String? backgroundImageUrl;
//   final String? foregroundImageUrl;
//   final String? topGroundImageUrl;
//   final String? fullImage;

//   MyListItem(
//       {this.titel,
//       this.description,
//       this.backgroundImageUrl,
//       this.foregroundImageUrl,
//       this.topGroundImageUrl,
//       this.fullImage});

//   factory MyListItem.fromMap(Map<String, dynamic> item) {
//     String titel = item["title"];
//     String description = item["description"];
//     // String titel = item["title"];
//     String backgroundImageUrl = item['coverImages']["backgroundImage"];
//     String foregroundImageUrl = item['coverImages']["foregroundImage"];
//     String topGroundImageUrl = item['coverImages']["effectImage"];
//     String fullImage = item['coverImages']["fullImage"];

//     return MyListItem(
//         titel: titel,
//         description: description,
//         backgroundImageUrl: backgroundImageUrl,
//         foregroundImageUrl: foregroundImageUrl,
//         topGroundImageUrl: topGroundImageUrl,
//         fullImage: fullImage);
//   }
// }

class RelatedCharacters {
  String name;
  String imageUrl;

  RelatedCharacters(this.name, this.imageUrl);
}

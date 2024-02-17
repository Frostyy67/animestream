import 'package:flutter/material.dart';

class ListElement {
  Widget widget;
  dynamic info;

  ListElement({required this.widget, required this.info});
}

Widget characterCard(String name, String role, String imageUrl) {
  return Card(
    color: Colors.black,
    clipBehavior: Clip.hardEdge,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    child: Column(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          clipBehavior: Clip.hardEdge,
          height: 175,
          width: 115,
          child: Image.network(
            fit: BoxFit.cover,
            imageUrl,
            height: 175,
            width: 115,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 5, left: 5, right: 5),
          child: Text(
            name,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'NotoSans',
              fontSize: 15,
              overflow: TextOverflow.ellipsis,
            ),
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ),
        Text(
          role,
          style: TextStyle(
            color: const Color.fromARGB(255, 141, 141, 141),
            fontFamily: 'NotoSans',
            fontSize: 12,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    ),
  );
}

Widget NewsCard(String title, String imageUrl, String date, String time) {
  return Card(
    color: Colors.black,
    child: Container(
      decoration: BoxDecoration(
          // boxShadow: [BoxShadow(color: Color.fromARGB(82, 92, 92, 92), blurRadius: 10, blurStyle: BlurStyle.normal, offset: Offset(0.0, 3), spreadRadius: 0)],
          color: Colors.transparent),
      height: 200,
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 20),
            width: 135,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                  image: NetworkImage(
                    imageUrl,
                  ),
                  fit: BoxFit.cover),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 5,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: "Rubik",
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(
                    "$date • $time",
                    style: TextStyle(
                      fontFamily: "NotoSans",
                      fontSize: 13,
                      color: const Color.fromARGB(255, 151, 151, 151),
                    ),
                  ),
                ),
                // ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget animeCard(String title, String imageUrl) {
  return Card(
    color: Colors.black,
    clipBehavior: Clip.hardEdge,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    child: Column(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          clipBehavior: Clip.hardEdge,
          height: 175,
          width: 115,
          child: Image.network(
            fit: BoxFit.cover,
            imageUrl,
            height: 175,
            width: 115,
          ),
        ),
        Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'NotoSans',
            fontSize: 15,
            overflow: TextOverflow.ellipsis,
          ),
          maxLines: 2,
        ),
      ],
    ),
  );
}

Widget animeCardSkeleton(String title) {
  return Card(
    color: Colors.black,
    clipBehavior: Clip.hardEdge,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    child: Column(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          clipBehavior: Clip.hardEdge,
          height: 175,
          width: 115,
        ),
        Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'NotoSans',
            fontSize: 15,
            overflow: TextOverflow.ellipsis,
          ),
          maxLines: 2,
        ),
      ],
    ),
  );
}

class AnimeData {
  final String imageUrl;
  final String title;

  const AnimeData({
    required this.imageUrl,
    required this.title,
  });
}
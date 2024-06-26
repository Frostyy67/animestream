import 'package:animestream/ui/models/snackBar.dart';
import 'package:animestream/ui/pages/info.dart';
import 'package:animestream/ui/theme/mainTheme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Cards {
  /**only pass the context if using the animeCard method! */
  final BuildContext? context;

  Cards({this.context});

  /**Builds a character card (no navigation) */
  Widget characterCard(String name, String role, String imageUrl) {
    return Card(
      color: backgroundColor,
      clipBehavior: Clip.hardEdge,
      elevation: 0,
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
              frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                if (wasSynchronouslyLoaded) return child;
                return AnimatedOpacity(
                  opacity: frame == null ? 0 : 1,
                  duration: Duration(milliseconds: 150),
                  child: child,
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 5, left: 5, right: 5),
            child: Text(
              name,
              style: TextStyle(
                color: textMainColor,
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
              color: textSubColor,
              fontFamily: 'NotoSans',
              fontSize: 12,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  /**Builds a card for news */
  Widget NewsCard(String title, String imageUrl, String date, String time) {
    return Card(
      surfaceTintColor: textSubColor,
      color: backgroundColor,
      child: Container(
        decoration: BoxDecoration(
            // boxShadow: [BoxShadow(color: Color.fromARGB(82, 92, 92, 92), blurRadius: 10, blurStyle: BlurStyle.normal, offset: Offset(0.0, 3), spreadRadius: 0)],
            color: Colors.transparent),
        height: 200,
        padding: EdgeInsets.only(right: 10),
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
                        color: textMainColor,
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
                        color: textSubColor,
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

  /**Builds a card for anime (optional navigation) */
  Card animeCard(
    int id,
    String title,
    String imageUrl, {
    bool ongoing = false,
    bool shouldNavigate = true,
    bool isAnime = true,
    String? subText = null,
    void Function()? afterNavigation,
  }) {
    if (context == null) throw Exception("NO CONTEXT PROVIDED TO BUILD CARDS");
    return Card(
      color: backgroundColor,
      shadowColor: null,
      borderOnForeground: false,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: GestureDetector(
        onTap: () {
          if (!isAnime) return floatingSnackBar(context!, "Mangas/Novels arent supported");
          if (shouldNavigate)
            Navigator.of(context!)
                .push(
              MaterialPageRoute(
                builder: (context) => Info(
                  id: id,
                ),
              ),
            )
                .then((val) {
              if (afterNavigation != null) afterNavigation();
            });
        },
        child: Container(
          width: 120,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                // clipBehavior: Clip.hardEdge,
                height: 165,
                width: 110,
                child: ongoing
                    ? Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            clipBehavior: Clip.hardEdge,
                            child: CachedNetworkImage(
                              imageUrl: imageUrl,
                              fit: BoxFit.cover,
                              height: 165,
                              width: 110,
                              fadeInCurve: Curves.easeIn,
                              fadeInDuration: Duration(milliseconds: 200),
                            ),
                          ),
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                                boxShadow: <BoxShadow>[BoxShadow(color: Colors.green, spreadRadius: 2)],
                                borderRadius: BorderRadius.circular(100),
                                color: Color.fromARGB(255, 40, 209, 46),
                                border: Border.all(color: Colors.black, width: 2)),
                          ),
                        ],
                      )
                    : Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        clipBehavior: Clip.hardEdge,
                        child: CachedNetworkImage(
                          imageUrl: imageUrl,
                          fit: BoxFit.cover,
                          height: 165,
                          width: 110,
                          fadeInCurve: Curves.easeIn,
                          fadeInDuration: Duration(milliseconds: 200),
                        ),
                      ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 5, bottom: subText == null ? 0 : 5),
                child: Text(
                  title,
                  style: TextStyle(
                    color: textMainColor,
                    fontFamily: 'NotoSans',
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 2,
                  textAlign: TextAlign.left,
                ),
              ),
              if (subText != null)
                Text(
                  subText,
                  style: TextStyle(
                    color: textSubColor,
                    fontFamily: 'NotoSans',
                    fontSize: 12,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

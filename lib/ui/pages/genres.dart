import 'package:animestream/core/app/runtimeDatas.dart';
import 'package:animestream/core/database/anilist/queries.dart';
import 'package:animestream/ui/models/cards.dart';
import 'package:animestream/ui/models/snackBar.dart';
import 'package:animestream/ui/pages/info.dart';
import 'package:animestream/ui/pages/settingPages/common.dart';
import 'package:animestream/ui/theme/mainTheme.dart';
import 'package:flutter/material.dart';
import 'package:animestream/core/commons/genresAndTags.dart';

class GenresPage extends StatefulWidget {
  const GenresPage({super.key});

  @override
  State<GenresPage> createState() => _GenresPageState();
}

class _GenresPageState extends State<GenresPage> {
  void getList() async {
    try {
      setState(() {
        searchResultsAsWidgets = [];
        _searching = true;
      });
      if (selectedGenres.isEmpty && selectedTags.isEmpty) {
        return;
      }
      final res = await AnilistQueries().getAnimesWithGenresAndTags(selectedGenres, selectedTags);
      res.forEach((e) {
        searchResultsAsWidgets.add(AnimeWidget(
            widget: animeCard(e.title['english'] ?? e.title['romaji'] ?? '', e.cover, ongoing: e.status == "RELEASING"),
            info: {'id': e.id}));
      });
      setState(() {
        _searching = false;
      });
    } catch (err) {
      if (currentUserSettings?.showErrors ?? false) {
        floatingSnackBar(context, err.toString());
      }
    }
  }

  //genre and tags list will be read from genresAndTags.dart file

  List<String> selectedGenres = [];
  List<String> selectedTags = [];

  List<AnimeWidget> searchResultsAsWidgets = [];

  bool _searching = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: pagePadding(context),
        child: SingleChildScrollView(
          child: Column(
            children: [
              topRow(context, "Genres"),
              Container(
                padding: EdgeInsets.only(left: 15, right: 15, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        "Results",
                        style: TextStyle(
                            color: textMainColor, fontFamily: "NotoSans", fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          backgroundColor: Color(0xff121212),
                          isScrollControlled: true,
                          showDragHandle: true,
                          builder: (context) => StatefulBuilder(
                            builder: (context, setChildState) => Container(
                              width: double.infinity,
                              padding:
                                  EdgeInsets.only(left: 15, right: 15, bottom: MediaQuery.of(context).padding.bottom),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "Filters",
                                    style: TextStyle(
                                        color: textMainColor,
                                        fontFamily: "Rubik",
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  _scrollablelListWithTitle(setChildState,
                                      title: "Genres", mainList: genres, selectedList: selectedGenres),
                                  _scrollablelListWithTitle(setChildState,
                                      title: "Tags", mainList: tags, selectedList: selectedTags),
                                  Container(
                                    margin: EdgeInsets.only(top: 25),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(right: 20),
                                          child: ElevatedButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            style: ElevatedButton.styleFrom(backgroundColor: accentColor),
                                            child: Text(
                                              "Cancel",
                                              style: TextStyle(color: backgroundColor, fontFamily: "Poppins"),
                                            ),
                                          ),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            getList();
                                            Navigator.of(context).pop();
                                          },
                                          style: ElevatedButton.styleFrom(backgroundColor: accentColor),
                                          child: Text(
                                            "Apply",
                                            style: TextStyle(color: backgroundColor, fontFamily: "Poppins"),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(backgroundColor: backgroundColor),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.filter_alt_rounded,
                            color: textMainColor,
                          ),
                          Text(
                            "filters",
                            style: TextStyle(color: textMainColor),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 10, right: 10, top: 20, bottom: MediaQuery.of(context).padding.bottom),
                child: _searching
                    ? Container(
                        margin: EdgeInsets.only(top: 40),
                        child: Center(
                          child: CircularProgressIndicator(
                            color: accentColor,
                          ),
                        ),
                      )
                    : searchResultsAsWidgets.isEmpty
                        ? Container(
                            margin: EdgeInsets.only(top: 40),
                            child: Center(
                              child: Column(
                                children: [
                                  Container(
                                      padding: EdgeInsets.only(bottom: 10),
                                      child: Image.asset(
                                        'lib/assets/images/ghost.png',
                                        color: textMainColor,
                                      )),
                                  Text(
                                    "~~nooo matches~~",
                                    style: TextStyle(color: textMainColor, fontFamily: "NunitoSans", fontSize: 17),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: MediaQuery.of(context).orientation == Orientation.portrait ? 3 : 6,
                                childAspectRatio: 120 / 220,
                                mainAxisSpacing: 10),
                            shrinkWrap: true,
                            itemCount: searchResultsAsWidgets.length,
                            itemBuilder: (context, index) => GestureDetector(
                              onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => Info(
                                    id: searchResultsAsWidgets[index].info['id'],
                                  ),
                                ),
                              ),
                              child: Container(
                                child: searchResultsAsWidgets[index].widget,
                              ),
                            ),
                          ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column _scrollablelListWithTitle(StateSetter setChildState,
      {required String title, required List<String> mainList, required List<String> selectedList}) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 15, top: 20, left: 20),
              alignment: Alignment.centerLeft,
              child: Text(
                title,
                style: TextStyle(
                  color: textMainColor,
                  fontFamily: "Rubik",
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => StatefulBuilder(
                      builder: (context, setDialogState) => AlertDialog(
                        backgroundColor: Color(0xff121212),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                                padding: EdgeInsets.only(bottom: 20),
                                child: Text(
                                  title,
                                  style: TextStyle(color: textMainColor, fontFamily: "Rubik", fontSize: 23),
                                )),
                            Container(
                              height: 550,
                              width: 500,
                              child: GridView(
                                  shrinkWrap: true,
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 15,
                                    crossAxisSpacing: 15,
                                  ),
                                  children: mainList
                                      .map(
                                        (e) => GestureDetector(
                                          onTap: () {
                                            if (selectedList.contains(e))
                                              selectedList.remove(e);
                                            else
                                              selectedList.add(e);
                                            setChildState(() {});
                                            setDialogState(() {});
                                          },
                                          child: AnimatedContainer(
                                            duration: Duration(milliseconds: 150),
                                            padding: EdgeInsets.only(left: 10, right: 10),
                                            height: 40,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                color: selectedList.contains(e) ? accentColor : backgroundSubColor,
                                                borderRadius: BorderRadius.circular(13)),
                                            child: Text(
                                              e,
                                              style: TextStyle(
                                                  color: selectedList.contains(e) ? backgroundColor : textMainColor,
                                                  fontFamily: "NotoSans",
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      )
                                      .toList()),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                style: ElevatedButton.styleFrom(backgroundColor: accentColor),
                                child: Text(
                                  "close",
                                  style: TextStyle(color: backgroundColor, fontFamily: "Poppins"),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                icon: Icon(
                  Icons.grid_3x3_rounded,
                  color: textMainColor,
                ))
          ],
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: mainList
                .map(
                  (e) => Container(
                    margin: EdgeInsets.only(left: 5, right: 5),
                    child: GestureDetector(
                      onTap: () {
                        if (selectedList.contains(e))
                          selectedList.remove(e);
                        else
                          selectedList.add(e);

                        setChildState(() {});
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 150),
                        padding: EdgeInsets.only(left: 10, right: 10),
                        height: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: selectedList.contains(e) ? accentColor : backgroundSubColor,
                            borderRadius: BorderRadius.circular(13)),
                        child: Text(
                          e,
                          style: TextStyle(
                              color: selectedList.contains(e) ? backgroundColor : textMainColor,
                              fontFamily: "NotoSans",
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}

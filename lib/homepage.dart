import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:story_view/story_view.dart';
import 'package:tala/categories.dart';
import 'package:tala/details.dart';
import 'package:tala/extrait.dart';
import 'package:tala/films.dart';
import 'package:tala/fullpageposter.dart';
import 'package:tala/series.dart';
import 'package:tala/stories.dart';
import 'package:tala/tv_show.dart';
import 'package:tala/utilities/constants.dart';
import 'package:tala/utilities/provides.dart';
import 'package:intl/intl.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  dynamic a_laffiche;
  bool _progressController = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    FirebaseFirestore.instance
        .collection("affiches")
        .where("categorie", isEqualTo: "all")
        .get()
        .then((documentSnapshot) {
      setState(() {
        a_laffiche = documentSnapshot.docs[0].data();
        _progressController = false;
        print("A l affiche");
        print(a_laffiche);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Stack(
      fit: StackFit.expand,
      alignment: Alignment.center,
      children: <Widget>[
        _progressController
            ? Center(
                child: Container(
                    width: 200,
                    height: 200,
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.green,
                    )))
            : Container(
                height: MediaQuery.of(context).size.height,
                child: Material(
                  color: Colors.black,
                  child: Stack(
                    children: <Widget>[
                      CustomScrollView(
                        slivers: <Widget>[
                          SliverAppBar(
                            //pinned: true,
                            floating: false,
                            automaticallyImplyLeading: false,
                            expandedHeight:
                                MediaQuery.of(context).size.height * 0.7,
                            flexibleSpace: FlexibleSpaceBar(
                              background: Stack(children: <Widget>[
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.7,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image:
                                            NetworkImage(a_laffiche['imgurl']),
                                        fit: BoxFit.cover,
                                        alignment: Alignment.bottomCenter),
                                  ),
                                ),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.8,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      stops: [0.1, 0.8, 0.9],
                                      colors: [
                                        Colors.black.withOpacity(0),
                                        Colors.black45,
                                        Colors.black,
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 20,
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .center, //Center Row contents horizontally,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          padding: EdgeInsets.only(
                                            top: 2.0,
                                            bottom: 2.0,
                                          ),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: redcolor),
                                          child: FlatButton(
                                              textColor: whitecolor,
                                              // color: redcolor,

                                              onPressed: () {
                                                FirebaseFirestore.instance
                                                    .collection("logs")
                                                    .add({
                                                  "id": widget.title,
                                                  "time": DateFormat.jm()
                                                      .format(DateTime.now())
                                                });

                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (_) =>
                                                            DetailsPage(
                                                              title: a_laffiche[
                                                                  "title"],
                                                              data: a_laffiche,
                                                            )));
                                              },
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Text(
                                                    "Watch",
                                                    style: TextStyle(
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                            FontWeight.w800),
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Icon(Icons.play_arrow),
                                                ],
                                              )),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: whitecolor),
                                          child: FlatButton(
                                              textColor: Colors.black,
                                              // color: redcolor,

                                              onPressed: () {
                                                Navigator.of(context)
                                                    .push(MaterialPageRoute(
                                                        builder: (_) => Extrait(
                                                              title: a_laffiche[
                                                                  "title"],
                                                              url: a_laffiche[
                                                                  "urlvideotrailer"],
                                                              visible: true,
                                                            )));
                                              },
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Text(
                                                    "Teaser",
                                                    style: TextStyle(
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                            FontWeight.w800),
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Icon(Icons.personal_video),
                                                ],
                                              )),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ]),
                            ),
                          ),
                          SliverList(
                            // itemExtent: 150,
                            delegate: SliverChildListDelegate([
                              // Container(
                              //   padding: EdgeInsets.all(10),
                              //   child: Text(
                              //     "dfssfsdf",
                              //     style: TextStyle(
                              //         color: whitecolor,
                              //         fontSize: 26,
                              //         fontWeight: FontWeight.bold,
                              //         fontFamily: 'quicksand'),
                              //   ),
                              // ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10.0, bottom: 10.0),
                                child: Text("Coming soon",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Ubuntu',
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Container(
                                  // height: 200,
                                  height:
                                      MediaQuery.of(context).size.height * 0.25,
                                  child: StreamBuilder(
                                    stream: FirebaseFirestore.instance
                                        .collection("coming_soon")
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      if (!snapshot.hasData) {
                                        return Center(
                                            child: CircularProgressIndicator());
                                      } else {
                                        var res = snapshot.data.documents;
                                        print("commin soon ****************");
                                        print(snapshot.data.documents);
                                        List<Widget> list = List();

                                        for (int i = 0;
                                            i < snapshot.data.documents.length;
                                            i++) {
                                          print(res);
                                          var ls =
                                              snapshot.data.documents[i].data();

                                          list.add(GestureDetector(
                                            onTap: () {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (_) => Stories(
                                                          stories: ls)));
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Stack(children: <Widget>[
                                                Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.25,
                                                  alignment:
                                                      Alignment.bottomLeft,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                100)),
                                                    image: DecorationImage(
                                                      image: NetworkImage(
                                                          ls['img_url']),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                // Container(
                                                //   height: MediaQuery.of(context)
                                                //           .size
                                                //           .width *
                                                //       0.35,
                                                //   width: MediaQuery.of(context)
                                                //           .size
                                                //           .width *
                                                //       0.35,
                                                //   padding: EdgeInsets.all(20),
                                                //   decoration: BoxDecoration(
                                                //     borderRadius: BorderRadius.all(
                                                //         Radius.circular(20)),
                                                //     gradient: LinearGradient(
                                                //       begin: Alignment.topRight,
                                                //       end: Alignment.bottomLeft,
                                                //       stops: [0.1, 0.5, 0.7, 0.9],
                                                //       colors: [
                                                //         Colors.black.withOpacity(0),
                                                //         Colors.black54,
                                                //         Colors.black87,
                                                //         Colors.black,
                                                //       ],
                                                //     ),
                                                //   ),
                                                // ),
                                                Positioned(
                                                  bottom: 20,
                                                  left: 0,
                                                  child: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.3,
                                                    alignment:
                                                        Alignment.topCenter,
                                                    child: Text(ls['titre'],
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            color: whitecolor,
                                                            fontFamily:
                                                                'Ubuntu',
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700)),
                                                  ),
                                                )
                                              ]),
                                            ),
                                          ));
                                        }
                                        return list.length != 0
                                            ? PageView(
                                                controller: PageController(
                                                    initialPage: 1,
                                                    viewportFraction: 0.3),
                                                scrollDirection:
                                                    Axis.horizontal,
                                                pageSnapping: true,
                                                onPageChanged: (int index) {},
                                                children: list)
                                            : Image.asset(
                                                "assets/images/box.png");
                                      }
                                      // return Container();
                                    },
                                  )),
                              Container(
                                child: FutureBuilder<Object>(
                                    future: Datas().gethistory(),
                                    builder: (context, snapshot) {
                                      var res = snapshot.data;
                                      print(
                                          "something***************************");
                                      print(res);
                                      List<Widget> list = List();

                                      for (var i in res) {
                                        list.add(Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Stack(children: <Widget>[
                                            Container(
                                              height: 200,
                                              alignment: Alignment.bottomLeft,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20)),
                                                image: DecorationImage(
                                                  image:
                                                      NetworkImage(i['imgurl']),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              height: 200,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.8,
                                              padding: EdgeInsets.all(20),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20)),
                                                gradient: LinearGradient(
                                                  begin: Alignment.topRight,
                                                  end: Alignment.bottomLeft,
                                                  stops: [0.1, 0.5, 0.7, 0.9],
                                                  colors: [
                                                    Colors.black.withOpacity(0),
                                                    Colors.black54,
                                                    Colors.black87,
                                                    Colors.black,
                                                  ],
                                                ),
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  // Text(i['titre'],
                                                  //     textAlign: TextAlign.left,
                                                  //     style: TextStyle(
                                                  //         color: whitecolor,
                                                  //         fontFamily: 'quicksand',
                                                  //         fontSize: 36,
                                                  //         fontWeight: FontWeight.bold)),
                                                  Text(i['title'],
                                                      textAlign: TextAlign.left,
                                                      style: TextStyle(
                                                          color: whitecolor,
                                                          fontFamily: 'Ubuntu',
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold))
                                                ],
                                              ),
                                            )
                                          ]),
                                        ));
                                      }
                                      return list.length != 0
                                          ? Column(children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: Text("Last seen",
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontFamily: 'Ubuntu',
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ),
                                              PageView(
                                                controller: PageController(
                                                    viewportFraction: 0.8),
                                                scrollDirection:
                                                    Axis.horizontal,
                                                pageSnapping: true,
                                                onPageChanged: (int index) {},
                                                children: list,
                                              ),
                                            ])
                                          : Container();
                                    }),
                              ),

                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text("Latest Movies",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Ubuntu',
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.3,
                                  child: StreamBuilder(
                                    stream: FirebaseFirestore.instance
                                        .collection("series")
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      if (!snapshot.hasData) {
                                        return Center(
                                            child: CircularProgressIndicator());
                                      } else {
                                        var res = snapshot.data.documents;
                                        print(snapshot.data.documents);
                                        List<Widget> list = List();

                                        for (int i = 0;
                                            i < snapshot.data.documents.length;
                                            i++) {
                                          print(res);
                                          var ls =
                                              snapshot.data.documents[i].data();
                                          list.add(GestureDetector(
                                            onTap: () {
                                              FirebaseFirestore.instance
                                                  .collection("logs")
                                                  .add({
                                                "id": widget.title,
                                                "time": DateFormat.jm()
                                                    .format(DateTime.now())
                                              });

                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (_) =>
                                                          DetailsPage(
                                                            title: widget.title,
                                                            data: ls,
                                                          )));
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Stack(children: <Widget>[
                                                Container(
                                                  height: 200,
                                                  alignment:
                                                      Alignment.bottomLeft,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                20)),
                                                    image: DecorationImage(
                                                      image: NetworkImage(
                                                          ls['imgurl']),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  height: 200,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.8,
                                                  padding: EdgeInsets.all(20),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                20)),
                                                    gradient: LinearGradient(
                                                      begin: Alignment.topRight,
                                                      end: Alignment.bottomLeft,
                                                      stops: [
                                                        0.1,
                                                        0.5,
                                                        0.7,
                                                        0.9
                                                      ],
                                                      colors: [
                                                        Colors.black
                                                            .withOpacity(0),
                                                        Colors.black54,
                                                        Colors.black87,
                                                        Colors.black,
                                                      ],
                                                    ),
                                                  ),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: <Widget>[
                                                      Text(ls['title'],
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: TextStyle(
                                                              color: whitecolor,
                                                              fontFamily:
                                                                  'Ubuntu',
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300)),
                                                      // Text(ls['duration'],
                                                      //     textAlign: TextAlign.left,
                                                      //     style: TextStyle(
                                                      //         color: whitecolor,
                                                      //         fontFamily:
                                                      //             'quicksand',
                                                      //         fontSize: 12,
                                                      //         fontWeight:
                                                      //             FontWeight.bold))
                                                    ],
                                                  ),
                                                )
                                              ]),
                                            ),
                                          ));
                                        }
                                        return list.length != 0
                                            ? PageView(
                                                controller: PageController(
                                                    initialPage: 1,
                                                    viewportFraction: 0.4),
                                                scrollDirection:
                                                    Axis.horizontal,
                                                pageSnapping: true,
                                                onPageChanged: (int index) {},
                                                children: list)
                                            : Image.asset(
                                                "assets/images/box.png");
                                      }
                                      // return Container();
                                    },
                                  )),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text("Latest Series",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Ubuntu',
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.3,
                                  child: StreamBuilder(
                                    stream: FirebaseFirestore.instance
                                        .collection("series")
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      if (!snapshot.hasData) {
                                        return Center(
                                            child: CircularProgressIndicator());
                                      } else {
                                        var res = snapshot.data.documents;
                                        print(snapshot.data.documents);
                                        List<Widget> list = List();

                                        for (int i = 0;
                                            i < snapshot.data.documents.length;
                                            i++) {
                                          print(res);
                                          var ls =
                                              snapshot.data.documents[i].data();
                                          list.add(GestureDetector(
                                            onTap: () {
                                              FirebaseFirestore.instance
                                                  .collection("logs")
                                                  .add({
                                                "id": widget.title,
                                                "time": DateFormat.jm()
                                                    .format(DateTime.now())
                                              });

                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (_) =>
                                                          DetailsPage(
                                                            title: widget.title,
                                                            data: ls,
                                                          )));
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Stack(children: <Widget>[
                                                Container(
                                                  height: 200,
                                                  alignment:
                                                      Alignment.bottomLeft,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                20)),
                                                    image: DecorationImage(
                                                      image: NetworkImage(
                                                          ls['imgurl']),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  height: 200,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.8,
                                                  padding: EdgeInsets.all(20),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                20)),
                                                    gradient: LinearGradient(
                                                      begin: Alignment.topRight,
                                                      end: Alignment.bottomLeft,
                                                      stops: [
                                                        0.1,
                                                        0.5,
                                                        0.7,
                                                        0.9
                                                      ],
                                                      colors: [
                                                        Colors.black
                                                            .withOpacity(0),
                                                        Colors.black54,
                                                        Colors.black87,
                                                        Colors.black,
                                                      ],
                                                    ),
                                                  ),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: <Widget>[
                                                      Text(ls['title'],
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: TextStyle(
                                                              color: whitecolor,
                                                              fontFamily:
                                                                  'Ubuntu',
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300)),
                                                      // Text(ls['duration'],
                                                      //     textAlign: TextAlign.left,
                                                      //     style: TextStyle(
                                                      //         color: whitecolor,
                                                      //         fontFamily:
                                                      //             'quicksand',
                                                      //         fontSize: 12,
                                                      //         fontWeight:
                                                      //             FontWeight.bold))
                                                    ],
                                                  ),
                                                )
                                              ]),
                                            ),
                                          ));
                                        }
                                        return list.length != 0
                                            ? PageView(
                                                controller: PageController(
                                                    initialPage: 1,
                                                    viewportFraction: 0.4),
                                                scrollDirection:
                                                    Axis.horizontal,
                                                pageSnapping: true,
                                                onPageChanged: (int index) {},
                                                children: list)
                                            : Image.asset(
                                                "assets/images/box.png");
                                      }
                                      // return Container();
                                    },
                                  )),

                              SizedBox(
                                height: 40,
                              )
                            ]),
                          ),
                        ],
                      ),
                      // Positioned(
                      //   top: 10,
                      //   child: Container(
                      //     width: screenSize.width,
                      //     height: 30.0,
                      //     child: Row(
                      //       mainAxisSize: MainAxisSize.min,
                      //       crossAxisAlignment: CrossAxisAlignment.center,
                      //       children: <Widget>[
                      //         IconButton(
                      //           padding: EdgeInsets.all(0.0),
                      //           color: Colors.white,
                      //           icon: Icon(Icons.arrow_back),
                      //           onPressed: () => Navigator.of(context).pop(),
                      //         ),
                      //         Container(
                      //           width: screenSize.width - 100.0,
                      //           child: Center(
                      //             child: Text(
                      //               widget.title,
                      //               style: TextStyle(
                      //                 color: Colors.white,
                      //                 fontSize: 14.0,
                      //               ),
                      //             ),
                      //           ),
                      //         )
                      //       ],
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                )),
        Positioned(
          top: 10,
          left: 0,
          child: Container(
            padding: EdgeInsets.only(top: 30),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.2,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.4, 0.7, 0.9],
                colors: [
                  Colors.black45,
                  Colors.black26,
                  Colors.black.withOpacity(0),
                ],
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                FlatButton(
                    textColor: whitecolor,
                    // color: redcolor,
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => MyHomePage(
                                title: '',
                              )));
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Column(children: [
                          Text(
                            "Home",
                            style: TextStyle(
                                // shadows: [
                                //   BoxShadow(
                                //       color: darkcolor,
                                //       blurRadius: 5,
                                //       offset: Offset.zero),
                                //   BoxShadow(
                                //       color: darkcolor,
                                //       blurRadius: 5,
                                //       offset: Offset.zero),
                                //   BoxShadow(
                                //       color: darkcolor,
                                //       blurRadius: 5,
                                //       offset: Offset.zero)
                                // ],
                                // decoration: TextDecoration.underline,
                                fontSize: 15.0,
                                fontWeight: FontWeight.w800),
                          ),
                        ]),
                      ],
                    )),
                FlatButton(
                    textColor: whitecolor,
                    // color: redcolor,

                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => MoviesPage(title: "")));
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Column(children: [
                          Text(
                            "Movies",
                            style: TextStyle(
                                // shadows: [
                                //   BoxShadow(
                                //       color: Colors.black12,
                                //       blurRadius: 5,
                                //       offset: Offset.zero),
                                //   BoxShadow(
                                //       color: darkcolor,
                                //       blurRadius: 5,
                                //       offset: Offset.zero),
                                //   BoxShadow(
                                //       color: darkcolor,
                                //       blurRadius: 5,
                                //       offset: Offset.zero)
                                // ],

                                // decoration: TextDecoration.underline,
                                fontSize: 15.0,
                                fontWeight: FontWeight.w800),
                          ),
                          // widget.title == 3
                          //     ? Container(
                          //         width: 50,
                          //         margin: EdgeInsets.only(bottom: 5.0, top: 5.0),
                          //         padding: EdgeInsets.only(top: 2.0, bottom: 2.0),
                          //         decoration: BoxDecoration(
                          //             borderRadius: BorderRadius.circular(20),
                          //             color: redcolor),
                          //       )
                          //     : Container()
                        ]),
                      ],
                    )),
                FlatButton(
                    textColor: whitecolor,
                    // color: redcolor,

                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => SeriesPage(title: "")));
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Column(children: [
                          Text(
                            "Series",
                            style: TextStyle(
                                // shadows: [
                                //   BoxShadow(
                                //       color: darkcolor,
                                //       blurRadius: 5,
                                //       offset: Offset.zero),
                                //   BoxShadow(
                                //       color: darkcolor,
                                //       blurRadius: 5,
                                //       offset: Offset.zero),
                                //   BoxShadow(
                                //       color: Colors.black12,
                                //       blurRadius: 5,
                                //       offset: Offset.zero)
                                // ],
                                // decoration: TextDecoration.underline,
                                fontSize: 15.0,
                                fontWeight: FontWeight.w800),
                          ),
                          // widget.title == 1
                          //     ? Container(
                          //         width: 50,
                          //         margin: EdgeInsets.only(bottom: 5.0, top: 5.0),
                          //         padding: EdgeInsets.only(top: 2.0, bottom: 2.0),
                          //         decoration: BoxDecoration(
                          //             borderRadius: BorderRadius.circular(20),
                          //             color: redcolor),
                          //       )
                          //     : Container()
                        ]),
                      ],
                    )),
                FlatButton(
                    textColor: whitecolor,
                    // color: redcolor,

                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => ShowsPage(title: "")));
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Column(children: [
                          Text(
                            "TV Show",
                            style: TextStyle(
                                // shadows: [
                                //   BoxShadow(
                                //       color: darkcolor,
                                //       blurRadius: 5,
                                //       offset: Offset.zero),
                                //   BoxShadow(
                                //       color: darkcolor,
                                //       blurRadius: 5,
                                //       offset: Offset.zero),
                                //   BoxShadow(
                                //       color: Colors.black12,
                                //       blurRadius: 5,
                                //       offset: Offset.zero)
                                // ],
                                // decoration: TextDecoration.underline,
                                fontSize: 15.0,
                                fontWeight: FontWeight.w800),
                          ),
                          // widget.title == 1
                          //     ? Container(
                          //         width: 50,
                          //         margin: EdgeInsets.only(bottom: 5.0, top: 5.0),
                          //         padding: EdgeInsets.only(top: 2.0, bottom: 2.0),
                          //         decoration: BoxDecoration(
                          //             borderRadius: BorderRadius.circular(20),
                          //             color: redcolor),
                          //       )
                          //     : Container()
                        ]),
                      ],
                    )),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

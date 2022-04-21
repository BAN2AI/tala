import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:tala/details.dart';
import 'package:tala/extrait.dart';
import 'package:tala/fullpageposter.dart';
import 'package:tala/homepage.dart';
import 'package:tala/series.dart';
import 'package:tala/utilities/constants.dart';
import 'package:intl/intl.dart';

class CategoriesPage extends StatefulWidget {
  final int title;
  final String categorie;

  CategoriesPage({Key key, this.title, this.categorie}) : super(key: key);

  // dynamic pages = [
  //   Fullpagefilm(
  //       title: "La donia",
  //       duration: "250 epsiodes",
  //       urlvideotrailer:
  //           "https://www.videvo.net/videvo_files/converted/2013_08/preview/hd0903.mov36970.webm",
  //       type: "Novelas",
  //       imgurl: "assets/images/tenu-min1.jpg",
  //       description:
  //           "Marimar is an innocent girl who lives on the beach with her elderly grandparents. They are very poor, and sometimes, Marimar has to steal to keep food on the table. One day she finds herself in need and she goes to the Hacienda Ibanez to steal some vegetables and eggs for her family. The foreman catches her redhanded and attempts to take advantage of her; he tells her that she can take the vegetables if she lets him kiss her. Marimar resists and her screams bring Sergio, the spoiled son of the house, running. He defends her and then tells her that under all her grime she is beautiful.Marimar falls in love with him on the spot. And when Sergio hatches a plot to revenge himself on his family because they won't give him his half of the inheritance, insisting that he settle down once and for all, he concieves of a plan to marry the 'dirty girl from the beach' to humiliate them. Marimar, dazzled, agrees to marry Sergio and falls into his fiendish plot without knowing that her own father, an extremely wealthy man who abandoned her mother, is looking for her now to make her his heir."),
  //   Fullpagefilm(
  //       title: "Marimar",
  //       duration: "50 epsiodes",
  //       urlvideotrailer:
  //           "https://www.videvo.net/videvo_files/converted/2013_08/preview/hd0903.mov36970.webm",
  //       type: "Novelas",
  //       imgurl: "assets/images/The-antique1-790x1116.jpg",
  //       description:
  //           "Marimar is an innocent girl who lives on the beach with her elderly grandparents. They are very poor, and sometimes, Marimar has to steal to keep food on the table. One day she finds herself in need and she goes to the Hacienda Ibanez to steal some vegetables and eggs for her family. The foreman catches her redhanded and attempts to take advantage of her; he tells her that she can take the vegetables if she lets him kiss her. Marimar resists and her screams bring Sergio, the spoiled son of the house, running. He defends her and then tells her that under all her grime she is beautiful.Marimar falls in love with him on the spot. And when Sergio hatches a plot to revenge himself on his family because they won't give him his half of the inheritance, insisting that he settle down once and for all, he concieves of a plan to marry the 'dirty girl from the beach' to humiliate them. Marimar, dazzled, agrees to marry Sergio and falls into his fiendish plot without knowing that her own father, an extremely wealthy man who abandoned her mother, is looking for her now to make her his heir."),
  //   Fullpagefilm(
  //       title: "Dr. Damian",
  //       duration: "10",
  //       urlvideotrailer:
  //           "https://www.videvo.net/videvo_files/converted/2013_08/preview/hd0903.mov36970.webm",
  //       type: "Nollywood",
  //       imgurl: "assets/images/814WnhtdB0L._AC_SL1500_.jpg",
  //       description:
  //           "Marimar is an innocent girl who lives on the beach with her elderly grandparents. They are very poor, and sometimes, Marimar has to steal to keep food on the table. One day she finds herself in need and she goes to the Hacienda Ibanez to steal some vegetables and eggs for her family. The foreman catches her redhanded and attempts to take advantage of her; he tells her that she can take the vegetables if she lets him kiss her. Marimar resists and her screams bring Sergio, the spoiled son of the house, running. He defends her and then tells her that under all her grime she is beautiful.Marimar falls in love with him on the spot. And when Sergio hatches a plot to revenge himself on his family because they won't give him his half of the inheritance, insisting that he settle down once and for all, he concieves of a plan to marry the 'dirty girl from the beach' to humiliate them. Marimar, dazzled, agrees to marry Sergio and falls into his fiendish plot without knowing that her own father, an extremely wealthy man who abandoned her mother, is looking for her now to make her his heir."),
  //   Fullpagefilm(
  //       title: "IJE",
  //       duration: "1heures",
  //       urlvideotrailer:
  //           "https://www.videvo.net/videvo_files/converted/2013_08/preview/hd0903.mov36970.webm",
  //       type: "Nollywood",
  //       imgurl: "assets/images/Ije-the-Movie-691x1024.jpg",
  //       description:
  //           "Marimar is an innocent girl who lives on the beach with her elderly grandparents. They are very poor, and sometimes, Marimar has to steal to keep food on the table. One day she finds herself in need and she goes to the Hacienda Ibanez to steal some vegetables and eggs for her family. The foreman catches her redhanded and attempts to take advantage of her; he tells her that she can take the vegetables if she lets him kiss her. Marimar resists and her screams bring Sergio, the spoiled son of the house, running. He defends her and then tells her that under all her grime she is beautiful.Marimar falls in love with him on the spot. And when Sergio hatches a plot to revenge himself on his family because they won't give him his half of the inheritance, insisting that he settle down once and for all, he concieves of a plan to marry the 'dirty girl from the beach' to humiliate them. Marimar, dazzled, agrees to marry Sergio and falls into his fiendish plot without knowing that her own father, an extremely wealthy man who abandoned her mother, is looking for her now to make her his heir."),
  //   Fullpagefilm(
  //       title: "Booliwood cavistra",
  //       duration: "3heures",
  //       urlvideotrailer:
  //           "https://www.videvo.net/videvo_files/converted/2013_08/preview/hd0903.mov36970.webm",
  //       type: "Bollywood",
  //       imgurl: "assets/images/sss.jpg",
  //       description:
  //           "Marimar is an innocent girl who lives on the beach with her elderly grandparents. They are very poor, and sometimes, Marimar has to steal to keep food on the table. One day she finds herself in need and she goes to the Hacienda Ibanez to steal some vegetables and eggs for her family. The foreman catches her redhanded and attempts to take advantage of her; he tells her that she can take the vegetables if she lets him kiss her. Marimar resists and her screams bring Sergio, the spoiled son of the house, running. He defends her and then tells her that under all her grime she is beautiful.Marimar falls in love with him on the spot. And when Sergio hatches a plot to revenge himself on his family because they won't give him his half of the inheritance, insisting that he settle down once and for all, he concieves of a plan to marry the 'dirty girl from the beach' to humiliate them. Marimar, dazzled, agrees to marry Sergio and falls into his fiendish plot without knowing that her own father, an extremely wealthy man who abandoned her mother, is looking for her now to make her his heir."),
  //   Fullpagefilm(
  //       title: "La donia",
  //       duration: "500 episodes",
  //       urlvideotrailer: "https://youtu.be/1547182.jpg",
  //       type: "Novelas",
  //       imgurl: "assets/images/0510d7ab7c59d475ef2ef1f170e57f0a.jpg",
  //       description:
  //           "Marimar is an innocent girl who lives on the beach with her elderly grandparents. They are very poor, and sometimes, Marimar has to steal to keep food on the table. One day she finds herself in need and she goes to the Hacienda Ibanez to steal some vegetables and eggs for her family. The foreman catches her redhanded and attempts to take advantage of her; he tells her that she can take the vegetables if she lets him kiss her. Marimar resists and her screams bring Sergio, the spoiled son of the house, running. He defends her and then tells her that under all her grime she is beautiful.Marimar falls in love with him on the spot. And when Sergio hatches a plot to revenge himself on his family because they won't give him his half of the inheritance, insisting that he settle down once and for all, he concieves of a plan to marry the 'dirty girl from the beach' to humiliate them. Marimar, dazzled, agrees to marry Sergio and falls into his fiendish plot without knowing that her own father, an extremely wealthy man who abandoned her mother, is looking for her now to make her his heir.")
  // ];

  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  List<dynamic> film = List();
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
    //   return Stack(
    //     fit: StackFit.expand,
    //     alignment: Alignment.center,
    //     children: <Widget>[
    //       Container(
    //           height: MediaQuery.of(context).size.height,
    //           child: StreamBuilder(
    //             stream: FirebaseFirestore.instance
    //                 .collection("series")
    //                 .where('type', isEqualTo: widget.categorie)
    //                 .snapshots(),
    //             builder: (context, snapshot) {
    //               if (!snapshot.hasData) {
    //                 return Center(child: CircularProgressIndicator());
    //               } else {
    //                 var res = snapshot.data.documents;
    //                 print(snapshot.data.documents);
    //                 List<Widget> list = List();

    //                 for (int i = 0; i < snapshot.data.documents.length; i++) {
    //                   print(res);
    //                   var ls = snapshot.data.documents[i].data();
    //                   list.add(Fullpagefilm(
    //                       title: ls['title'],
    //                       duration: ls['duration'],
    //                       urlvideotrailer: ls["urlvideotrailer"],
    //                       data: ls,
    //                       type: ls['type'],
    //                       imgurl: ls['imgurl'],
    //                       description: ls['description']));
    //                 }
    //                 return list.length != 0
    //                     ? LiquidSwipe(
    //                         pages: list,
    //                         enableLoop: false,
    //                         fullTransitionValue: 300,
    //                         enableSlideIcon: true,
    //                         slideIconWidget: Container(
    //                             padding: EdgeInsets.all(5),
    //                             decoration: BoxDecoration(
    //                                 boxShadow: [
    //                                   BoxShadow(
    //                                       color: Colors.black,
    //                                       offset: Offset.zero,
    //                                       blurRadius: 50)
    //                                 ],
    //                                 borderRadius: BorderRadius.only(
    //                                     topLeft: Radius.circular(50.0),
    //                                     bottomLeft: Radius.circular(50.0)),
    //                                 color: redcolor),
    //                             child: Icon(
    //                               Icons.arrow_back_ios,
    //                               color: Colors.white,
    //                             )),
    //                         waveType: WaveType.liquidReveal,
    //                         positionSlideIcon: 0.3,
    //                       )
    //                     : Image.asset("assets/images/box.png");
    //               }
    //               // return Container();
    //             },
    //           )),
    //       Positioned(
    //         top: 20,
    //         left: 0,
    //         child: Row(
    //           children: <Widget>[
    //             FlatButton(
    //                 textColor: whitecolor,
    //                 // color: redcolor,

    //                 onPressed: () {
    //                   Navigator.of(context).push(MaterialPageRoute(
    //                       builder: (_) => MyHomePage(
    //                             title: '',
    //                           )));
    //                 },
    //                 child: Row(
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   mainAxisAlignment: MainAxisAlignment.spaceAround,
    //                   children: <Widget>[
    //                     Column(children: [
    //                       Text(
    //                         "Tous",
    //                         style: TextStyle(
    //                             // shadows: [
    //                             //   BoxShadow(
    //                             //       color: darkcolor,
    //                             //       blurRadius: 5,
    //                             //       offset: Offset.zero),
    //                             //   BoxShadow(
    //                             //       color: darkcolor,
    //                             //       blurRadius: 5,
    //                             //       offset: Offset.zero),
    //                             //   BoxShadow(
    //                             //       color: darkcolor,
    //                             //       blurRadius: 5,
    //                             //       offset: Offset.zero)
    //                             // ],
    //                             // decoration: TextDecoration.underline,
    //                             fontSize: 16.0,
    //                             fontWeight: FontWeight.w800),
    //                       ),
    //                     ]),
    //                   ],
    //                 )),
    //             FlatButton(
    //                 textColor: whitecolor,
    //                 // color: redcolor,

    //                 onPressed: () {
    //                   Navigator.of(context).push(MaterialPageRoute(
    //                       builder: (_) => CategoriesPage(
    //                             title: 3,
    //                             categorie: "Novelas",
    //                           )));
    //                 },
    //                 child: Row(
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   mainAxisAlignment: MainAxisAlignment.spaceAround,
    //                   children: <Widget>[
    //                     Column(children: [
    //                       Text(
    //                         "Novelas",
    //                         style: TextStyle(
    //                             // shadows: [
    //                             //   BoxShadow(
    //                             //       color: Colors.black12,
    //                             //       blurRadius: 5,
    //                             //       offset: Offset.zero),
    //                             //   BoxShadow(
    //                             //       color: darkcolor,
    //                             //       blurRadius: 5,
    //                             //       offset: Offset.zero),
    //                             //   BoxShadow(
    //                             //       color: darkcolor,
    //                             //       blurRadius: 5,
    //                             //       offset: Offset.zero)
    //                             // ],

    //                             // decoration: TextDecoration.underline,
    //                             fontSize: 16.0,
    //                             fontWeight: FontWeight.w800),
    //                       ),
    //                       // widget.title == 3
    //                       //     ? Container(
    //                       //         width: 50,
    //                       //         margin: EdgeInsets.only(bottom: 5.0, top: 5.0),
    //                       //         padding: EdgeInsets.only(top: 2.0, bottom: 2.0),
    //                       //         decoration: BoxDecoration(
    //                       //             borderRadius: BorderRadius.circular(20),
    //                       //             color: redcolor),
    //                       //       )
    //                       //     : Container()
    //                     ]),
    //                   ],
    //                 )),
    //             FlatButton(
    //                 textColor: whitecolor,
    //                 // color: redcolor,

    //                 onPressed: () {
    //                   Navigator.of(context).push(MaterialPageRoute(
    //                       builder: (_) => CategoriesPage(
    //                             title: 1,
    //                             categorie: "Nollywood",
    //                           )));
    //                 },
    //                 child: Row(
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   mainAxisAlignment: MainAxisAlignment.spaceAround,
    //                   children: <Widget>[
    //                     Column(children: [
    //                       Text(
    //                         "Nollywood",
    //                         style: TextStyle(
    //                             // shadows: [
    //                             //   BoxShadow(
    //                             //       color: darkcolor,
    //                             //       blurRadius: 5,
    //                             //       offset: Offset.zero),
    //                             //   BoxShadow(
    //                             //       color: darkcolor,
    //                             //       blurRadius: 5,
    //                             //       offset: Offset.zero),
    //                             //   BoxShadow(
    //                             //       color: Colors.black12,
    //                             //       blurRadius: 5,
    //                             //       offset: Offset.zero)
    //                             // ],
    //                             // decoration: TextDecoration.underline,
    //                             fontSize: 16.0,
    //                             fontWeight: FontWeight.w800),
    //                       ),
    //                       // widget.title == 1
    //                       //     ? Container(
    //                       //         width: 50,
    //                       //         margin: EdgeInsets.only(bottom: 5.0, top: 5.0),
    //                       //         padding: EdgeInsets.only(top: 2.0, bottom: 2.0),
    //                       //         decoration: BoxDecoration(
    //                       //             borderRadius: BorderRadius.circular(20),
    //                       //             color: redcolor),
    //                       //       )
    //                       //     : Container()
    //                     ]),
    //                   ],
    //                 )),
    //             FlatButton(
    //                 textColor: whitecolor,
    //                 // color: redcolor,

    //                 onPressed: () {
    //                   Navigator.of(context).push(MaterialPageRoute(
    //                       builder: (_) => CategoriesPage(
    //                             title: 2,
    //                             categorie: "Bollywood",
    //                           )));
    //                 },
    //                 child: Row(
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   mainAxisAlignment: MainAxisAlignment.spaceAround,
    //                   children: <Widget>[
    //                     Column(children: [
    //                       Text(
    //                         "Indien",
    //                         style: TextStyle(
    //                             // shadows: [
    //                             //   BoxShadow(
    //                             //       color: Colors.black12,
    //                             //       blurRadius: 5,
    //                             //       offset: Offset.zero),
    //                             //   BoxShadow(
    //                             //       color: darkcolor,
    //                             //       blurRadius: 5,
    //                             //       offset: Offset.zero),
    //                             //   BoxShadow(
    //                             //       color: darkcolor,
    //                             //       blurRadius: 5,
    //                             //       offset: Offset.zero)
    //                             // ],
    //                             // decoration: TextDecoration.underline,
    //                             fontSize: 16.0,
    //                             fontWeight: FontWeight.w800),
    //                       ),
    //                       // widget.title == 2
    //                       //     ? Container(
    //                       //         width: 50,
    //                       //         margin: EdgeInsets.only(bottom: 5.0, top: 5.0),
    //                       //         padding: EdgeInsets.only(top: 2.0, bottom: 2.0),
    //                       //         decoration: BoxDecoration(
    //                       //             borderRadius: BorderRadius.circular(20),
    //                       //             color: redcolor),
    //                       //       )
    //                       //     : Container()
    //                     ]),
    //                   ],
    //                 )),
    //           ],
    //         ),
    //       ),
    //     ],
    //   );
    // }
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
                            expandedHeight:
                                MediaQuery.of(context).size.height * 0.5,
                            flexibleSpace: FlexibleSpaceBar(
                              background: Stack(children: <Widget>[
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.6,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image:
                                            NetworkImage(a_laffiche['imgurl']),
                                        fit: BoxFit.cover,
                                        alignment: Alignment.topCenter),
                                  ),
                                ),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.6,
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
                                  bottom: 80,
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        width: 200,
                                        padding: EdgeInsets.only(
                                            top: 2.0, bottom: 2.0),
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
                                padding: const EdgeInsets.all(10.0),
                                child: Text("Latest Movies",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'quicksand',
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.4,
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
                                                "id": ls['title'],
                                                "time": DateFormat.jm()
                                                    .format(DateTime.now())
                                              });

                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (_) =>
                                                          DetailsPage(
                                                            title: ls['title'],
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
                                                                  'quicksand',
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                      Text(ls['duration'],
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: TextStyle(
                                                              color: whitecolor,
                                                              fontFamily:
                                                                  'quicksand',
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold))
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
                                        fontFamily: 'quicksand',
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Container(
                                height: 250,
                                child: PageView(
                                  controller:
                                      PageController(viewportFraction: 0.4),
                                  scrollDirection: Axis.horizontal,
                                  pageSnapping: true,
                                  onPageChanged: (int index) {},
                                  children:
                                      // getList(widget.data['data']['episodes'])

                                      <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Stack(children: <Widget>[
                                        Container(
                                          height: 200,
                                          alignment: Alignment.bottomLeft,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20)),
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/images/The-antique1-790x1116.jpg"),
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
                                              Text("La donia",
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                      color: whitecolor,
                                                      fontFamily: 'quicksand',
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              Text("Episodes 20, Saiso 2",
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                      color: whitecolor,
                                                      fontFamily: 'quicksand',
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold))
                                            ],
                                          ),
                                        )
                                      ]),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Stack(children: <Widget>[
                                        Container(
                                          height: 200,
                                          alignment: Alignment.bottomLeft,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20)),
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/images/The-antique1-790x1116.jpg"),
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
                                              Text("La donia",
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                      color: whitecolor,
                                                      fontFamily: 'quicksand',
                                                      fontSize: 36,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              Text("Episodes 20, Saiso 2",
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                      color: whitecolor,
                                                      fontFamily: 'quicksand',
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold))
                                            ],
                                          ),
                                        )
                                      ]),
                                    )
                                  ],
                                ),
                              ),
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
          top: 0,
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
                                fontSize: 16.0,
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
                          builder: (_) => SeriesPage(
                                title: "",
                              )));
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
                                fontSize: 16.0,
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
                          builder: (_) => CategoriesPage(
                                title: 1,
                                categorie: "Nollywood",
                              )));
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
                                fontSize: 16.0,
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
                          builder: (_) => CategoriesPage(
                                title: 1,
                                categorie: "Nollywood",
                              )));
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Column(children: [
                          Text(
                            "Last Watched",
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
                                fontSize: 16.0,
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

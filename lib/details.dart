import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:tala/categories.dart';
import 'package:tala/extrait.dart';
import 'package:tala/fullpageposter.dart';
import 'package:tala/utilities/constants.dart';
import 'package:tala/utilities/provides.dart';

class DetailsPage extends StatefulWidget {
  DetailsPage({Key key, this.title, this.data}) : super(key: key);

  final String title;
  final dynamic data;

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Material(
      color: Colors.black,
      child: Stack(
        children: <Widget>[
          CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                //pinned: true,

                floating: false,
                actions: <Widget>[
                  // IconButton(
                  //   padding: EdgeInsets.all(0.0),
                  //   color: Colors.white,
                  //   icon: Icon(Icons.arrow_back),
                  //   onPressed: () => Navigator.of(context).pop(),
                  // )
                ],
                expandedHeight: MediaQuery.of(context).size.height * 0.5,
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height * 0.6,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(widget.data["imgurl"]),
                            fit: BoxFit.cover,
                            alignment: Alignment.topCenter),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.6,
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
                    )
                  ]),
                ),
              ),
              SliverList(
                // itemExtent: 150,
                delegate: SliverChildListDelegate([
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      widget.data['title'],
                      style: TextStyle(
                          color: whitecolor,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'quicksand'),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(right: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: redcolor),
                        child: Text(widget.data["type"],
                            style: TextStyle(
                                color: whitecolor,
                                fontSize: 19,
                                fontFamily: 'Ubuntu')),
                      ),
                      Text(widget.data["duration"],
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Ubuntu',
                              fontSize: 18,
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      widget.data['description'],
                      style: TextStyle(
                          color: whitecolor,
                          fontSize: 19,
                          fontFamily: 'Ubuntu'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("Episodes",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Ubuntu',
                            fontSize: 24,
                            fontWeight: FontWeight.w700)),
                  ),
                  Container(
                    height: 250,
                    child: PageView(
                        controller: PageController(viewportFraction: 0.8),
                        scrollDirection: Axis.vertical,
                        pageSnapping: true,
                        onPageChanged: (int index) {},
                        children: getList(widget.data['data']['episodes'])

                        // <Widget>[
                        //   Padding(
                        //     padding: const EdgeInsets.all(10.0),
                        //     child: Stack(children: <Widget>[
                        //       Container(
                        //         height: 200,
                        //         alignment: Alignment.bottomLeft,
                        //         decoration: BoxDecoration(
                        //           borderRadius:
                        //               BorderRadius.all(Radius.circular(20)),
                        //           image: DecorationImage(
                        //             image: NetworkImage(widget.data['imgurl']),
                        //             fit: BoxFit.cover,
                        //           ),
                        //         ),
                        //       ),
                        //       Container(
                        //         height: 200,
                        //         width: MediaQuery.of(context).size.width * 0.8,
                        //         padding: EdgeInsets.all(20),
                        //         decoration: BoxDecoration(
                        //           borderRadius:
                        //               BorderRadius.all(Radius.circular(20)),
                        //           gradient: LinearGradient(
                        //             begin: Alignment.topRight,
                        //             end: Alignment.bottomLeft,
                        //             stops: [0.1, 0.5, 0.7, 0.9],
                        //             colors: [
                        //               Colors.black.withOpacity(0),
                        //               Colors.black54,
                        //               Colors.black87,
                        //               Colors.black,
                        //             ],
                        //           ),
                        //         ),
                        //         child: Column(
                        //           mainAxisAlignment: MainAxisAlignment.end,
                        //           crossAxisAlignment: CrossAxisAlignment.start,
                        //           children: <Widget>[
                        //             Text("La donia",
                        //                 textAlign: TextAlign.left,
                        //                 style: TextStyle(
                        //                     color: whitecolor,
                        //                     fontFamily: 'quicksand',
                        //                     fontSize: 36,
                        //                     fontWeight: FontWeight.bold)),
                        //             Text("Episodes 20, Saiso 2",
                        //                 textAlign: TextAlign.left,
                        //                 style: TextStyle(
                        //                     color: whitecolor,
                        //                     fontFamily: 'quicksand',
                        //                     fontSize: 20,
                        //                     fontWeight: FontWeight.bold))
                        //           ],
                        //         ),
                        //       )
                        //     ]),
                        //   ),
                        // ],
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
    );
  }

  List<Widget> getList(dynamic table) {
    List<Widget> list = List();

    for (var res in table) {
      list.add(
        GestureDetector(
          onTap: () {
            Datas().addToHistory({
              "title": res['title'],
              "url": res['urlvideo'],
              "imgurl": widget.data["imgurl"],
              "data": widget.data
            });
            Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => Extrait(
                      title: res['title'],
                      url: res['urlvideo'],
                      visible: true,
                    )));
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Stack(children: <Widget>[
              Container(
                height: 200,
                alignment: Alignment.bottomLeft,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  image: DecorationImage(
                    image: NetworkImage(widget.data['imgurl']),
                    alignment: Alignment.topCenter,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                height: 200,
                width: MediaQuery.of(context).size.height * 0.7,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    stops: [0.1, 0.6, 0.7, 0.9],
                    colors: [
                      Colors.black.withOpacity(0),
                      Colors.black45,
                      Colors.black54,
                      Colors.black87,
                    ],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(res['title'],
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: whitecolor,
                            fontFamily: 'quicksand',
                            fontSize: 20,
                            fontWeight: FontWeight.bold))
                  ],
                ),
              )
            ]),
          ),
        ),
      );
    }
    return list;
  }
}

RISEANDFALL.jpg
WISHINGOFTOMORROW.jpg
ONLUSAKAROAD.jpg
GRACEMUSONDASTANDUP.jpg
WOMANOFPOWER.jpg

Stack(
      fit: StackFit.expand,
      alignment: Alignment.center,
      children: <Widget>[
        Container(
            height: MediaQuery.of(context).size.height,
            child: StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection("series").snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  var res = snapshot.data.documents;
                  print(snapshot.data.documents);
                  List<Widget> list = List();

                  for (int i = 0; i < snapshot.data.documents.length; i++) {
                    print(res);
                    var ls = snapshot.data.documents[i].data();
                    list.add(Fullpagefilm(
                        title: ls['title'],
                        duration: ls['duration'],
                        urlvideotrailer: ls["urlvideotrailer"],
                        type: ls['type'],
                        data: ls,
                        imgurl: ls['imgurl'],
                        description: ls['description']));
                  }
                  return list.length != 0
                      ? LiquidSwipe(
                          pages: list,
                          enableLoop: false,
                          fullTransitionValue: 300,
                          enableSlideIcon: true,
                          slideIconWidget: Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black,
                                        offset: Offset.zero,
                                        blurRadius: 50)
                                  ],
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(50.0),
                                      bottomLeft: Radius.circular(50.0)),
                                  color: redcolor),
                              child: Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                              )),
                          waveType: WaveType.liquidReveal,
                          positionSlideIcon: 0.3,
                        )
                      : Image.asset("assets/images/box.png");
                }
                // return Container();
              },
            )),
        Positioned(
          top: 20,
          left: 0,
          child: Row(
            children: <Widget>[
              FlatButton(
                  textColor: whitecolor,
                  // color: redcolor,

                  onPressed: () {},
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Column(children: [
                        Text(
                          "Tous",
                          style: TextStyle(
                              shadows: [
                                BoxShadow(
                                    color: darkcolor,
                                    blurRadius: 5,
                                    offset: Offset.zero),
                                BoxShadow(
                                    color: darkcolor,
                                    blurRadius: 5,
                                    offset: Offset.zero),
                                BoxShadow(
                                    color: darkcolor,
                                    blurRadius: 5,
                                    offset: Offset.zero)
                              ],
                              // decoration: TextDecoration.underline,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w800),
                        ),
                        Container(
                          width: 50,
                          margin: EdgeInsets.only(bottom: 5.0, top: 5.0),
                          padding: EdgeInsets.only(top: 2.0, bottom: 2.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: redcolor),
                        )
                      ]),
                    ],
                  )),
              FlatButton(
                  textColor: whitecolor,
                  // color: redcolor,

                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => CategoriesPage(
                              title: 3,
                              categorie: "Novelas",
                            )));
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Novelas",
                        style: TextStyle(shadows: [
                          BoxShadow(
                              color: darkcolor,
                              blurRadius: 5,
                              offset: Offset.zero),
                          BoxShadow(
                              color: darkcolor,
                              blurRadius: 5,
                              offset: Offset.zero),
                          BoxShadow(
                              color: darkcolor,
                              blurRadius: 5,
                              offset: Offset.zero)
                        ], fontSize: 16.0, fontWeight: FontWeight.w800),
                      ),
                      // SizedBox(
                      //   width: 5,
                      // ),
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Nollywood",
                        style: TextStyle(shadows: [
                          BoxShadow(
                              color: darkcolor,
                              blurRadius: 5,
                              offset: Offset.zero),
                          BoxShadow(
                              color: darkcolor,
                              blurRadius: 5,
                              offset: Offset.zero),
                          BoxShadow(
                              color: darkcolor,
                              blurRadius: 5,
                              offset: Offset.zero)
                        ], fontSize: 16.0, fontWeight: FontWeight.w800),
                      ),
                    ],
                  )),
              FlatButton(
                  textColor: whitecolor,
                  // color: redcolor,

                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => CategoriesPage(
                              title: 2,
                              categorie: "Bollywood",
                            )));
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Indien",
                        style: TextStyle(shadows: [
                          BoxShadow(
                              color: darkcolor,
                              blurRadius: 5,
                              offset: Offset.zero),
                          BoxShadow(
                              color: darkcolor,
                              blurRadius: 5,
                              offset: Offset.zero),
                          BoxShadow(
                              color: darkcolor,
                              blurRadius: 5,
                              offset: Offset.zero)
                        ], fontSize: 16.0, fontWeight: FontWeight.w800),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ],
    );
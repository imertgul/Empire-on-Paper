import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import '../utilities/constant.dart';
import 'package:map_game/pages/LobbyPage.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    myScreen = new Size(
        MediaQuery.of(context).size.width, MediaQuery.of(context).size.height);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Empire on Paper",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Work in progress ver:0.1",
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: Icon(Icons.menu),
                onPressed: () => print("Menu"),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 150,
                    viewportFraction: 0.2,
                    aspectRatio: 10 / 9,
                    enableInfiniteScroll: false,
                    enlargeCenterPage: true,
                    enlargeStrategy: CenterPageEnlargeStrategy.scale,
                    disableCenter: true,
                  ),
                  carouselController: _controller,
                  items: [
                    FlatButton(
                      color: Colors.black87,
                      splashColor: Colors.lime,
                      height: 150,
                      minWidth: 150,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LobbyPage(),
                          ),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            FontAwesome5.user,
                            color: Colors.white,
                          ),
                          Icon(
                            MaterialCommunityIcons.sword_cross,
                            color: Colors.white,
                            size: 15,
                          ),
                          Icon(
                            FontAwesome5.user,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                    FlatButton(
                      color: Colors.black87,
                      splashColor: Colors.lime,
                      height: 150,
                      minWidth: 150,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LobbyPage(numbOfPlayers: 3),
                          ),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            FontAwesome5.user,
                            color: Colors.white,
                          ),
                          Icon(
                            MaterialCommunityIcons.sword_cross,
                            color: Colors.white,
                            size: 15,
                          ),
                          Icon(
                            FontAwesome5.user,
                            color: Colors.white,
                          ),
                          Icon(
                            MaterialCommunityIcons.sword_cross,
                            color: Colors.white,
                            size: 15,
                          ),
                          Icon(
                            FontAwesome5.user,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                    FlatButton(
                      color: Colors.black87,
                      splashColor: Colors.lime,
                      height: 150,
                      minWidth: 150,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LobbyPage(numbOfPlayers: 4),
                          ),
                        );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                FontAwesome5.user,
                                color: Colors.white,
                              ),
                              Icon(
                                FontAwesome5.user,
                                color: Colors.white,
                              ),
                            ],
                          ),
                          Icon(
                            MaterialCommunityIcons.sword_cross,
                            color: Colors.white,
                            size: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                FontAwesome5.user,
                                color: Colors.white,
                              ),
                              Icon(
                                FontAwesome5.user,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ],
                      ),
                      // child: Text(
                      //   'Quart',
                      //   style: TextStyle(color: Colors.white),
                      // ),
                    ),
                    FlatButton(
                      color: Colors.black87,
                      splashColor: Colors.lime,
                      height: 150,
                      minWidth: 150,
                      onPressed: () => print("object"),
                      child: Text(
                        'Sandbox',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
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
                  "Game_title",
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
                    enableInfiniteScroll: false,
                    // enlargeCenterPage: true,
                    // disableCenter: true,
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
                      child: Text(
                        '1v1',
                        style: TextStyle(color: Colors.white),
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
                      child: Text(
                        '1v1v1',
                        style: TextStyle(color: Colors.white),
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
                      child: Text(
                        '1v1v1v1',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    // FlatButton(
                    //   color: Colors.black87,
                    //   splashColor: Colors.lime,
                    //   height: 150,
                    //   minWidth: 150,
                    //   onPressed: () => print("object"),
                    //   child: Text(
                    //     'Sandbox',
                    //     style: TextStyle(color: Colors.white),
                    //   ),
                    // ),
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

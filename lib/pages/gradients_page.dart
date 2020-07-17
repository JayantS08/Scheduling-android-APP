import 'package:task/screens/first.dart';
import 'package:task/utils/colors.dart';
import 'package:task/utils/page_transformer.dart';
import 'package:task/utils/text_styles.dart';
import 'package:task/utils/ui_helpers.dart';
import 'package:task/widgets/parallax_cards.dart';
import 'package:task/widgets/swiping_cards.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';

List<String> swipingCardImages = [
  'assets/music/album6.jpg',
  'assets/music/album5.jpg',
  'assets/music/album4.jpg',
  'assets/music/album3.jpg',
  'assets/music/album2.jpg',
  'assets/music/album1.jpg',
];

List<String> swipingCardTitles = [
  'Random Access Memories',
  'Voicenotes',
  'Stargazing',
  'Night Visions',
  'In A Perfect World',
  'Native',
];

class ParallaxCardItem {
  ParallaxCardItem({
    this.title,
    this.body,
    this.imagePath,
  });

  final String title;
  final String body;
  final String imagePath;
}

final parallaxCardItemsList = <ParallaxCardItem>[
  ParallaxCardItem(
    title: '@prime\n\nStudent',
    body: 'Jayant Singh',
    imagePath: 'assets/music/album8.jpg',
  ),
  ParallaxCardItem(
    title: '@warrior\n\nStudent',
    body: 'Yash Bharadwaj',
    imagePath: 'assets/music/album7.jpg',
  ),
  ParallaxCardItem(
    title: '@Optimus\n\nTeacher',
    body: 'Vishal Kushwaha',
    imagePath: 'assets/music/album9.jpg',
  ),
];

var cardAspectRatio = 13.0 / 16.0;
var widgetAspectRatio = cardAspectRatio * 1.2;
var gradientStartColor;
var gradientEndColor;
PageController controller =
    PageController(initialPage: swipingCardImages.length - 1);
var i = swipingCardImages.length - 1;

class MyGradientsPage extends StatefulWidget {
  @override
  _MyGradientsPageState createState() => _MyGradientsPageState();
}

class _MyGradientsPageState extends State<MyGradientsPage> {
  var currentPage = swipingCardImages.length - 1.0;

  @override
  Widget build(BuildContext context) {
    PageController controller =
        PageController(initialPage: swipingCardImages.length - 1);
    controller.addListener(
      () {
        setState(
          () {
            currentPage = controller.page;
          },
        );
      },
    );

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text("User Listing"),
        actions: <Widget>[
          FlatButton(
            child: Row(
              children: <Widget>[
                Icon(Icons.person,color: Color(0xFFF1F3F6),),
                SizedBox(width: 2,),
                Text("LogOut",style: TextStyle(color: Color(0xFFF1F3F6))),
              ],
            ),
            onPressed: ()
            {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FirstPage()),
              );
            },
          )
        ],
        backgroundColor: Color(0xFF4D70A6),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.8), BlendMode.dstATop),
              image: AssetImage("images/back2.jpg"),
              fit: BoxFit.cover,
            )
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                  left: 10.0,
                  top: 50.0,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 30.0),
                child: SizedBox.fromSize(
                  size: Size.fromHeight(500.0),
                  child: PageTransformer(
                    pageViewBuilder: (context, visibilityResolver) {
                      return PageView.builder(
                        controller: PageController(viewportFraction: 0.85),
                        itemCount: parallaxCardItemsList.length,
                        itemBuilder: (context, index) {
                          final item = parallaxCardItemsList[index];
                          final pageVisibility =
                              visibilityResolver.resolvePageVisibility(index);

                          return ParallaxCards(
                            item: item,
                            pageVisibility: pageVisibility,
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

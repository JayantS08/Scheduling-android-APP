import 'package:flutter/material.dart';
import 'package:task/screens/login/login_screen.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                  colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.8), BlendMode.dstATop),
                  image: AssetImage("images/back.jpg"),
                  fit: BoxFit.cover,
                )
            ),
          ),


          Positioned(
            height: 180,
            bottom: 380,
            right: 60,
            child: Container(
              width: 245,
              height: 150,
              child: Padding(
                padding: const EdgeInsets.all(13.0),
                child: InkWell(
                  child:Expanded(
                    child: Column(
                      children: <Widget>[
                        CircleAvatar(
                          radius:65,
                          backgroundImage: AssetImage("images/student.ico"),
                        ),
                        SizedBox(height: 7,),
                        Text(
                          "Student".toUpperCase(),
                          style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: ()
                  {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen("Students")),
                    );
                  },
                ),
              ),
            ),
          ),

          Positioned(
            height: 180,
            bottom: 140,
            right: 60,
            child: Container(
              width: 245,
              height: 150,
              child: Padding(
                padding: const EdgeInsets.all(13.0),
                child: InkWell(
                  child: Column(
                    children: <Widget>[
                      CircleAvatar(
                        radius:65,
                        backgroundImage: AssetImage("images/teacher.png"),
                      ),
                      SizedBox(height: 7,),
                      Text(
                        "Teacher".toUpperCase(),
                        style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.white,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                  onTap: ()
                  {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen("Teachers")),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}



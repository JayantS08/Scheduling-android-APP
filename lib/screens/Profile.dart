import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin{
  TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = new TabController(length: 5, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Profile', style: TextStyle(color: Colors.white),),
        elevation: 0,
        backgroundColor: Color(0xFF4D70A6),

        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios,color: Colors.white,),
            onPressed:(){}

        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.white,),
            onPressed: (){},
          )
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 10),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/2-40,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.7),
                      blurRadius: 20,
                      spreadRadius: 10,

                    )
                  ],
                  color: Color(0xFF4D70A6),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),

                  )

              ),
              child: Column(

                children: <Widget>[
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[

                      Padding(
                        padding: const EdgeInsets.only(left: 130),
                        child: Container(

                          height: 105,
                          width: 105,
                          decoration: BoxDecoration(
                              color: Color(0xFF4D70A6),
                              borderRadius: BorderRadius.circular(52.5),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black,
                                  spreadRadius:2,
                                )
                              ]

                          ),

                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage('assets/selena.jpg'),
                          ),
                        ),
                      ),


                    ],
                  ),
                  SizedBox(height: 10,),
                  Text('@selenagomez', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),),
                  Padding(
                    padding: const EdgeInsets.only( bottom: 35),
                    child: Text('Selena Gomez', style: TextStyle(color: Colors.white,fontSize: 23, fontWeight: FontWeight.bold  ),),
                  ),
                  SizedBox(height: 15,),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              color: Color(0xFF4D70A6),
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xFF4D70A6),
                                  spreadRadius:1,
                                )
                              ]

                          ),

                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Column(
                              children: <Widget>[
                                Icon(Icons.photo_camera, color: Colors.white,),
                                SizedBox(height: 3,),
                                Text('Camera', style: TextStyle(color: Colors.white),)
                              ],
                            ),
                          ),
                        ),

                        Container(

                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              color: Color(0xFF4D70A6),
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xFF4D70A6),
                                  spreadRadius:1,
                                )
                              ]

                          ),

                          child: Padding(
                            padding: const EdgeInsets.all(4.5),
                            child: Column(
                              children: <Widget>[
                                Icon(Icons.fingerprint, color: Colors.white,),
                                SizedBox(height: 3,),
                                Text('Security', style: TextStyle(color: Colors.white),)
                              ],
                            ),
                          ),
                        ),

                        Container(

                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              color: Color(0xFF4D70A6),
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xFF4D70A6),
                                  spreadRadius:1,
                                )
                              ]

                          ),

                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Column(
                              children: <Widget>[
                                Icon(Icons.phone, color: Colors.white,),
                                SizedBox(height: 3,),
                                Text('Phone', style: TextStyle(color: Colors.white),)
                              ],
                            ),
                          ),
                        ),
                        Container(

                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              color: Color(0xFF4D70A6),
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xFF4D70A6),
                                  spreadRadius:1,
                                )
                              ]

                          ),

                          child: Padding(
                            padding: const EdgeInsets.all(4),
                            child: Column(
                              children: <Widget>[
                                Icon(Icons.settings, color: Colors.white,),
                                SizedBox(height: 3,),
                                Text('Settings', style: TextStyle(color: Colors.white),)
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 25,),
            Align(
              child: Text(
                "  Message by me:",
                style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
              alignment: Alignment.centerLeft,
            ),
            SizedBox(height: 5,),
            Align(
              child: Container(
                width: 120,
                height: 2,
                color: Colors.grey[600],
              ),
              alignment: Alignment.centerLeft,
            ),
            SizedBox(height: 40,),
            Container(
              width: 300,
              height: 160,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.8), BlendMode.dstATop),
                    image: AssetImage("images/tht.jpg"),
                    fit: BoxFit.cover,
                  )
              ),
            ),
          ],
        ),
      ),

    );
  }
}

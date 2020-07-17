import 'package:custom_switch/custom_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:task/screens/home.dart';
import 'package:task/services/auth.dart';
import 'package:toast/toast.dart';


class LoginScreen extends StatefulWidget {
  String formk;
  LoginScreen(this.formk);
  @override
  _LoginScreenState createState() => _LoginScreenState(formk);
}

final AuthService _auth = AuthService();


class _LoginScreenState extends State<LoginScreen> {
  void showToast(String msg, {int duration, int gravity}) {
    Toast.show(msg, context, duration: duration, gravity: gravity);
  }
  final _formKey = GlobalKey<FormState>();
  String error = '';

  // text field state
  String email = '';
  String password = '';
  String formk;
  _LoginScreenState(this.formk);
  bool status = true;
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        width: 1080, height: 2160, allowFontScaling: false);
    return Scaffold(
        backgroundColor: Color(0xFFF1F3F6),
        body:
        SafeArea(
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setWidth(120)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: ScreenUtil().setHeight(100),
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            "Login for ",
                            style: TextStyle(
                                color: Color(0xFF4D70A6),
                                fontSize: 26,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            formk,
                            style: TextStyle(
                                color: Color(0xFF4D70A6),
                                fontSize: 26,
                                fontWeight: FontWeight.bold),
                          ),
                        ],

                      ),
                      SizedBox(
                        height: ScreenUtil().setHeight(170),
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: socialButton(FontAwesomeIcons.facebookF),
                          ),
                          SizedBox(
                            width: ScreenUtil().setWidth(60),
                          ),
                          Expanded(
                            child: socialButton(FontAwesomeIcons.google),
                          )
                        ],
                      ),
                      SizedBox(
                        height: ScreenUtil().setHeight(20),
                      ),
                      Stack(
                        children: <Widget>[
                          TextFormField(
                            validator: (val) => val.isEmpty ? 'Enter an email' : null,
                            style: TextStyle(color: Color(0xFF4D70A6)),
                            decoration: InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xFF4D70A6), width: 2),
                                ),
                                labelText: "Username",
                                labelStyle: TextStyle(
                                    color: Color(0xFF4D70A6), fontSize: 14)),
                            onChanged: (val) {
                              setState(() => email = val);
                            },
                          ),
                          Positioned(
                            right: 1,
                            bottom: 8,
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  color: Color(0xFFF1F3F6),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(5, 5),
                                        color: Color(0xFF4D70A6).withOpacity(0.2),
                                        blurRadius: 16),
                                    BoxShadow(
                                        offset: Offset(-10, -10),
                                        color: Color.fromARGB(170, 255, 255, 255),
                                        blurRadius: 10),
                                  ]),
                              child: Icon(
                                Icons.check,
                                color: Color(0xFF4D70A6),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: ScreenUtil().setHeight(100),
                      ),
                      TextFormField(
                        obscureText: true,
                        style: TextStyle(color: Color(0xFF4D70A6)),
                        decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                              borderSide:
                              BorderSide(color: Color(0xFF4D70A6), width: 2),
                            ),
                            labelText: "Password",
                            labelStyle: TextStyle(
                                color: Color(0xFF4D70A6), fontSize: 14)),
                        validator: (val) =>
                        val.length < 6
                            ? 'Enter a password 6+ chars long'
                            : null,
                        onChanged: (val) {
                          setState(() => password = val);
                        },
                      ),
                      SizedBox(height: 15,),
                      SizedBox(
                        height: ScreenUtil().setHeight(70),
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              /*boxShadow: [
                            BoxShadow(
                                offset: Offset(5, 5),
                                color: Color(0xFF4D70A6).withOpacity(0.2),
                                blurRadius: 16),
                            BoxShadow(
                                offset: Offset(-10, -10),
                                color: Color.fromARGB(170, 255, 255, 255),
                                blurRadius: 10),
                          ]*/
                            ),
                            child: CustomSwitch(
                              activeColor: Color(0xFFF1F3F6),
                              value: status,
                              onChanged: (value) {
                                setState(() {
                                  status = value;
                                });
                              },
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Remember me",
                            style: TextStyle(color: Colors.grey, fontSize: 14),
                          ),
                          Spacer(),
                          Text(
                            "Forgot Password?",
                            style: TextStyle(
                              color: Color(0xFF4D70A6),
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: ScreenUtil().setHeight(130),
                      ),
                      GestureDetector(
                        onTap: () async{
                          if (_formKey.currentState.validate()) {
                            dynamic result = await _auth
                                .signInWithEmailAndPassword(email.trim(), password);
                            if (result == null) {
                              setState(() {
                                error =
                                'Could not sign in with those credentials';
                                showToast(
                                    "Wrong Credentials!",
                                    gravity: Toast.BOTTOM);
                              });



                            }
                            else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => HomeScreen()),
                              );
                            }
                          }
                        },
                        child: Container(
                          width: double.infinity,
                          alignment: Alignment.center,
                          height: ScreenUtil().setHeight(120),
                          margin: EdgeInsets.symmetric(vertical: 15),
                          decoration: BoxDecoration(
                              color: Color(0xFFF1F3F6),
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(10, 10),
                                    color: Color(0xFF4D70A6).withOpacity(0.2),
                                    blurRadius: 16),
                                BoxShadow(
                                    offset: Offset(-10, -10),
                                    color: Color.fromARGB(170, 255, 255, 255),
                                    blurRadius: 10),
                              ]),
                          child: Text(
                            "Login",
                            style:
                            TextStyle(color: Color(0xFF4D70A6), fontSize: 16),
                          ),
                        ),
                      ),
                      Center(
                        child: RichText(
                          text: TextSpan(children: <TextSpan>[
                            TextSpan(
                                text: "Don't have an account?",
                                style: TextStyle(color: Colors.grey)),
                            TextSpan(
                                text: " Sign Up",
                                style: TextStyle(color: Color(0xFF4D70A6))),
                          ]),
                        ),
                      )
                    ],
                  )),
            ),
          ),
        ));
  }

  Widget socialButton(IconData icon) {
    return GestureDetector(
      onTap: () async{
            await _auth.signInWithGoogle(context).whenComplete(() {});
      },
      child: Container(
        height: ScreenUtil().setHeight(120),
        margin: EdgeInsets.symmetric(vertical: 30),
        decoration: BoxDecoration(
            color: Color(0xFFF1F3F6),
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                  offset: Offset(10, 10),
                  color: Color(0xFF4D70A6).withOpacity(0.2),
                  blurRadius: 16),
              BoxShadow(
                  offset: Offset(-10, -10),
                  color: Color.fromARGB(170, 255, 255, 255),
                  blurRadius: 10),
            ]),
        child: Icon(
          icon,
          color: Color(0xFF4D70A6),
        ),
      ),
    );
  }
}

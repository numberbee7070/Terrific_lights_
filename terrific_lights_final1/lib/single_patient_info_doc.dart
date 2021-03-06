// Single patient report shown to the doctor.

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:terrific_lights_final1/patient_list.dart';

class single_patient_info_doc extends StatefulWidget {
  static const String id = 'single_patient_info_doc_screen' ;
  @override
  _single_patient_info_docState createState() => _single_patient_info_docState();
}

class _single_patient_info_docState extends State<single_patient_info_doc> {
  final _auth = FirebaseAuth.instance;
  final _firestore = Firestore.instance;
  String name, emt_no, age, gender, gc, bp, pulse, temp, oxy, rbs, lft, rft, cbp, ho;
  User loggedInUser;
  void initState(){
    super.initState();
    getCurrentUser();
    get_info1();
    get_info2();
  }
  void getCurrentUser() async{
    try{
      final user = await _auth.currentUser;
      if(user != null){
        loggedInUser = user;
        print("loggedInUser.email = ${loggedInUser.email}");
      }
    } catch (e){
      print(e);
      print(";_;");
    }
  }
  void get_info1() async{
    await for( var snapshot in _firestore.collection("Temporary_info").snapshots()) {
      for (var message in snapshot.documents) {
        if(message.data()["email"] == loggedInUser.email ) {
          name = message.data()["name"];
          age = message.data()["age"];
          break;
        }
      }
    }
  }
  void get_info2() async{
    await for( var snapshot in _firestore.collection("Patient_info").snapshots()) {
      for (var message in snapshot.documents) {
        if(message.data()["information"][0] == name &&  message.data()["information"][4] == age) {
          emt_no = message.data()["information"][1];
          gender = message.data()["information"][3];
          gc = message.data()["information"][5];
          bp = message.data()["information"][6];
          pulse = message.data()["information"][7];
          temp = message.data()["information"][8];
          oxy = message.data()["information"][9];
          rbs = message.data()["information"][10];
          lft = message.data()["information"][11];
          rft = message.data()["information"][12];
          cbp = message.data()["information"][13];
          ho = message.data()["information"][14];
          break;
        }
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return (MaterialApp(
      title: "Terrific Light's app page",
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Row(
              children: <Widget>[
                IconButton(
                  color: Colors.white,
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () {},
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  "Patient's details",
                ),
              ],
            ),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                color: Colors.white24,
                width: 350.0,
                margin: EdgeInsets.fromLTRB(0, 10.0, 0, 5.0),
                child: Text(
                  " Name : ${name}",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                      letterSpacing: 1,
                      wordSpacing: 3,
                      //backgroundColor: Colors.,
                      shadows: [
                        Shadow(
                            color: Colors.black12,
                            offset: Offset(2, 1),
                            blurRadius: 1)
                      ]),
                ),
              ),

              // SizedBox(
              //   height: 20.0,
              // ),
              Container(
                //padding: EdgeInsets.fromLTRB(0.0, 0.5, 0.0, 0.5),
                color: Colors.white24,
                width: 350.0,
                margin: EdgeInsets.fromLTRB(0, 5.0, 0, 5.0),
                child: Text(
                  " Patient ID : ",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                      letterSpacing: 1,
                      wordSpacing: 3,
                      //backgroundColor: Colors.,
                      shadows: [
                        Shadow(
                            color: Colors.black12,
                            offset: Offset(2, 1),
                            blurRadius: 1)
                      ]),
                ),
              ),
              Container(
                //padding: EdgeInsets.fromLTRB(0.0, 0.5, 0.0, 0.5),
                color: Colors.white24,
                width: 350.0,
                margin: EdgeInsets.fromLTRB(0, 5.0, 0, 5.0),
                child: Text(
                  " EMT Contact No. : ${emt_no}",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                      letterSpacing: 1,
                      wordSpacing: 3,
                      //backgroundColor: Colors.,
                      shadows: [
                        Shadow(
                            color: Colors.black12,
                            offset: Offset(2, 1),
                            blurRadius: 1)
                      ]),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                child: Divider(
                  height: 7.0,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),

              Container(
                //padding: EdgeInsets.fromLTRB(0.0, 0.5, 0.0, 0.5),
                color: Colors.white24,
                width: 350.0,
                // child: Padding(
                //   padding : EdgeInsets.fromLTRB(0.0, 23.0, 0.0, 15.0),
                child: Text(
                  " 1. Gender / Age - ${gender} / ${age} ",
                  style: TextStyle(
                      fontSize: 17.0,
                      color: Colors.black,
                      //fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                      letterSpacing: 1,
                      wordSpacing: 3,
                      //backgroundColor: Colors.,
                      shadows: [
                        Shadow(
                            color: Colors.black12,
                            offset: Offset(2, 1),
                            blurRadius: 1)
                      ]),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),

              Container(
                //padding: EdgeInsets.fromLTRB(0.0, 0.5, 0.0, 0.5),
                color: Colors.white24,
                width: 350.0,
                // child: Padding(
                //   padding : EdgeInsets.fromLTRB(0.0, 23.0, 0.0, 15.0),
                child: Text(
                  " 2. G.C - ${gc}",
                  style: TextStyle(
                      fontSize: 17.0,
                      color: Colors.black,
                      //fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                      letterSpacing: 1,
                      wordSpacing: 3,
                      //backgroundColor: Colors.,
                      shadows: [
                        Shadow(
                            color: Colors.black12,
                            offset: Offset(2, 1),
                            blurRadius: 1)
                      ]),
                ),
              ),
              //),
              SizedBox(
                height: 15.0,
              ),
              Container(
                //padding: EdgeInsets.fromLTRB(0.0, 0.5, 0.0, 0.5),
                color: Colors.white24,
                width: 350.0,
                // child: Padding(
                //   padding : EdgeInsets.fromLTRB(0.0, 23.0, 0.0, 15.0),
                child: Text(
                  " 3. Blood Pressure - ${bp}",
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                      //fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                      letterSpacing: 1,
                      wordSpacing: 3,
                      //backgroundColor: Colors.,
                      shadows: [
                        Shadow(
                            color: Colors.black12,
                            offset: Offset(2, 1),
                            blurRadius: 1)
                      ]),
                ),
              ),
              //),
              SizedBox(
                height: 15.0,
              ),

              Container(
                //padding: EdgeInsets.fromLTRB(0.0, 0.5, 0.0, 0.5),
                color: Colors.white24,
                width: 350.0,
                // child: Padding(
                //   padding : EdgeInsets.fromLTRB(0.0, 23.0, 0.0, 15.0),
                child: Text(
                  " 4. Pulse Rate - ${pulse}",
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                      //fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                      letterSpacing: 1,
                      wordSpacing: 3,
                      //backgroundColor: Colors.,
                      shadows: [
                        Shadow(
                            color: Colors.black12,
                            offset: Offset(2, 1),
                            blurRadius: 1)
                      ]),
                ),
              ),
              //),
              SizedBox(
                height: 15.0,
              ),
              Container(
                //padding: EdgeInsets.fromLTRB(0.0, 0.5, 0.0, 0.5),
                color: Colors.white24,
                width: 350.0,
                // child: Padding(
                //   padding : EdgeInsets.fromLTRB(0.0, 23.0, 0.0, 15.0),
                child: Text(
                  " 5. Temperature - ${temp}",
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                      //fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                      letterSpacing: 1,
                      wordSpacing: 3,
                      //backgroundColor: Colors.,
                      shadows: [
                        Shadow(
                            color: Colors.black12,
                            offset: Offset(2, 1),
                            blurRadius: 1)
                      ]),
                ),
              ),
              //),
              SizedBox(
                height: 15.0,
              ),
              Container(
                //padding: EdgeInsets.fromLTRB(0.0, 0.5, 0.0, 0.5),
                color: Colors.white24,
                width: 350.0,
                // child: Padding(
                //   padding : EdgeInsets.fromLTRB(0.0, 23.0, 0.0, 15.0),
                child: Text(
                  " 6. Oxygen Saturation - ${oxy}",
                  style: TextStyle(
                      fontSize: 17.0,
                      color: Colors.black,
                      //fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                      letterSpacing: 1,
                      wordSpacing: 3,
                      //backgroundColor: Colors.,
                      shadows: [
                        Shadow(
                            color: Colors.black12,
                            offset: Offset(2, 1),
                            blurRadius: 1)
                      ]),
                ),
              ),
              //),
              SizedBox(
                height: 15.0,
              ),
              Container(
                width: 350.0,
                color: Colors.white38,
                child: Text(
                  " 7. Investigation - ",
                  style: TextStyle(
                    fontSize: 17.0,
                    color: Colors.black,
                    //fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    //letterSpacing: 1,
                    wordSpacing: 3,
                    //backgroundColor: Colors.,
                    shadows: [
                      Shadow(
                          color: Colors.black12,
                          offset: Offset(2, 1),
                          blurRadius: 1)
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                width: 250.0,
                color: Colors.white38,
                child: Text(
                  " a. RBS : ${rbs}",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                    //fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    //letterSpacing: 1,
                    wordSpacing: 3,
                    //backgroundColor: Colors.,
                    shadows: [
                      Shadow(
                          color: Colors.black12,
                          offset: Offset(2, 1),
                          blurRadius: 1)
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                width: 250.0,
                color: Colors.white38,
                child: Text(
                  " b. LFT : ${lft}",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                    //fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    //letterSpacing: 1,
                    wordSpacing: 3,
                    //backgroundColor: Colors.,
                    shadows: [
                      Shadow(
                          color: Colors.black12,
                          offset: Offset(2, 1),
                          blurRadius: 1)
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                width: 250.0,
                color: Colors.white38,
                child: Text(
                  " c. RFT : ${rft}",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                    //fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    //letterSpacing: 1,
                    wordSpacing: 3,
                    //backgroundColor: Colors.,
                    shadows: [
                      Shadow(
                          color: Colors.black12,
                          offset: Offset(2, 1),
                          blurRadius: 1)
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                width: 250.0,
                color: Colors.white38,
                child: Text(
                  " d. CBP : ${cbp}",
                  style: TextStyle(
                    fontSize: 17.0,
                    color: Colors.black,
                    //fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    //letterSpacing: 1,
                    wordSpacing: 3,
                    //backgroundColor: Colors.,
                    shadows: [
                      Shadow(
                          color: Colors.black12,
                          offset: Offset(2, 1),
                          blurRadius: 1)
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Container(
                width: 340.0,
                color: Colors.white38,
                child: Text(
                  " 8. Any H/O - ${ho}",
                  style: TextStyle(
                    fontSize: 17.0,
                    color: Colors.black,
                    //fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    //letterSpacing: 1,
                    wordSpacing: 3,
                    //backgroundColor: Colors.,
                    shadows: [
                      Shadow(
                          color: Colors.black12,
                          offset: Offset(2, 1),
                          blurRadius: 1)
                    ],
                  ),
                ),
              ),

              SizedBox(
                height: 25.0,
              ),
              FlatButton(
                  color: Colors.blueAccent,
                  child: Text(
                    'Mark as Read',
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                  onPressed: () {
                    showAlertDialog(context);
                  }),
            ],
          ),
        ),
      ),
    ));
  }
}

showAlertDialog(BuildContext context) {
  // set up the buttons
  Widget yesButton = FlatButton(
    child: Text("yes"),
    onPressed: () {},
  );
  Widget noButton = FlatButton(
    child: Text("no"),
    onPressed: () {},
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("accept"),
    content: Text("do u accept"),
    actions: [
      yesButton,
      noButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

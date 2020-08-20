import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_route/data/user_detail.dart';
import 'package:go_route/utilites/MyNavigator.dart';

class Register_screen extends StatefulWidget {
  @override
  _Register_screenState createState() => _Register_screenState();
}

class _Register_screenState extends State<Register_screen> {
  user_detail user;
  Widget inputFields(String inputText){
    return new TextField(
      autofocus: true,
      cursorColor: Colors.black,
      style: TextStyle(color: Colors.black),
      cursorWidth:2.0 ,
      keyboardType:TextInputType.text ,
      keyboardAppearance: Brightness.dark,
      decoration: InputDecoration(
          focusColor: Colors.redAccent,
          border:OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular( 20.0)),
          ),
          prefixIcon: Icon(Icons.account_circle),
          labelText: inputText,
      ),
    );

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("GoRoute"),backgroundColor: Colors.redAccent,),
      backgroundColor: Colors.white,
      body: new Column(
        children:<Widget>[

      ClipRect(child: inputFields("fullname")),
          new SizedBox(
            height: 20.0,
          ),
          ClipRect(child: inputFields("Password")),
          ClipRect(child: inputFields("plateno")),
    ClipRect(child: inputFields("date")),
          Padding(
            padding: const EdgeInsets.only(top:20.0),
            child: new FlatButton(
              color: Colors.red,
              shape:  RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.red)
              ),
              splashColor: Colors.greenAccent,
              child:new Container(

                height: 50.0,
                width: 300.0,
                  child:Center(
                    child: Text("Submit",style: TextStyle(color: Colors.black,fontSize: 20.0
                      ,fontStyle:FontStyle.normal ),),
                  )
              ),

              onPressed: (){
                MyNavigator.goToHome(context);
              },
            ),
          )


        ]
      ),
    );
  }
}

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
  final _myname = new TextEditingController();

  final _password = new TextEditingController();
  final _carno = new TextEditingController();

  user_detail user;
  Widget inputFields(String inputText){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: new  TextField(
        keyboardType: TextInputType.datetime,
        decoration: InputDecoration(
            focusColor: Colors.redAccent,
            border:OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular( 20.0)),
            ),
            prefixIcon: Icon(Icons.calendar_today,color: Colors.redAccent,),
            labelText: inputText
        ),
      ),
    );

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("GoRoute"),backgroundColor: Colors.redAccent,),
      backgroundColor: Colors.white,
      body: new ListView(
        shrinkWrap: true,
        children:<Widget>[
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: new  TextField(
              controller: _myname,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  focusColor: Colors.redAccent,
                  border:OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular( 20.0)),
                  ),
                  prefixIcon: Icon(Icons.person,color: Colors.redAccent,),
                  labelText: "Fullname"
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: new  TextField(
              controller: _password,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                  focusColor: Colors.redAccent,
                  border:OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular( 20.0)),
                  ),
                  prefixIcon: Icon(Icons.vpn_key,color: Colors.redAccent,),
                  labelText: "password"
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: new  TextField(

              controller: _carno,
              enabled: true,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  focusColor: Colors.redAccent,
                  border:OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular( 20.0)),
                  ),
                  prefixIcon: Icon(Icons.directions_car,color: Colors.redAccent,),
                  labelText: "plateno"
              ),
            ),
          ),
    inputFields("date"),
          Padding(
            padding: const EdgeInsets.only(top:20.0),
            child: Padding(
              padding: const EdgeInsets.all(18.0),
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
                  if(check()){
                 user= new user_detail(_myname.text,_password.text,_carno.text);
                 print(user.password);
                  MyNavigator.goToHome(context);
                  }else{
                    print("incorrect");
                    AlertDialog(
                    title: Text("enter correct detail"),
                    );
                  }
                },
              ),
            ),
          )


        ]
      ),
    );
  }

  bool check(){
    if(_myname.text == ""){
      return false;
    }
    if(_password.text.length < 7){
      return false;
    }
    if(_carno.text.length != 4){
      return false;
    }
    return true;
  }
}

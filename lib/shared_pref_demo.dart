import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Home()
      ),
    );
  }
}


class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            ElevatedButton(onPressed: () async{
              var pref= await SharedPreferences.getInstance();
              var isSaved=await pref.setString("email", "meckawy@gmail.com");

               if(isSaved){
              Alert(context: context,title: "Saving Status",desc: "Email Has been saved"
                  , buttons: [ DialogButton(child: Text("OK"), onPressed: (){
                    Navigator.pop(context);
                  })]
              ).show();

              }

            }, child: Text("Save Data")),
            ElevatedButton(onPressed: ()async{

              var pref=await SharedPreferences.getInstance();
              var email=pref.get("email");
              print("email value is $email");

              Alert(context: context,title: "Data Status",desc: "email value is $email"
                  , buttons: [ DialogButton(child: Text("OK"), onPressed: (){
                    Navigator.pop(context);

                  })]
              ).show();

            }, child: Text("Show Data")),

            ElevatedButton(onPressed: (){

              Alert(context: context,title: "Saving Status",desc: "Email Has been saved"
                  , buttons: [ DialogButton(child: Text("OK"), onPressed: (){})]
              ).show();

            }, child: Text("Show Data")),
          ],
        ),
      ),
    );
  }
}


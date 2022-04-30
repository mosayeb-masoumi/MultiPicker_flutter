
import 'package:flutter/material.dart';
import 'package:multi_file_picker_flutter/muliti_file_picker_page.dart';
import 'package:multi_file_picker_flutter/single_file_picker_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            RaisedButton(
            child:Text("mutli Picker"),
             onPressed: (){
               Navigator.of(context).push(MaterialPageRoute(
                   builder: (context)=> MultiFilePickerPage()));
             }),


            SizedBox(height: 20,),

            RaisedButton(
                child:Text("single Picker"),
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context)=> SingleFilePickerPage()));
                }),

          ],
        ),
      ),
    );
  }
}

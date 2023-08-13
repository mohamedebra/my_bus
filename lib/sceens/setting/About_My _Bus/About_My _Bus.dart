import 'package:flutter/material.dart';

class About_My_Bus extends StatelessWidget {
  const About_My_Bus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.grey
        ),
        backgroundColor: Colors.white,
        title: Text(''
            'About My Bus',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black),),
        elevation: 0,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage("images/1download.jpg"),width: 200,),
            SizedBox(height: 10,),
            Text('My Bus 1.0.0')
          ],
        ),
      ),
    );
  }
}

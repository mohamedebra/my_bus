import 'package:flutter/material.dart';

class Arithmetic extends StatelessWidget {
  const Arithmetic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('المساعدة',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20,color: Colors.black),),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.grey),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 10,
            color: Colors.grey[200],
          ),
          SizedBox(height: 15,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text('تم اختراق حسابي',style: TextStyle(fontWeight: FontWeight.w400),),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 20),
            child: Container(
              width: double.infinity,
              height: 1,
              color: Colors.grey[300],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text('كيف يمكنني إلغاء حسابي',style: TextStyle(fontWeight: FontWeight.w400),),
          ),
        ],
      ),
    );
  }
}

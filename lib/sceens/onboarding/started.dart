import 'package:flutter/material.dart';
import 'package:uber/sceens/login/login.dart';

class Started extends StatelessWidget {
  const Started({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,

      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 100,),
            Center(child: Image(image: AssetImage('images/5903.png'),width: 350,)),
            SizedBox(height: 80,),
            Text('استمتع بالرحلة'       ,style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),),
            SizedBox(
              height: 15,
            ),
            Text(
              'طلب حجز أجرة الحافلة \n     لسلامتك وراحتك ',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,color: Colors.grey),
            ),
            SizedBox(
              height: 15,
            ),
            Container(

                height: 50,
                width: 140,
                child: TextButton(onPressed: (){
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Login()), (route) => false);

                }, child: Text('البدء',style: TextStyle(color: Colors.white,fontSize: 20),)),
              decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(20)
              ),

            ),


          ],
        ),
      ),
    );
  }
}
//Enjoy trip
import 'package:flutter/material.dart';

class Favourite_Places extends StatelessWidget {
  const Favourite_Places({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.grey
        ),
        backgroundColor: Colors.white,
        title: Text(''
            'الأماكن المفضلة',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: Colors.black),),
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 50,),
          Container(
            width: double.infinity,
            height: 10,
            color: Colors.grey[200],
          ),
          SizedBox(height: 15,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              children: [
                // Image(image: AssetImage('images/1.png'),width: 50,),
                Container(

                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(50)

                    ),
                    width: 50,
                    height: 50,
                    child: IconButton(onPressed: (){}, icon: Icon(Icons.home,size: 25,color: Colors.grey,))),
                SizedBox(width: 15,),
                Text('أضف عنوان المنزل',style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 17
                ),),
                Spacer(),
                Icon(Icons.arrow_forward_ios,size: 15,color: Colors.grey,)

              ],
            ),
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
            child: Row(
              children: [
                // Image(image: AssetImage('images/1.png'),width: 50,),
                Container(

                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(50)

                    ),
                    width: 50,
                    height: 50,
                    child: IconButton(onPressed: (){}, icon: Icon(Icons.work,size: 25,color: Colors.grey,))),
                SizedBox(width: 15,),
                Text('أضف عنوان العمل',style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 17
                ),),
                Spacer(),
                Icon(Icons.arrow_forward_ios,size: 15,color: Colors.grey,)

              ],
            ),
          ),
          SizedBox(height: 15,),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 20),
          //   child: Container(
          //     width: double.infinity,
          //     height: 1,
          //     color: Colors.grey[300],
          //   ),
          // ),
          Container(
            width: double.infinity,
            height: 10,
            color: Colors.grey[200],
          ),
          SizedBox(height: 15,),
          Column(
            children: [
              SizedBox(height: 55,),
              Text(''
                  'الأماكن المفضلة',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black),),
              SizedBox(height: 10,),
              Text('وفر الوقت بإضافة الأماكن المفضلة لديك هنا',style: TextStyle(color: Colors.grey),),
              SizedBox(height: 35,),
              Container(
                width: 150,
                height: 40,
                child: Center(
                  child: Text(
                    'أضف إلى المفضلة',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.orange,

                ),
              ),

            ],
          )



        ],
      ),
    );
  }
}

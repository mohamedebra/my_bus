import 'dart:math';

import 'package:flutter/material.dart';
import 'package:uber/sceens/home/home.dart';

class Ride_Summary extends StatefulWidget {
  const Ride_Summary({Key? key}) : super(key: key);

  @override
  State<Ride_Summary> createState() => _Ride_SummaryState();
}

class _Ride_SummaryState extends State<Ride_Summary> {
  Random random = Random();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var num = 0;
    if(Home.titleControllor.text != ''){
      num = random.nextInt(20);
      print(Home.titleControllor);
    }
    else if(Home.titleControllor == '') {
      num = random.nextInt(0) ;
    }


    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Form(
          child: Column(
            children: [
              Stack(

                children: [
                  Image(
                    image: AssetImage('images/1.jpg'),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height *.17,
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.only(
                              topStart: Radius.circular(50),
                              topEnd: Radius.circular(50),
                            ),
                            color: Colors.white),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              'ملخص الركوب',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25),
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                children: [
                                  Column(

                                    children: [
                                      Icon(Icons.location_on,color: Colors.red,),
                                      Text(':\n:\n:\n:',style: TextStyle(
                                        color: Colors.grey
                                      ),),
                                      Icon(Icons.location_on,color: Colors.green,),
                                    ],
                                  ),
                                  SizedBox(width: 15,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(Home.titleControllor.text,style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                        maxLines: 2,
                                        overflow:TextOverflow.ellipsis ,
                                      ),
                                      SizedBox(height: 7,),
                                      Text('Qatar City Main Road 2545/45 MH',style: TextStyle(
                                        color: Colors.grey[400]
                                      ),
                                        maxLines: 2,
                                        overflow:TextOverflow.ellipsis ,
                                      ),
                                      SizedBox(height: 30,),
                                      Text(Home.tolocationControllor.text,style: TextStyle(

                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                      ),
                                        maxLines: 2,
                                        overflow:TextOverflow.ellipsis ,
                                      ),
                                      Text('Qatar City Main Road',style: TextStyle(
                                          color: Colors.grey[400]
                                      ),)
                                    ],
                                  ),

                                ],
                              ),
                            ),
                            SizedBox(
                              height: 35,),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [

                                      Text('مسافة',style: TextStyle(
                                          color: Colors.grey[500],
                                        fontSize: 18
                                      )),
                                      SizedBox(
                                        height: 7,
                                      ),
                                      Text("$num Km" ?? '',style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17
                                      ),)

                                    ],
                                  ),
                                ),
                                // Expanded(
                                //   child: Column(
                                //     crossAxisAlignment: CrossAxisAlignment.center,
                                //     children: [
                                //       Text('وقت الرحلة',style: TextStyle(
                                //           color: Colors.grey[500],
                                //         fontSize: 18
                                //       )),
                                //       SizedBox(
                                //         height: 7,
                                //       ),
                                //       Text(Home.timeController.text,style: TextStyle(
                                //         fontWeight: FontWeight.bold,
                                //         fontSize: 17
                                //       ),)
                                //
                                //     ],
                                //   ),
                                // ),


                              ],
                            ),

                          ],
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  static user(Users model,int index) => Padding(
    padding: const EdgeInsets.all(10.0),
    child:  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: (){
            if(itemsUsers[index].ip  >= index){
              Home.tolocationControllor.text = itemsUsers[index].id;
            }
          },

          child: Row(
            children: [
              Icon(Icons.location_on,color: Colors.red,size: 20,),
              SizedBox(width: 10,),
              Text('${model.id}',style: TextStyle(fontSize: 16),),
            ],
          ),
        ),

      ],
    ),
  );

}
List<Users> itemsUsers =[
  Users(id: "مخيم الوالد عتيق بن خميس العبداالله : ام لخيا", ip: 0, ),
  Users(id: "متحف الشيخ فيصل بن قاسم : حديقه محمد الدوسري", ip: 1, ),
  Users(id: "ام صلال : ام سميرة", ip: 2,  ),
  Users(id: "محطه مشيرب : مجمع خليفة الدولي للتنس والاسكواش", ip: 3,  ),

];

class Users {
  String id;
  var ip;

  Users({
    required this.id,
    required this.ip
  });
}


getdrive(){
  if(Home.tolocationControllor.text == itemsUsers[0].id) {

    Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Container(
        height: 300,
        child: Form(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20),
                child: Row(
                  children: [
                    Image(
                      image: AssetImage(
                          'images/drive12.jpg'),
                      width: 80,
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        Text('Amar',
                            style: TextStyle(
                                fontWeight:
                                FontWeight.bold,
                                fontSize: 17)),
                        SizedBox(
                          height: 7,
                        ),
                        Text(Home.tolocationControllor.text,
                            style: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 12)),
                        Image(
                          image: AssetImage(
                              'images/images.png'),
                          width: 65,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment:
                MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding:
                      const EdgeInsets.symmetric(
                          horizontal: 15),
                      child: Container(
                        width: 130,
                        height: 40,
                        child: Center(
                          child: Text(
                            'Waiting time: 12m',
                            style: TextStyle(
                              color: Colors.orange[400],
                              fontSize: 18,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(30),
                          color: Colors.orange[50],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                      const EdgeInsets.symmetric(
                          horizontal: 15),
                      child: Container(
                        width: 130,
                        height: 40,
                        child: Center(
                          child: Text(
                            'Seat Number: 17',
                            style: TextStyle(
                              color: Colors.orange[400],
                              fontSize: 18,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(30),
                          color: Colors.orange[50],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment:
                MainAxisAlignment.center,
                children: [
                  Text('تم قبول الطلب ',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600,color: Colors.orange),)
                ],
              ),
            ],
          ),
        ),
      ),
    );


  }
  else if(Home.tolocationControllor.text == itemsUsers[1].id) {
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Container(
        height: 300,
        child: Form(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20),
                child: Row(
                  children: [
                    Image(
                      image: AssetImage(
                          'images/drive12.jpg'),
                      width: 80,
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        Text('Mohamed',
                            style: TextStyle(
                                fontWeight:
                                FontWeight.bold,
                                fontSize: 17)),
                        SizedBox(
                          height: 7,
                        ),
                        Text(Home.tolocationControllor.text,
                            style: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 12)),
                        Image(
                          image: AssetImage(
                              'images/images.png'),
                          width: 65,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment:
                MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding:
                      const EdgeInsets.symmetric(
                          horizontal: 15),
                      child: Container(
                        width: 130,
                        height: 40,
                        child: Center(
                          child: Text(
                            'Waiting time: 8m',
                            style: TextStyle(
                              color: Colors.orange[400],
                              fontSize: 18,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(30),
                          color: Colors.orange[50],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                      const EdgeInsets.symmetric(
                          horizontal: 15),
                      child: Container(
                        width: 130,
                        height: 40,
                        child: Center(
                          child: Text(
                            'Seat Number: 17',
                            style: TextStyle(
                              color: Colors.orange[400],
                              fontSize: 18,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(30),
                          color: Colors.orange[50],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment:
                MainAxisAlignment.center,
                children: [
                  Text('تم قبول الطلب ',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600,color: Colors.orange),)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  else if(Home.tolocationControllor.text == itemsUsers[2].id) {
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Container(
        height: 300,
        child: Form(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20),
                child: Row(
                  children: [
                    Image(
                      image: AssetImage(
                          'images/drive12.jpg'),
                      width: 80,
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        Text('Mahmoud',
                            style: TextStyle(
                                fontWeight:
                                FontWeight.bold,
                                fontSize: 17)),
                        SizedBox(
                          height: 7,
                        ),
                        Text(Home.tolocationControllor.text,
                            style: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 12)),
                        Image(
                          image: AssetImage(
                              'images/images.png'),
                          width: 65,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment:
                MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding:
                      const EdgeInsets.symmetric(
                          horizontal: 15),
                      child: Container(
                        width: 130,
                        height: 40,
                        child: Center(
                          child: Text(
                            'Waiting time: 3m',
                            style: TextStyle(
                              color: Colors.orange[400],
                              fontSize: 18,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(30),
                          color: Colors.orange[50],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                      const EdgeInsets.symmetric(
                          horizontal: 15),
                      child: Container(
                        width: 130,
                        height: 40,
                        child: Center(
                          child: Text(
                            'Seat Number: 2',
                            style: TextStyle(
                              color: Colors.orange[400],
                              fontSize: 18,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(30),
                          color: Colors.orange[50],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment:
                MainAxisAlignment.center,
                children: [
                  Text('تم قبول الطلب ',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600,color: Colors.orange),)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  else {
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Container(
        height: 300,
        child: Form(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20),
                child: Row(
                  children: [
                    Image(
                      image: AssetImage(
                          'images/drive12.jpg'),
                      width: 80,
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        Text('Ahmed',
                            style: TextStyle(
                                fontWeight:
                                FontWeight.bold,
                                fontSize: 17)),
                        SizedBox(
                          height: 7,
                        ),
                        Text(Home.tolocationControllor.text,
                            style: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 12)),
                        Image(
                          image: AssetImage(
                              'images/images.png'),
                          width: 65,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment:
                MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding:
                      const EdgeInsets.symmetric(
                          horizontal: 15),
                      child: Container(
                        width: 130,
                        height: 40,
                        child: Center(
                          child: Text(
                            'Waiting ....',
                            style: TextStyle(
                              color: Colors.orange[400],
                              fontSize: 18,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(30),
                          color: Colors.orange[50],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                      const EdgeInsets.symmetric(
                          horizontal: 15),
                      child: Container(
                        width: 130,
                        height: 40,
                        child: Center(
                          child: Text(
                            'Seat Number: 0',
                            style: TextStyle(
                              color: Colors.orange[400],
                              fontSize: 18,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(30),
                          color: Colors.orange[50],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment:
                MainAxisAlignment.center,
                children: [
                  Text('تم فرض الطلب \n  لا يوجد مكان ',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600,color: Colors.orange),)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
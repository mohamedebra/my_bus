import 'package:flutter/material.dart';

class Notifications extends StatelessWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Form(
          child: Column(
            children: [
              Stack(
                // alignment: AlignmentDirectional.bottomEnd,
                children: [
                  Image(
                    image: AssetImage('images/1.jpg'),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 150,
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
                              'Notifications',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25),
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 25),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text('50% off all ride',style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500
                                      ),),
                                      SizedBox(width: 12,),
                                      Text('(23 min ago)',style: TextStyle(color: Colors.grey),)
                                    ],
                                  ),
                                  SizedBox(height: 7,),
                                  Text('Lorem ipsumhas been the industry standard available,\nbut the majority have suffered',
                                    style: TextStyle(
                                        color: Colors.grey
                                    ),),
                                  SizedBox(height: 25,),
                                  Row(
                                    children: [
                                      Text('Change privacy',style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500
                                      ),),
                                      SizedBox(width: 12,),
                                      Text('(01 day ago)',style: TextStyle(color: Colors.grey),)
                                    ],
                                  ),
                                  SizedBox(height: 7,),
                                  Text('Lorem ipsumhas been the industry standard available,\nbut the majority have suffered',
                                    style: TextStyle(
                                        color: Colors.grey
                                    ),),
                                  SizedBox(height: 25,),
                                  Row(
                                    children: [
                                      Text('50% off all ride',style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500
                                      ),),
                                      SizedBox(width: 12,),
                                      Text('(23 min ago)',style: TextStyle(color: Colors.grey),)
                                    ],
                                  ),
                                  SizedBox(height: 7,),
                                  Text('Lorem ipsumhas been the industry standard available,\nbut the majority have suffered',
                                    style: TextStyle(
                                        color: Colors.grey
                                    ),),
                                  SizedBox(height: 25,),
                                  Row(
                                    children: [
                                      Text('You can earn',style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500
                                      ),),
                                      SizedBox(width: 12,),
                                      Text('(23 min ago))',style: TextStyle(color: Colors.grey),)
                                    ],
                                  ),
                                  SizedBox(height: 7,),
                                  Text('Lorem ipsumhas been the industry standard available,\nbut the majority have suffered',
                                    style: TextStyle(
                                        color: Colors.grey
                                    ),),
                                  SizedBox(height: 25,),
                                ],
                              ),
                            )

                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

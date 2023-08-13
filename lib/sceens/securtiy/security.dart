import 'package:flutter/material.dart';
import 'package:uber/sceens/securtiy/Arithmetic/Arithmetic.dart';
import 'package:uber/sceens/securtiy/Problem/Problem.dart';
import 'package:uber/sceens/securtiy/Safety/Safety.dart';

class Security extends StatelessWidget {
  const Security({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:  SingleChildScrollView(
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
                              'المساعدة',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25),
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                              child: Container(
                                width: double.infinity,
                                height: 1,
                                color: Colors.grey,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => Problem()));
                                },
                                child: Row(
                                  children: [
                                    Icon(Icons.security,size: 25,color: Colors.grey,),
                                    SizedBox(width: 15,),
                                    Text('مشكله في السلامه',style: TextStyle(
                                      fontSize: 14
                                    ),)
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                              child: Container(
                                width: double.infinity,
                                height: 1,
                                color: Colors.grey,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Arithmetic()));
                                },
                                child: Row(
                                  children: [
                                    Icon(Icons.account_balance_wallet,size: 25,color: Colors.grey,),
                                    SizedBox(width: 15,),
                                    Text('حسابي',style: TextStyle(
                                        fontSize: 14
                                    ),)
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                              child: Container(
                                width: double.infinity,
                                height: 1,
                                color: Colors.grey,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => Safety()));
                                },
                                child: Row(
                                  children: [
                                    Icon(Icons.security,size: 25,color: Colors.grey,),
                                    SizedBox(width: 15,),
                                    Text('Safety Centre',style: TextStyle(
                                        fontSize: 14
                                    ),)
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                              child: Container(
                                width: double.infinity,
                                height: 1,
                                color: Colors.grey,
                              ),
                            ),


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

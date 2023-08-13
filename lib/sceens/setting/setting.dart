import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uber/cubit/cubit.dart';
import 'package:uber/cubit/states.dart';
import 'package:uber/sceens/setting/About_My%20_Bus/About_My%20_Bus.dart';
import 'package:uber/sceens/setting/Favourite%20Places/Favourite%20Places.dart';
import 'package:uber/sceens/setting/My%20Account/My%20Account.dart';
import 'package:uber/sceens/setting/Privacy/Privacy.dart';

class Setting extends StatelessWidget {

  var scffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppCubit>(
      create: (context)=> AppCubit(),
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context,state) {},
        builder: (context,state){
          return Scaffold(

            key: scffoldKey,
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
                                    'الإعدادات',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold, fontSize: 25),
                                  ),
                                  SizedBox(
                                    height: 50,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 20),
                                    child: Column(
                                      children: [
                                        InkWell(
                                          onTap: (){
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=> My_Account()));

                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 10),
                                            child: Row(
                                              children: [
                                                Text('حسابي',style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 16
                                                ),),
                                                Spacer(),
                                                Icon(Icons.arrow_forward_ios,size: 20,)
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 35,),
                                        InkWell(
                                          onTap: (){
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=> Favourite_Places()));
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 10),
                                            child: Row(
                                              children: [
                                                Text('الأماكن المفضلة',style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 16
                                                ),),
                                                Spacer(),
                                                Icon(Icons.arrow_forward_ios,size: 20,)
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 35,),
                                        // InkWell(
                                        //   onTap: (){
                                        //     Navigator.push(context, MaterialPageRoute(builder: (context)=> Privacy()));
                                        //   },
                                        //   child: Padding(
                                        //     padding: const EdgeInsets.symmetric(horizontal: 10),
                                        //     child: Row(
                                        //       children: [
                                        //         Text('Privacy',style: TextStyle(
                                        //             fontWeight: FontWeight.w500,
                                        //             fontSize: 16
                                        //         ),),
                                        //         Spacer(),
                                        //         Icon(Icons.arrow_forward_ios,size: 20,)
                                        //       ],
                                        //     ),
                                        //   ),
                                        // ),
                                        // SizedBox(height: 35,),
                                        InkWell(
                                          onTap: (){
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=> About_My_Bus()));
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 10),
                                            child: Row(
                                              children: [
                                                Text('حول التطبيق',style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 15
                                                ),),
                                                Spacer(),
                                                Icon(Icons.arrow_forward_ios,size: 20,)
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 25,),

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
        },
      ),
    );
  }
}

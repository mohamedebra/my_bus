
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uber/cubit/cubit.dart';
import 'package:uber/cubit/states.dart';

class My_Account extends StatelessWidget {

  var fristcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppCubit>(
      create: (context)=> AppCubit(),

      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context,state){},
        builder: (context,state){
          var cubit = AppCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              iconTheme: IconThemeData(
                  color: Colors.grey
              ),


            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Text('حسابي',style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),),
                  ),
                  Container(
                    width: double.infinity,
                    height: 10,
                    color: Colors.grey[200],
                  ),
                  SizedBox(height: 15,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: InkWell(
                      onTap: (){
                        cubit.getImage();
                      },
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
                              child: IconButton(onPressed: (){}, icon: Icon(Icons.person,size: 25,color: Colors.grey,))),
                          Spacer(),
                          Text('تعديل الصورة الشخصية',style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 17
                          ),),
                          SizedBox(width: 5,),
                          Icon(Icons.arrow_forward_ios,size: 15,color: Colors.grey,)

                        ],
                      ),
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('الاسم الأول',style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey
                        ),),
                        SizedBox(height: 7,),

                        TextFormField(
                          onTap: (){},
                          controller: fristcontroller,
                          decoration: InputDecoration(
                            hintText: 'الاسم الأول',
                          ),
                        ),

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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('اسم العائلة',style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey
                        ),),
                        SizedBox(height: 7,),

                        TextFormField(
                          onTap: (){},
                          controller: fristcontroller,
                          decoration: InputDecoration(
                            hintText: 'اسم العائلة',
                          ),
                        ),

                      ],
                    ),
                  ),
                  SizedBox(height: 15,),
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
                        Text('رقم الهاتف',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16),),
                        Spacer(),
                        Text('+96*********',style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 17,
                            color: Colors.grey
                        ),),
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
                        Text('كلمة المرور',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16),),
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
                        Text('حذف الحساب',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16),),
                        Spacer(),
                        Icon(Icons.arrow_forward_ios,size: 15,color: Colors.grey,)

                      ],
                    ),
                  ),



                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

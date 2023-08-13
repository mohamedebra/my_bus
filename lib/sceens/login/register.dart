import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uber/cubit/cubit.dart';
import 'package:uber/cubit/model.dart';
import 'package:uber/cubit/states.dart';
import 'package:uber/sceens/home/home.dart';

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var phonecontrollr = TextEditingController();

  var passwordcontrollr = TextEditingController();

  var passwordcontrollrr = TextEditingController();
  String? phoneNumber;
  late String otp, authStatus = "";
  String verificationId = '';

  AppModel? model;



  Future<void> verifyPhoneNumber(BuildContext context) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      timeout: const Duration(seconds: 15),
      verificationCompleted: (AuthCredential authCredential) {
        setState(() {
          authStatus = "Your account is successfully verified";
        });
      },
      verificationFailed: (authException) {
        setState(() {
          authStatus = "Authentication failed";
        });
      },
      codeSent: (String verId, [int? forceCodeResent]) {
        verificationId = verId;
        setState(() {
          authStatus = "OTP has been successfully send";
        });
      },
      codeAutoRetrievalTimeout: (String verId) {
        verificationId = verId;
        setState(() {
          authStatus = "TIMEOUT";
        });
      },
    );
  }

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppCubit>(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: SingleChildScrollView(
              child: Form(
                key: formKey,
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
                                    'سجل عبر الهاتف',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25),
                                  ),
                                  SizedBox(
                                    height: 100,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: TextFormField(
                                        controller: phonecontrollr,
                                        keyboardType: TextInputType.phone,
                                        validator: (val)   {
                                          if (val!.isEmpty) {
                                            return 'Please enter your email address';
                                          }
                                        },
                                        decoration: InputDecoration(
                                          label: Text('رقم الهاتف '),
                                          prefix: Icon(Icons.phone),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                              BorderRadius.circular(20)),
                                        )),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: TextFormField(
                                        controller: passwordcontrollr,
                                        keyboardType:
                                        TextInputType.visiblePassword,
                                        validator: (val) {
                                          if (val!.isEmpty) {
                                            return 'Please enter your password';
                                          }
                                        },
                                        obscureText:
                                        AppCubit.get(context).isPassword,
                                        decoration: InputDecoration(
                                          label: Text('كلمة المرور'),
                                          prefix: Icon(Icons.lock),
                                          // suffix: Icon(Icons.remove_red_eye_rounded),
                                          suffixIcon: IconButton(
                                            onPressed: () {
                                              AppCubit.get(context)
                                                  .changeIcon();
                                            },
                                            icon: Icon(
                                                AppCubit.get(context).icon),
                                          ),

                                          border: OutlineInputBorder(
                                              borderRadius:
                                              BorderRadius.circular(20)),
                                        )),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: TextFormField(
                                        controller: passwordcontrollrr,
                                        keyboardType:
                                        TextInputType.visiblePassword,
                                        validator: (val) {
                                          if (val!.isEmpty) {
                                            return 'Please enter your password';
                                          }
                                        },
                                        obscureText:
                                        AppCubit.get(context).isPassword1,
                                        decoration: InputDecoration(
                                          label: Text('قم بتأكيد كلمة المرور'),
                                          prefix: Icon(Icons.lock),
                                          // suffix: Icon(Icons.remove_red_eye_rounded),
                                          suffixIcon: IconButton(
                                            onPressed: () {
                                              AppCubit.get(context)
                                                  .changeIcon1();
                                            },
                                            icon: Icon(
                                                AppCubit.get(context).icon1),
                                          ),

                                          border: OutlineInputBorder(
                                              borderRadius:
                                              BorderRadius.circular(20)),
                                        )),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Container(
                                    width: 170,
                                    height: 60,
                                    child: TextButton(
                                        onPressed: () {

                                          Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));

                                        },
                                        child: Text(
                                          'تسجيل',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 24,
                                          ),
                                        )),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Colors.orange,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
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
        },
      ),
    );
  }
}

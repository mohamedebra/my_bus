import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:uber/cubit/cubit.dart';
import 'package:uber/cubit/states.dart';
import 'package:uber/sceens/home/home.dart';
import 'package:uber/sceens/login/register.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var emailcontrollr = TextEditingController();

  var passwordcontrollr = TextEditingController();

  var formKey = GlobalKey<FormState>();

  String? phoneNumber;

  String verificationId = '';

  Future<void> signIn(String otp) async {
    await FirebaseAuth.instance
        .signInWithCredential(PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: otp,
    ));
  }

  late String otp, authStatus = "";

  Future<void> verifyPhoneNumberr(BuildContext context) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      timeout: const Duration(seconds: 15),
      verificationCompleted: (AuthCredential authCredential) {
        setState(() {
          authStatus = "Your account is successfully verified";
        });
      },
      verificationFailed: (P) {
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
                                    'قم بالتسجيل عبر الهاتف',
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
                                        controller: emailcontrollr,
                                        keyboardType: TextInputType.phone,
                                        validator: (val)   {
                                          if (val!.isEmpty) {
                                            return 'Please enter your email address';
                                          }
                                        },
                                        decoration: InputDecoration(
                                          label: Text('رقم الهاتف'),
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
                                    height: 30,
                                  ),
                                  Container(
                                    width: 170,
                                    height: 60,
                                    child: TextButton(
                                        onPressed: ()
                                        {
                                              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Home()), (route) => false);
                                        },
                                        child: Text(
                                          'تسجيل الدخول',
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
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('ليس لديك حساب؟'),
                                      TextButton(
                                          onPressed: () {
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => Register()));
                                          },
                                          child: Text(
                                            'تسجيل',
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.orange),
                                          )),
                                    ],
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

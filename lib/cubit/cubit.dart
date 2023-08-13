import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';
import 'package:uber/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

import 'model.dart';


class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(Appintionlstates());

  static AppCubit get(context) => BlocProvider.of(context);


  bool? isBottomSheet ;
  IconData falData = Icons.edit;
  List<Map> newtasks = [];
  List<Map> donetasks = [];
  List<Map> archivedtasks = [];
  late Database database;



  File? proFileimage;
  var picker = ImagePicker();


  Future getImage() async{
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if(pickedFile != null)
    {

      proFileimage = File(pickedFile.path);
      print(pickedFile.path);
      emit(AppImageSucsessState());
    }else
    {
      print('No image selected');
      emit(AppImageErorrState());

    }
  }


  void changeBottonSheet({required bool isShow,}) {
    isBottomSheet = isShow;
    emit(AppChangeBottonSheet());
  }

  IconData icon = Icons.visibility_outlined;
  bool isPassword = true;


  void changeIcon() {
    isPassword = !isPassword;
    icon =
    isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(ChangeIcon());
  }
  IconData icon1 = Icons.visibility_outlined;
  bool isPassword1 = true;


  void changeIcon1() {
    isPassword1 = !isPassword1;
    icon1 =
    isPassword1 ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(ChangeIcon());
  }
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(25.31398200795899, 51.20857532244242),

    zoom: 12.4746,
  );

  LatLng currentLoction = _kGooglePlex.target;

void getloction()
{
  currentLoction = _kGooglePlex.target;
  emit(AppLoction());
}


  // Future<LocationData> getmyloction ()async
  // {
  //   Location location = Location();
  //   bool _serviceEnabled;
  //   PermissionStatus _permissionGranted;
  //   LocationData _locationData;
  //
  //
  //   _serviceEnabled = await location.serviceEnabled();
  //   if (!_serviceEnabled) {
  //     _serviceEnabled = await location.requestService();
  //     if (!_serviceEnabled) {
  //       throw Exception();
  //     }
  //   }
  //
  //   _permissionGranted = await location.hasPermission();
  //   if (_permissionGranted == PermissionStatus.denied) {
  //     _permissionGranted = await location.requestPermission();
  //     if (_permissionGranted != PermissionStatus.granted) {
  //       throw Exception();
  //     }
  //   }
  //
  //   _locationData = await location.getLocation();
  //   return _locationData;
  //
  // }

  Future<dynamic> getttext()async{
    await Future.delayed(Duration(seconds: 2),(){
      return 'هناك حادث مرور في الطريق سوف\n     يتأخر الحافله 3 دقائق اخري';

    }).then((value){
      emit(gettext());
      return 'هناك حادث مرور في الطريق سوف\n     يتأخر الحافله 3 دقائق اخري';

    }).catchError((error){
      emit(gettexterror());
      return '';
    });
  }



  AppModel?  model;
var gmile = Text('@gmail.com',style: TextStyle(color: Colors.white),);
  void user({
    required String password,
    required String phone,
    required String uId,


  })
  {
    AppModel(
        phone: phone,
        password: password,

    );
    print('hello');
    emit(AppRegister());

    FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: "$phone @gmail.com",
        password: password
    ).then((value)
    {
      print('object');
      print(value);

      userCreate(
          phone: phone,
          password: password,
      );


      print(value.toString());

      emit(AppRegesterScussesState());
    }).catchError((error)
    {
      print('error');
      emit(AppRegesterErrorState(error.toString()));
    });
  }
  userCreate({
    required String phone,
    required String password,
  })
  {
    AppModel model = AppModel(
        phone: phone,
        uId: FirebaseAuth.instance.currentUser!.uid,
        password: password


    );
    FirebaseFirestore.instance.
    collection('users')
        .doc()
        .set(model.toMap()).then((value)
    {
      print(FirebaseAuth.instance.currentUser!.uid);
      emit(AppCreateRegisterSuccessstate());
    })
        .catchError((error)
    {
      print('error');
      emit(AppCreateRegisterError(error.toString()));
    });
  }



  userLogin({
    required String phone,
    required String password
  })
  {
    emit(AppLoginLodingState());
    FirebaseAuth.instance.signInWithEmailAndPassword(
        email: "$phone @gmail.com",
        password: password).
    then((value) {
      emit(AppLoginScussesState());
      print(value.user!.uid);

      model!.uId = value.user!.uid;
    })
        .catchError((error){
      emit(AppLoginErrorState(error.toString()));
    });
  }

}
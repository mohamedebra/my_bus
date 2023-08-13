import 'dart:math';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';
import 'package:uber/cubit/cubit.dart';
import 'package:uber/cubit/states.dart';
import 'package:intl/intl.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uber/sceens/login/login.dart';
import 'package:uber/sceens/notifications/notifications.dart';
import 'package:uber/sceens/ride_summary/ride_summary1.dart';
import 'package:uber/sceens/securtiy/security.dart';
import 'package:uber/sceens/setting/setting.dart';
import 'dart:async';
import 'package:uber/services/Component.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:uber/services/loction.dart';

class Home extends StatefulWidget {

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(25.31398200795899, 51.20857532244242),
    zoom: 12.4746,
  );
  static var tolocationControllor = TextEditingController();
  static var timeController = TextEditingController();
  static var titleControllor = TextEditingController();
  static var controller = ScrollController();
  static var num1 = random.nextInt(20);

  static void sendnum(){
    var num7 = '';
    if(tolocationControllor.text != null){
      num7= random.nextInt(20);
    }
    else {
      num7 ;
    }
  }

  static get random => Random();

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
              Expanded(
                child : Text('${model.id}',style: TextStyle(fontSize: 16),
                  maxLines: 1,
                  overflow:TextOverflow.clip ,),
              ),
            ],
          ),
        ),

      ],
    ),
  );




  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late GoogleMapController googleMapController;

  var messageContror = TextEditingController();

  List<Component> _predictionList = [];

  var scffoldKey = GlobalKey<ScaffoldState>();

  var formKey = GlobalKey<FormState>();

  var dataController = TextEditingController();


  LatLng currentLoction = Home._kGooglePlex.target;



  tolocatio() async{
    Text(
        'lat: ${currentLoction.latitude} , long: ${currentLoction.longitude}');
  }


  Set<Marker> _markers = Set();

  Set<Polyline> _polylines = {};
  BitmapDescriptor? _locationIcon;

  Placemark _placemark = Placemark();

  Placemark get pickPlac => _placemark;

  List<Polyline> polyline = [];

  List<Prediction> _predloction = [];

  late BitmapDescriptor bitmapDescriptor;





  getbitmap() async {
    bitmapDescriptor = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(size: Size(5, 5)), 'images/bus14.png');
  }

  Set<Circle> circles = Set.from([
    Circle(
      circleId: CircleId('1'),
      center: LatLng(25.31398200795899, 51.20857532244242),
      radius: 4000,
    )
  ]);

  creatpolyline() {
    polyline.add(Polyline(
        polylineId: PolylineId('1'),
        color: Colors.cyan,
        width: 3,
        points: [
          LatLng(25.35782176194455, 51.24498590826988),
          LatLng(25.47115267585766, 51.4063627535105),
        ]));
  }

  String text4 = 'تم قبول الطلب ';
  String text3 = '';
  String text2 = '';
   String text = 'هناك حادث مرور في الطريق سوف\n     يتأخر الحافله 3 دقائق اخري ';
   gettext()async{
    await  Future.delayed(Duration(seconds: 2),(){
      setState(() {
        // text2 = text;
      });
    });
  }





  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  late FirebaseMessaging note ;




  @override
  void initState() {
    getbitmap();
    _buildMarkerFromAssets();
    creatpolyline();
    tolocatio();
    gettext(
    ){
      setState(() {
        // text2 = text;
      });
    };

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppCubit>(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          var num2 = 5;
          var num7 = 3;
          var num8 = 8;
          var num9 = 8;
          var num1 = Home.random.nextInt(10);
          var num3 = Home.random.nextInt(10);
          var num4 = Home.random.nextInt(10);
          var num5 = Home.random.nextInt(10);
          var num6 = Home.random.nextInt(10);


          return Scaffold(
            key: scffoldKey,
            appBar: AppBar(
              elevation: 0,
              title: Center(
                child: Container(
                  height: 47,
                  color: Colors.white,
                  child: TextFormField(
                    onTap: _showSearchDialog,
                    controller: messageContror,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(1),
                      ),
                      prefixIcon: Icon(Icons.search),
                      suffixIcon: Icon(Icons.location_searching),
                      hintText: 'ابحث في موقع رحلتك ... ',
                    ),
                  ),
                ),
              ),
              actions: [
                IconButton(
                    onPressed: () => _setMarker(currentLoction),
                    icon: Icon(Icons.location_on))
              ],
//
            ),
            body: Column(
              children: [
                Expanded(

                  child: GoogleMap(
                    // polylines: polyline.toSet(),
                    mapType: MapType.normal,
                    initialCameraPosition: Home._kGooglePlex,
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                      setState(() {
                        _markers.add(Marker(
                          markerId: MarkerId('1'),
                          position: Home._kGooglePlex.target,
                          infoWindow: InfoWindow(
                            title: " اسم السائق : Amar",
                              snippet: "الي ام لخيا"
                          ),
                        ));
                        _markers.add(Marker(
                          markerId: MarkerId('2'),
                          position:
                              LatLng(25.35782176194455, 51.24498590826988),
                          infoWindow: InfoWindow(
                              title: " اسم السائق : Ahmed",
                              snippet: "الي حديقه محمد الدوسري"
                          ),
                        ));
                        _markers.add(Marker(
                          markerId: MarkerId('3'),
                          position: LatLng(25.47115267585766, 51.4063627535105),
                          onTap: () {},
                          infoWindow: InfoWindow(
                              title: " اسم السائق : Mohamed",
                              snippet: "الي ام سميرة"
                          ),
                        ));
                        _markers.add(Marker(
                          markerId: MarkerId('4'),
                          position:
                              LatLng(25.281953053304665, 51.52461055666208),
                          infoWindow: InfoWindow(
                              title: " اسم السائق : Mohamed",
                              snippet: "الي ام سميرة"                           ),
                        ));
                      });
                    },
                    onCameraMove: (CameraPosition _kGooglePlex) {
                      setState(() {
                        currentLoction = _kGooglePlex.target;
                      });
                    },
                    markers: _markers,
                  ),
                ),
              ],
            ),
            drawer: Drawer(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 200,
                    color: Colors.orange,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(50)),
                              width: 60,
                              height: 60,
                              child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.person,
                                    size: 45,
                                    color: Colors.grey,
                                  ))),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Mohame Ebrahim',
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '+96******',
                              style: TextStyle(
                                  fontSize: 17, color: Colors.grey[300]),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> Ride_Summary()));
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.location_history_rounded,
                            size: 30,
                            color: Colors.grey[600],
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'رحلاتي',
                            style: TextStyle(
                                fontSize: 17, color: Colors.grey[600]),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Security()));
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.help,
                            size: 30,
                            color: Colors.grey[600],
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'المساعدة',
                            style: TextStyle(
                                fontSize: 17, color: Colors.grey[600]),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Setting()));
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.settings,
                            size: 30,
                            color: Colors.grey[600],
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'الإعدادات',
                            style: TextStyle(
                                fontSize: 17, color: Colors.grey[600]),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => Login()),
                            (route) => false);
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.exit_to_app,
                            size: 30,
                            color: Colors.grey[600],
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'تسجيل الخروج',
                            style: TextStyle(
                                fontSize: 17, color: Colors.grey[600]),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                ],
              ),
            ),
            floatingActionButton: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    if (cubit.isBottomSheet = true) {
                      scffoldKey.currentState!.showBottomSheet((context) => SingleChildScrollView(
                        controller: Home.controller,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                color: Colors.white,
                                padding: EdgeInsetsDirectional.all(10),
                                child: Form(
                                  key: formKey,
                                  child: Column(
                                    children: [
                                      Text(
                                        'الى اين تذهب؟',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 20),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      TextFormField(
                                        controller: Home.titleControllor,
                                        keyboardType: TextInputType.text,
                                        validator: (val) {
                                          if (val!.isEmpty) {
                                            return "My Location must in Empty";
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                            labelText: "موقعي",
                                            prefix: Icon(Icons.edit),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            )),
                                        onTap: () {

                                          getUserCurrentLocation().then((value) async
                                          {

                                            print(
                                             Home.titleControllor.text = 'My Location'
                                            );
                                            }
                                          );
                                          },
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      TextFormField(
                                        controller: Home.tolocationControllor,
                                        keyboardType: TextInputType.text,
                                        validator: (val) {
                                          if (val!.isEmpty) {
                                            return "To Location must in Empty";
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                            labelText: "إلى الموقع",
                                            prefix: Icon(Icons.edit),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            )),
                                          onTap: (){
                                            showBottomSheet(context: context, builder: (BuildContext context) {
                                              return  Container(
                                                height: 300,
                                                child: ListView.separated(
                                                  controller: Home.controller,
                                                  itemBuilder:  (context,index) {
                                                    return Home.user(itemsUsers[index],index);
                                                  },
                                                  itemCount: itemsUsers.length,
                                                  separatorBuilder: (BuildContext context, int index)=> Padding(
                                                    padding: const EdgeInsets.symmetric(horizontal: 20),
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 1,
                                                      color: Colors.grey,

                                                    ),
                                                  ),
                                                ),
                                              );
                                            });
                                          },
                                        onChanged: (val){
                                          showBottomSheet(context: context, builder: (BuildContext context) {
                                            return  Container(
                                              height: 300,
                                              child: ListView.separated(
                                                itemBuilder:  (context,index) {
                                                  return Home.user(itemsUsers[index],index);
                                                },
                                                itemCount: itemsUsers.length,
                                                separatorBuilder: (BuildContext context, int index)=> Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 20),
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: 1,
                                                    color: Colors.grey,

                                                  ),
                                                ),
                                              ),
                                            );
                                          });

                                          setState(() {
                                            val = Home.tolocationControllor.text;
                                          });
                                        },


                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      // Text(
                                      //   'تار الرحلة',
                                      //   style: TextStyle(
                                      //       fontWeight: FontWeight.w600,
                                      //       fontSize: 20),
                                      // ),
                                      // SizedBox(
                                      //   height: 15,
                                      // ),
                                      // TextFormField(
                                      //   controller: Home.timeController,
                                      //   keyboardType: TextInputType.datetime,
                                      //   onTap: () {
                                      //     showTimePicker(
                                      //             context: context,
                                      //             initialTime: TimeOfDay.now())
                                      //         .then((value) {
                                      //       Home.timeController.text = value!
                                      //           .format(context)
                                      //           .toString();
                                      //       print(value
                                      //           .format(context)
                                      //           .toString());
                                      //     });
                                      //   },
                                      //   onChanged: (value){
                                      //   },
                                      //   validator: (val) {
                                      //     if (val!.isEmpty) {
                                      //       return "Time must in Empty";
                                      //     }
                                      //   },
                                      //   decoration: InputDecoration(
                                      //       labelText: "Trip Time",
                                      //       prefix: Icon(Icons.access_time),
                                      //       border: OutlineInputBorder(
                                      //           borderRadius:
                                      //               BorderRadius.circular(10))),
                                      // ),
                                      // SizedBox(
                                      //   height: 15,
                                      // ),
                                      // TextFormField(
                                      //   controller: dataController,
                                      //   keyboardType: TextInputType.datetime,
                                      //   onTap: () {
                                      //     showDatePicker(
                                      //             context: context,
                                      //             initialDate: DateTime.now(),
                                      //             firstDate: DateTime.parse("2009-12-31"),
                                      //             lastDate: DateTime.parse(
                                      //                 "2070-12-31"))
                                      //         .then((value) {
                                      //       dataController.text =
                                      //           DateFormat.yMMMd()
                                      //               .format(value!);
                                      //       print(DateFormat.yMMMd()
                                      //           .format(value));
                                      //     }
                                      //             //                   {
                                      //             //                    dataController.text = value!.format(context).toString();
                                      //             //                       print(DateFormat.yMMMd();
                                      //             //                 }
                                      //             );
                                      //   },
                                      //   validator: (val) {
                                      //     if (val!.isEmpty) {
                                      //       return "Data must in Empty";
                                      //     }
                                      //   },
                                      //   decoration: InputDecoration(
                                      //       labelText: "Trip Date",
                                      //       prefix: Icon(Icons.calendar_today),
                                      //       border: OutlineInputBorder(
                                      //           borderRadius:
                                      //               BorderRadius.circular(10))),
                                      // ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                      if (formKey.currentState!.validate()) {

                             if(Home.tolocationControllor.text == itemsUsers[0].id) {

                            scffoldKey.currentState!.showBottomSheet((context) =>
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 20),
                                  child: Container(
                                    height: 300,
                                    child: Form(
                                      key: formKey,
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
                                                Expanded(
                                                  child: Column(
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
                                                  ),
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
                                                        'mوقت الانتظار:  $num6 ',
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
                                                        'رقم المقعد: ${Home.num1}',
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
                                ));

                          }
                        else if(Home.tolocationControllor.text == itemsUsers[1].id) {
                          scffoldKey.currentState!.showBottomSheet((context) {
                            Future.delayed(Duration(seconds: 3), () {
                              Fluttertoast.showToast(
                                  msg: " هناك حادث مرور في الطريق سوف\n     يتأخر الحافله 3 دقائق اخري\n\nوقت الانتظار $num9 m",
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 2,
                                  backgroundColor: Colors.blueGrey,
                                  textColor: Colors.white,
                                  fontSize: 16.0
                              );
                              num9 = num8 + num7;
                              // num8 = num2 + num7;
                              num2 = num8;

                            });

                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: Container(
                                height: 300,
                                child: Form(
                                  key: formKey,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 20),
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
                                            Expanded(
                                              child: Column(
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
                                                  SingleChildScrollView(
                                                    child: Text(Home.tolocationControllor.text,
                                                        overflow: TextOverflow.ellipsis,
                                                        maxLines: 2,
                                                        style: TextStyle(
                                                            color: Colors.grey[400],
                                                            fontSize: 12)),
                                                  ),
                                                  Image(
                                                    image: AssetImage(
                                                        'images/images.png'),
                                                    width: 65,
                                                  ),
                                                ],
                                              ),
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
                                                    'mوقت الانتظار:  $num2 ',
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
                                                    'رقم المقعد: $num3',
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
                                      Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          Text(text4,style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600,color: Colors.orange),),
                                           Text(text2.toString(),style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600,color: Colors.orange),),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );


                          }
                          );
                        }
                        else if(Home.tolocationControllor.text == itemsUsers[2].id) {
                          scffoldKey.currentState!.showBottomSheet((context) =>
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 20),
                                child: Container(
                                  height: 300,
                                  child: Form(
                                    key: formKey,
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
                                              Expanded(
                                                child: Column(
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
                                                ),
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
                                                      'mوقت الانتظار:  $num4 ',
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
                                                      'رقم المقعد: $num5',
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
                              ));
                        }
                        else {
                          scffoldKey.currentState!.showBottomSheet((context) =>
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 20),
                                child: Container(
                                  height: 300,
                                  child: Form(
                                    key: formKey,
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
                                              Expanded(
                                                child: Column(
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
                                                ),
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
                                                      'mوقت الانتظار:  $num1 ',
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
                                                      ' ... :رقم المقعد',
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
                                            Text('عدد المقاعد مكتمله في هذه الحافله\n     سوف يتم تحويلك الي اقرب\n          حافله في هذا المسار',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600,color: Colors.orange),)
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ));
                        }

                      }
                    }


                  },
                  child: Icon(Icons.location_history),
                  elevation: 50.0,
                ),
                SizedBox(
                  height: 10,
                ),
                FloatingActionButton(onPressed: (){
                  _determinePosition().then((value) async {
                    print(value.latitude.toString() +
                        " " +
                        value.longitude.toString());

                    // marker added for current users location
                    _markers.add(Marker(
                      markerId: MarkerId("7"),
                      position: LatLng(value.latitude, value.longitude),
                      infoWindow: InfoWindow(
                        title: 'موقعي الحالي',
                      ),
                    ));

                    // specified current users location
                    CameraPosition cameraPosition = new CameraPosition(
                      target: LatLng(value.latitude, value.longitude),
                      zoom: 14,
                    );

                    final GoogleMapController controller =
                    await _controller.future;
                    controller.animateCamera(
                        CameraUpdate.newCameraPosition(cameraPosition));
                    setState(() {});
                  });
                },
                  child: Icon(
                      Icons.location_searching
                  ),
                ),
              ],
            ),
            bottomNavigationBar: SingleChildScrollView(
              child: Container(

                alignment: Alignment.center,
                child:
                Text(
                    'lat: ${currentLoction.latitude} , long: ${currentLoction.longitude}'),
              ),
            ),
          );
        },
      ),
    );
  }


  Future<Position> getUserCurrentLocation() async{

    await Geolocator.requestPermission().then((value) {
    }).onError((error, stackTrace) async{
      await Geolocator.requestPermission();
      print(error);
    });
    return await Geolocator.getCurrentPosition();
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  void _setMarker(LatLng _location) {
    Marker newMarker = Marker(
      markerId: MarkerId(_location.toString()),
      icon: BitmapDescriptor.defaultMarker,
      // icon: _locationIcon,
      position: _location,
      infoWindow: InfoWindow(
          title: "Title",
          snippet: "${currentLoction.latitude}, ${currentLoction.longitude}"),
    );
    _markers.add(newMarker);
    setState(() {});
  }

  Future<void> _showSearchDialog() async {
    Prediction? p = await PlacesAutocomplete.show(
      context: context,
      apiKey: 'AIzaSyCfiyN1pG7lK2lC_iKk5942eeDHuNBOWgI',
      mode: Mode.overlay,
      language: "ar",
      region: "ar",
      offset: 0,
      hint: "Type here...",
      radius: 1000,
      types: [
      ],
      strictbounds: true,
      components: [Component(Component.country, "en")],
    );

    _getLocationFromPlaceId(p!.placeId!);
    setState(() {});
  }

  Future<void> _getLocationFromPlaceId(String placeId) async {
    GoogleMapsPlaces _places = GoogleMapsPlaces(
      apiKey: 'AIzaSyCfiyN1pG7lK2lC_iKk5942eeDHuNBOWgI',
      apiHeaders: await GoogleApiHeaders().getHeaders(),
    );

    PlacesDetailsResponse detail = await _places.getDetailsByPlaceId(placeId);

    _animateCamera(LatLng(detail.result.geometry!.location.lat,
        detail.result.geometry!.location.lng));
    setState(() {});
  }

  Future<void> _animateCamera(LatLng _location) async {
    final GoogleMapController controller = await _controller.future;
    CameraPosition _cameraPosition = CameraPosition(
      target: _location,
      zoom: 13.00,
    );
    print(
        "animating camera to (lat: ${_location.latitude}, long: ${_location.longitude}");
    controller.animateCamera(CameraUpdate.newCameraPosition(_cameraPosition));
  }

  Future<void> _buildMarkerFromAssets() async {
    if (_locationIcon == null) {
      _locationIcon = await BitmapDescriptor.fromAssetImage(
          ImageConfiguration(size: Size(48, 48)),
          'assets/images/location_icon.png');
      setState(() {});
    }
  }

}




List<Users> itemsUsers =[
  Users(id: "مخيم الوالد عتيق بن خميس العبداالله : ام لخيا", ip: 0, ),
  Users(id: "متحف الشيخ فيصل بن قاسم : حديقه محمد الدوسري", ip: 1, ),
  Users(id: "ام صلال : ام سميرة", ip: 2,  ),
  Users(id: "محطه مشيرب : مجمع خليفة الدولي للتنس", ip: 3,  ),

];

class Users {
  String id;
  var ip;

  Users({
    required this.id,
    required this.ip
  });
}



//{
//                         Marker(markerId: MarkerId('map'),
//                           position: LatLng(0.0, 0.0),
//
//                         )



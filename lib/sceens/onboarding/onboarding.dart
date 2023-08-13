import 'package:flutter/material.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:uber/sceens/onboarding/started.dart';

class BaordindModel {
  final String image;
  final String title;
  final String body;

  BaordindModel({required this.image, required this.title, required this.body});
}

class OnBaording extends StatefulWidget {
  @override
  State<OnBaording> createState() => _OnBaordingState();
}

class _OnBaordingState extends State<OnBaording> {
  List<BaordindModel> boarding = [
    BaordindModel(
      image:
      'images/5903.png',
      title: '  تسجيل',
      body: " طلب حجز أجرة الحافلة \n     لسلامتك وراحتك",
    ),
    BaordindModel(
      image:
      'images/5903.png',
      title:   'ابحث عن الحافلة',
      body: " طلب حجز أجرة الحافلة \n     لسلامتك وراحتك",
    ),

  ];

  var controller = PageController();
  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        actions: [TextButton(onPressed: ()
        {
           Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Started()), (route) => false);
        }, child: Text('تخطي',style: TextStyle(color: Colors.white),))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: BouncingScrollPhysics(),
                onPageChanged: (int index) {
                  if (index == boarding.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    setState(() {
                      isLast = false;
                    });
                  }
                },
                controller: controller,
                itemBuilder: (context, index) =>
                    buildBaordingitime(boarding[index]),
                itemCount: boarding.length,

              ),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                    controller: controller,
                    effect: ExpandingDotsEffect(
                        dotHeight: 10,
                        dotColor: Colors.grey,
                        dotWidth: 10,
                        expansionFactor: 3,
                        activeDotColor: Colors.orange),
                    count: boarding.length),
                Spacer(),
                FloatingActionButton(

                  onPressed: () {
                    if (isLast) {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => Started()),
                              (route) => false);
                    } else {
                      controller.nextPage(
                          duration: Duration(
                            milliseconds: 750,
                          ),
                          curve: Curves.fastOutSlowIn);
                      //fastLinearToSlowEaseIn
                    }
                  },
                  child: Icon(Icons.arrow_forward_ios),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBaordingitime(BaordindModel model) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
          child: Image(
            image: AssetImage(model.image),

          )),
      Text(
        '${model.title}',
        style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
      ),
      SizedBox(
        height: 15,
      ),
      Text(
        '${model.body}',
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,color: Colors.grey),
      ),
    ],
  );
}

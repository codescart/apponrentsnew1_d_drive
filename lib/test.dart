
import 'package:flutter/material.dart';
import 'package:testt/constants.dart';
import 'package:testt/screen/dskcategories.dart';
import 'package:testt/widget/mobstar.dart';

class CustomInfo extends StatefulWidget {
  const CustomInfo({Key? key}) : super(key: key);

  @override
  State<CustomInfo> createState() => _CustomInfoState();
}

class _CustomInfoState extends State<CustomInfo> {
  double? width;
  double? height;
  Color? color;
  bool? animate;
  bool? textAppear;

  @override
  void initState() {
    animate = false;
    textAppear = false;
    showInfoPlayer(animate!);
    super.initState();
  }

  void showInfoPlayer(bool animate) {
    setState(() {
      if (animate) {
        height = 800;
        width = 450;
        color = Colors.grey[500];
        Future.delayed(const Duration(milliseconds: 300), () {
          setState(() {
            textAppear = true;
          });
        });
      } else {
        height = 450;
        width = 500;
        color = Colors.grey[500];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MouseRegion(
          onEnter: (a) {
            setState(() {
              animate = true;
              showInfoPlayer(animate!);
            });
          },
          onExit: (a) {
            animate = false;
            showInfoPlayer(animate!);
            textAppear = false;
          },
          child:  InkWell(
            onTap: (){
              Navigator.push(context,  MaterialPageRoute(builder: (context)=>DskCategories()));
            },
            child: Container(
              width: 650,
              height: 450,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: AnimatedContainer(
                      height: height,
                      width: width,
                      duration: const Duration(milliseconds: 300),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10.0,
                        vertical: 30.0,
                      ),
                      color: color,
                      child: AnimatedOpacity(
                        opacity: textAppear! ? 1 : 0,
                        duration: Duration(milliseconds: textAppear! ? 400 : 100),
                        curve: Curves.easeOut,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              "11",
                              style: TextStyle(
                                fontSize: 40.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const Text(
                              "PHP Scripts",
                              style: TextStyle(
                                fontSize: 35.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                            const Text(
                              "Thousands of PHP Scripts",
                              style: TextStyle(
                                fontSize: 30.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(top: 10.0),
                              width: 270,
                              child: const Text(
                                "Mohamed Salah is one of the most prolific forwards  Liverpool.",
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white70,
                                ),
                              ),
                            ),
                            // Row(
                            //   children: [
                            //     Container(
                            //       padding: EdgeInsets.only(top: 100),
                            //         width: 200,
                            //         child: Column(
                            //           children: [
                            //             Padding(
                            //               padding: const EdgeInsets.only(right: 140.0),
                            //               child: Text("Rs 12",style: TextStyle(fontSize: 15),),
                            //             ),
                            //             Padding(
                            //               padding: const EdgeInsets.only(right: 70.0),
                            //               child: StarDisplay(),
                            //             ),
                            //             Padding(
                            //               padding: const EdgeInsets.only(right: 130.0),
                            //               child: Text('Sales 12',style: TextStyle(fontSize: 15),),
                            //             ),
                            //
                            //           ],
                            //         )
                            //     ),
                            //     Container(
                            //       padding: EdgeInsets.only(top: 100),
                            //       child: Row(
                            //         children: [
                            //           IconButton(
                            //             // hoverColor: Colors.black12.withOpacity(0.1),
                            //             icon: const Icon(Icons.shopping_cart),
                            //             onPressed: () {},
                            //           ),
                            //           ElevatedButton(
                            //             onPressed: () {},
                            //             style: ButtonStyle(
                            //               overlayColor: MaterialStateProperty.resolveWith<Color?>(
                            //                     (Set<MaterialState> states) {
                            //                   if (states.contains(MaterialState.hovered))
                            //                     return nohovertextcolor;
                            //                   else{
                            //                     return null;
                            //                   }//<-- SEE HERE
                            //                   // Defer to the widget's default.
                            //                 },
                            //               ),
                            //             ),
                            //             child: const Text(
                            //               'Live Preview',
                            //               style: TextStyle(fontSize: 12),
                            //             ),
                            //           ),
                            //         ],
                            //       ),
                            //     ),
                            //
                            //   ],
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Align(
                    //alignment: const Alignment(0, 0),
                    alignment: Alignment.bottomCenter,
                    child: AnimatedContainer(
                      padding: EdgeInsets.only(left: animate! ? 370 : 0),
                      duration: const Duration(milliseconds: 5),
                      height: 400,
                      child: const Image(
                        image: AssetImage('images/test.png'),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: AnimatedOpacity(
                      opacity: textAppear! ? 0 : 1,
                      duration: Duration(milliseconds: textAppear! ? 200 : 200),
                      child: Container(
                        width: width,
                        color: const Color(0xFFF5F5F5).withOpacity(0.7),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 20,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "11",
                                style: TextStyle(
                                  fontSize:15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                              Text(
                                "MOHAMED SALAH",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
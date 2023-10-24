import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testt/launch.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:tab_container/tab_container.dart';
import 'package:testt/constants.dart';
import 'package:testt/responsive.dart';
import 'package:flutter/material.dart';
import 'package:testt/HOME_pages/Home.dart';
import 'package:testt/HOME_pages/addtocartall.dart';
import 'package:testt/screen/live.dart';
import 'package:testt/screen/pinchzoom/pinchtozoom.dart';
import 'package:testt/screen/screenshorts.dart';
import 'package:http/http.dart' as http;
import 'package:testt/screen/video/videoplayyer.dart';
import 'package:testt/widget/sizes_helpers.dart';
import 'package:carousel_indicator/carousel_indicator.dart';


class OnTap extends StatefulWidget {
  String id;
  String product_image;
  String other_images;
  String category;
  String product_name;
  String sdescription;
  String full_description;
  String seo;
  String mispell_key;
  String features;
  String rental_price;
  String selling_price;
  String discount;
  String time;
  String product_spiecified;
  String admin_url;
  String web_url;
  String mobile_app;
  String video_url;
  String likes;
  String recentview;
  String wishlists;
  String mywishlist;
  String mylikes;
  String product_category;
  String plan_name;
  String month_3;
  String month_6;
  String month_12;
  String year_2;
  String year_5;
  String year_10;
  String month_3price;
  String month_6price;
  String month_12price;
  String year_2price;
  String year_5price;
  String year_10price;
  OnTap({
    required this.id,
    required this.product_image,
    required this.other_images,
    required this.category,
    required this.product_name,
    required this.sdescription,
    required this.full_description,
    required this.seo,
    required this.mispell_key
    ,required this.features
    ,required this.rental_price
    ,required this.selling_price
    ,required this.discount
    ,required this.time
    ,required this.product_spiecified
    ,required this.admin_url
    ,required this.web_url
    ,required this.mobile_app
    ,required this.video_url
    ,required this.likes
    ,required this.recentview
    ,required this.wishlists
    ,required this.mywishlist
    ,required this.mylikes
    ,required this.product_category
    ,required this.plan_name
    ,required this.month_3
    ,required this.month_6
    ,required this.month_12
    ,required this.year_2
    ,required this.year_5
    ,required this.year_10
    ,required this.month_3price
    ,required this.month_6price
  ,required this.month_12price
  ,required this.year_2price
  ,required this.year_5price
  ,required this.year_10price

  });



  @override
  State<OnTap> createState() => _OnTapState();
}
List<String> list = <String>['999/m- 5yr Plan', '1499/m- 2yr Plan', '1999/m- 12m Plan', '2999/m- 6m Plan', '3999/m- 3m Plan'];
String dropdownValue = list.first;
var arrFeature = ['Power Full Admin Dashboard.','Create & Manage Multiple Users.',
  'Create Subscription Plans.','Enable OR Disable Payments Options.'];

class _OnTapState extends State<OnTap> {



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 0.3,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        actions: [
          IconButton(icon: Icon(Icons.call,color: Colors.redAccent,), onPressed: () { launchCaller(); },),

        ],
        title: Image.asset('images/logo_horizon.png', height: 40,),
      ),
      floatingActionButton: Wrap( //will break to another line on overflow
        direction: Axis.vertical, //use vertical to show  on vertical axis
        children: <Widget>[ //button first
          Container(
              margin:EdgeInsets.all(10),
              child: FloatingActionButton(
                onPressed: (){
                 final pname=widget.product_name;
                  final sku= "FCAOR4440${widget.id}";
                  final category=widget.product_category;
                  openwhatsapp("hi we are visted your site https://apponrent.com we have some query on related product its name is "
                      "*$pname* its item no is *$sku* on *$category* sector");
                },
                backgroundColor: Colors.transparent,
                splashColor:Colors.transparent,
                child: Image.asset('images/wp.gif'),
              )
          ),
          // button third// Add more buttons here
        ],
      ),

      body: ListView(
        children: [
          Row(
            children: [
              SizedBox(height: 40, width: 10,),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Text(
                  //"rrr",
                  '${widget.product_category}'== 'null'?'Search':'${widget.product_category}',
                  style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold, fontSize: 19,),),
              ),
              Icon(Icons.arrow_forward_ios, size: 19,),
              SizedBox(width: 10,),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Text(widget.product_name!, style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold, fontSize: 19,),),
              ),
              Icon(Icons.arrow_forward_ios, size: 22,),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Text('Details', style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold, fontSize: 19,),),
              ),

            ],
          ),

          Responsive(
            mobile: mobile(context),
            tablet: tablet(context),
            desktop: desk(context),
          ),
        ],
      ),
    );
  }

  String dropdownvalue = 'Select your Purchase plan';




  mobile(BuildContext context){
    final imageuri=Apiconst.productimage;
     var a = '${widget.other_images}';
     var ab = jsonDecode(a);

      List<dynamic> abc = ab as List;

     return


         Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              child: Text(
                "${widget.product_name}",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                  fontSize:MediaQuery.of(context).size.width/25,),),
            ),
            SizedBox(height: 20,),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CarouselSlider(

                    items: abc.map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return InkWell(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>  zoompic(image: imageuri+'$i')),
                              );
                            },
                            child: Container(
                              height:MediaQuery.of(context).size.height*0.25,

                               width: MediaQuery.of(context).size.width,
                              child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        15.0),
                                  ),
                                  elevation: 5,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        15.0),
                                    child: Image.network(
                                      imageuri+i, fit: BoxFit.fill,
                                      height:MediaQuery.of(context).size.height*0.25,),
                                  )
                              ),
                            ),

                          );
                        },
                      );
                     // $i'
                    }).toList(),
                      options: CarouselOptions(
                        height: MediaQuery.of(context).size.height*0.25,
                        aspectRatio: 12/9,
                        viewportFraction: 1,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.3,
                       // onPageChanged: callbackFunction,
                        scrollDirection: Axis.horizontal,
                      ),

                  ),


                  SizedBox(height: 20,),
                  Container(

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Container(
                          width:MediaQuery.of(context).size.width * 0.4,
                          child: ElevatedButton.icon(
                            icon: Icon(Icons.remove_red_eye),
                            label: Text("Live Preview", style: TextStyle(
                                color: Colors.white,
                                fontSize: MediaQuery.of(context).size.width/25,
                                fontWeight: FontWeight.bold
                            ),),

                            onPressed: () async {
                              mains();
                              // Navigator.push(context, MaterialPageRoute(
                              //     builder: (context) => MyApp()));


                              final snackBar = SnackBar(
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10))),
                                behavior: SnackBarBehavior.floating,
                                content: Text('Generating PDF!'),

                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                  snackBar);
                            },

                            style: ElevatedButton.styleFrom(
                              primary: Colors.blue,
                              onPrimary: Colors.white,
                              shadowColor: Colors.red,
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),


                        Container(
                          width:MediaQuery.of(context).size.width * 0.4,

                          child: ElevatedButton.icon(
                            icon: Icon(Icons.remove_red_eye),
                            label: Text("Screenshots", style: TextStyle(
                                color: Colors.white,
                                fontSize: MediaQuery.of(context).size.width/25,
                                fontWeight: FontWeight.bold
                            ),),

                            onPressed: () async {
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => ScreenShorts(
                                      image:"${widget.other_images}",
                                    product_category:"${widget.product_category}",
                                    product_name:"${widget.product_name}",
                                  )));
                            },

                            style: ElevatedButton.styleFrom(
                              primary: Colors.teal,
                              onPrimary: Colors.white,
                              shadowColor: Colors.red,
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),

                  RichText(
                      text:
                      TextSpan(
                      text: 'Price : ₹ ${widget.selling_price}',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                      children: [
                        TextSpan(
                            text: '(${widget.discount}% off)',
                            style: TextStyle(
                              color: Color(0xffF80849),
                              fontSize: 15,
                            ),

                        )
                      ])),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(top: 10),
                    child: Text(
                        '* Price is in US dollars and excludes tax'),
                  ),
                  SizedBox(height: 10),

                  Row(
                    children: [
                      Icon(Icons.ac_unit, size: 15,),
                      Text(
                        " SKU :  FCAOR4440${widget.id}",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500, fontSize: 15),),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                     Image.asset("images/sandtimer.gif",height: 20,),
                      Text(
                        " Estimated time :  ${widget.time}",
                        style: TextStyle(
                          color: Colors.grey,
                            fontWeight: FontWeight.w500, fontSize: 20),),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment
                        .spaceBetween,
                    children: [
                      Container(
                        width: 270,
                        child: Text(dropdownvalue, style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                      ),
                      PopupMenuButton<String>(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        icon: const Icon(Icons.sort),
                        onSelected: (String? newValue) {
                          setState(() {
                            dropdownvalue = newValue!;
                            const value = true;
                          });
                        },
                        itemBuilder: (BuildContext context) {
                          return [
                            '₹${widget.year_10price}'+' @ 10 Years ₹${widget.year_10}'+'/m',
                            '₹${widget.year_5price}'+' @ 5 Years ₹${widget.year_5}'+'/m',
                            '₹${widget.year_2price}'+' @ 2 Years ₹${widget.year_2}'+'/m',
                            '₹${widget.month_12price}'+' @ 12 month ₹${widget.month_12}'+'/m',
                            '₹${widget.month_6price}'+' @ 6 month ₹${widget.month_6}'+'/m',

                            '₹${widget.month_3price}'+' @ 3 month ₹${widget.month_3}'+'/m',
                            'Selling Full Source code & Setup @ ₹${widget.selling_price}',


                          ].map((String choice) {
                            return PopupMenuItem<String>(
                              value: choice,
                              child: Text(choice),
                            );
                          }).toList();
                        },
                      ),

                    ],
                  ),
                 Divider(thickness: 1,),
                  Row(
                    children: [
                      Icon(Icons.check, size: 18,),
                      Text('     Quality checked by Envato')
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.check, size: 18,),
                      Text('   Quality checked by Envato')
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.check, size: 18,),
                      Text('    Quality checked by Envato')
                    ],
                  ),
                  SizedBox(height: 10,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment
                        .spaceBetween,
                    children: [

                      Container(
                        width:MediaQuery.of(context).size.width * 0.4,

                        child: ElevatedButton.icon(
                          icon: Icon(Icons.shopping_cart),
                          label: Text("Add to Cart", style: TextStyle(
                              color: Colors.white,
                              fontSize:MediaQuery.of(context).size.width/25,
                              fontWeight: FontWeight.bold
                          ),),

                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        AddToCart(product_image: "${widget.product_image}",
                                          category:"${widget.category}",
                                          product_name:"${widget.product_name}",
                                          discount: "${widget.discount}",
                                          plan: dropdownvalue,

                                        ))
                            );
                          },

                          style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                            onPrimary: Colors.white,
                            shadowColor: Colors.red,
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width:MediaQuery.of(context).size.width * 0.4,

                        child: ElevatedButton.icon(
                          icon: Icon(Icons.favorite_border),
                          label: Text("Favorite", style: TextStyle(
                              color: Colors.white,
                              fontSize: MediaQuery.of(context).size.width/25,
                              fontWeight: FontWeight.bold
                          ),),

                          onPressed: () {
                            Add_wish_list();
                          },

                          style: ElevatedButton.styleFrom(
                            primary: Colors.redAccent,
                            onPrimary: Colors.white,
                            shadowColor: Colors.red,
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                  SizedBox(height: 10,),

                  Text("Description", style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),),
                  Text(
                    "${widget.full_description}",
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.justify,),
                  SizedBox(height: 15,),

                  Text("Feature", style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),),
                  Text("${widget.features}",
                    textAlign: TextAlign.justify
                    , style: TextStyle(
                      ),),

                ],
              ),
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment
                  .spaceBetween,
              children: [

                Container(
                  width:MediaQuery.of(context).size.width * 0.4,

                  child: ElevatedButton.icon(
                    icon: Icon(Icons.web),
                    label: Text("Website", style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.width/25,
                        fontWeight: FontWeight.bold
                    ),),

                    onPressed: () async {
                      var url = "${widget.web_url}";
                      if(await canLaunch(url)){
                        await launch(url);
                      }else {
                        throw 'Could not launch $url';
                      }
                    },

                    style: ElevatedButton.styleFrom(
                      primary: Colors.orange,
                      onPrimary: Colors.white,
                      shadowColor: Colors.red,
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
                Container(
                  width:MediaQuery.of(context).size.width * 0.4,

                  child: ElevatedButton.icon(
                    icon: Icon(Icons.admin_panel_settings_outlined),
                    label: Text("Admin Pannel", style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.width/35,
                        fontWeight: FontWeight.bold
                    ),),

                    onPressed: () async {
                      var url = "${widget.admin_url}";
                      if(await canLaunch(url)){
                        await launch(url);
                      }else {
                        throw 'Could not launch $url';
                      }
                    },

                    style: ElevatedButton.styleFrom(
                      primary: Colors.pinkAccent,
                      onPrimary: Colors.white,
                      shadowColor: Colors.red,
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),

              ],
            ),
            SizedBox(height: 20,),
            Container(
                height: 300,
                width: MediaQuery.of(context).size.width,
                child: VideoPlayerScreen(vvideo:   "${widget.video_url}",))

          ],
        ),

      );

  }

  tablet(BuildContext context){
    final imageuri=Apiconst.productimage;
    var a = '${widget.other_images}';
    var ab = jsonDecode(a);

    List<dynamic> abc = ab as List;

    return

      Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              child: Text(
                "${widget.product_name}",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize:MediaQuery.of(context).size.width/25,),),
            ),
            SizedBox(height: 20,),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CarouselSlider(

                    items: abc.map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return InkWell(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>  zoompic(image: imageuri+'$i')),
                              );
                            },
                            child: Container(
                              height:MediaQuery.of(context).size.height*0.25,

                              width: MediaQuery.of(context).size.width,
                              child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        15.0),
                                  ),
                                  elevation: 5,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        15.0),
                                    child: Image.network(
                                      imageuri+i, fit: BoxFit.fill,
                                      height:MediaQuery.of(context).size.height*0.25,),
                                  )
                              ),
                            ),

                          );
                        },
                      );
                      // $i'
                    }).toList(),
                    options: CarouselOptions(
                      height: MediaQuery.of(context).size.height*0.25,
                      aspectRatio: 12/9,
                      viewportFraction: 1,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.3,
                      // onPageChanged: callbackFunction,
                      scrollDirection: Axis.horizontal,
                    ),

                  ),


                  SizedBox(height: 20,),
                  Container(

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Container(
                          width:MediaQuery.of(context).size.width * 0.4,
                          child: ElevatedButton.icon(
                            icon: Icon(Icons.remove_red_eye),
                            label: Text("Live Preview", style: TextStyle(
                                color: Colors.white,
                                fontSize: MediaQuery.of(context).size.width/25,
                                fontWeight: FontWeight.bold
                            ),),

                            onPressed: () async {
                              mains();
                              // Navigator.push(context, MaterialPageRoute(
                              //     builder: (context) => MyApp()));


                              final snackBar = SnackBar(
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10))),
                                behavior: SnackBarBehavior.floating,
                                content: Text('Generating PDF!'),

                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                  snackBar);
                            },

                            style: ElevatedButton.styleFrom(
                              primary: Colors.blue,
                              onPrimary: Colors.white,
                              shadowColor: Colors.red,
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),


                        Container(
                          width:MediaQuery.of(context).size.width * 0.4,

                          child: ElevatedButton.icon(
                            icon: Icon(Icons.remove_red_eye),
                            label: Text("Screenshots", style: TextStyle(
                                color: Colors.white,
                                fontSize: MediaQuery.of(context).size.width/25,
                                fontWeight: FontWeight.bold
                            ),),

                            onPressed: () async {
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => ScreenShorts(
                                    image:"${widget.other_images}",
                                    product_category:"${widget.product_category}",
                                    product_name:"${widget.product_name}",
                                  )));
                            },

                            style: ElevatedButton.styleFrom(
                              primary: Colors.teal,
                              onPrimary: Colors.white,
                              shadowColor: Colors.red,
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),

                  RichText(
                      text:
                      TextSpan(
                          text: 'Price : ₹ ${widget.selling_price}',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                          children: [
                            TextSpan(
                              text: '(${widget.discount}% off)',
                              style: TextStyle(
                                color: Color(0xffF80849),
                                fontSize: 15,
                              ),

                            )
                          ])),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(top: 10),
                    child: Text(
                        '* Price is in US dollars and excludes tax'),
                  ),
                  SizedBox(height: 10),

                  Row(
                    children: [
                      Icon(Icons.ac_unit, size: 15,),
                      Text(
                        " SKU :  FCAOR4440${widget.id}",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500, fontSize: 15),),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Image.asset("images/sandtimer.gif",height: 20,),
                      Text(
                        " Estimated time :  ${widget.time}",
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w500, fontSize: 20),),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment
                        .spaceBetween,
                    children: [
                      Container(
                        width: 270,
                        child: Text(dropdownvalue, style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                      ),
                      PopupMenuButton<String>(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        icon: const Icon(Icons.sort),
                        onSelected: (String? newValue) {
                          setState(() {
                            dropdownvalue = newValue!;
                            const value = true;
                          });
                        },
                        itemBuilder: (BuildContext context) {
                          return [
                            '${widget.year_10price}','₹${widget.year_10price}'+' @ 10 Years ₹${widget.year_10}'+'/m',
                            '${widget.year_5price}','₹${widget.year_5price}'+' @ 5 Years ₹${widget.year_5}'+'/m',
                            '${widget.year_2price}','₹${widget.year_2price}'+' @ 2 Years ₹${widget.year_2}'+'/m',
                            '${widget.month_12price}','₹${widget.month_12price}'+' @ 12 month ₹${widget.month_12}'+'/m',
                            '${widget.month_6price}', '₹${widget.month_6price}'+' @ 6 month ₹${widget.month_6}'+'/m',

                            '${widget.month_3price}','₹${widget.month_3price}'+' @ 3 month ₹${widget.month_3}'+'/m',
                            '${widget.selling_price}','Selling Full Source code & Setup @ ₹${widget.selling_price}',


                          ].map((String choice) {
                            return PopupMenuItem<String>(
                              value: choice,
                              child: Text(choice),
                            );
                          }).toList();
                        },
                      ),

                    ],
                  ),
                  Divider(thickness: 1,),
                  Row(
                    children: [
                      Icon(Icons.check, size: 18,),
                      Text('     Quality checked by Envato')
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.check, size: 18,),
                      Text('   Quality checked by Envato')
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.check, size: 18,),
                      Text('    Quality checked by Envato')
                    ],
                  ),
                  SizedBox(height: 10,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment
                        .spaceBetween,
                    children: [

                      Container(
                        width:MediaQuery.of(context).size.width * 0.4,

                        child: ElevatedButton.icon(
                          icon: Icon(Icons.shopping_cart),
                          label: Text("Add to Cart", style: TextStyle(
                              color: Colors.white,
                              fontSize:MediaQuery.of(context).size.width/25,
                              fontWeight: FontWeight.bold
                          ),),

                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        AddToCart(product_image: "${widget.product_image}",
                                          category:"${widget.category}",
                                          product_name:"${widget.product_name}",
                                          discount: "${widget.discount}",
                                          plan: dropdownvalue,

                                        ))
                            );
                          },

                          style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                            onPrimary: Colors.white,
                            shadowColor: Colors.red,
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width:MediaQuery.of(context).size.width * 0.4,

                        child: ElevatedButton.icon(
                          icon: Icon(Icons.favorite_border),
                          label: Text("Favorite", style: TextStyle(
                              color: Colors.white,
                              fontSize: MediaQuery.of(context).size.width/25,
                              fontWeight: FontWeight.bold
                          ),),

                          onPressed: () {

                          },

                          style: ElevatedButton.styleFrom(
                            primary: Colors.redAccent,
                            onPrimary: Colors.white,
                            shadowColor: Colors.red,
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                  SizedBox(height: 10,),

                  Text("Description", style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),),
                  Text(
                    "${widget.full_description}",
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.justify,),
                  SizedBox(height: 15,),

                  Text("Feature", style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),),
                  Text("${widget.features}",
                    textAlign: TextAlign.justify
                    , style: TextStyle(
                    ),),

                ],
              ),
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment
                  .spaceBetween,
              children: [

                Container(
                  width:MediaQuery.of(context).size.width * 0.4,

                  child: ElevatedButton.icon(
                    icon: Icon(Icons.web),
                    label: Text("Website", style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.width/25,
                        fontWeight: FontWeight.bold
                    ),),

                    onPressed: () async {
                      var url = "${widget.web_url}";
                      if(await canLaunch(url)){
                        await launch(url);
                      }else {
                        throw 'Could not launch $url';
                      }
                    },

                    style: ElevatedButton.styleFrom(
                      primary: Colors.orange,
                      onPrimary: Colors.white,
                      shadowColor: Colors.red,
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
                Container(
                  width:MediaQuery.of(context).size.width * 0.4,

                  child: ElevatedButton.icon(
                    icon: Icon(Icons.admin_panel_settings_outlined),
                    label: Text("Admin Pannel", style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.width/35,
                        fontWeight: FontWeight.bold
                    ),),

                    onPressed: () async {
                      var url = "${widget.admin_url}";
                      if(await canLaunch(url)){
                        await launch(url);
                      }else {
                        throw 'Could not launch $url';
                      }
                    },

                    style: ElevatedButton.styleFrom(
                      primary: Colors.pinkAccent,
                      onPrimary: Colors.white,
                      shadowColor: Colors.red,
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),

              ],
            ),
            SizedBox(height: 20,),
            Container(
                height: 300,
                width: MediaQuery.of(context).size.width,
                child: VideoPlayerScreen(vvideo:   "${widget.video_url}",))

          ],
        ),

      );

  }


  desk(BuildContext context){
    final imageuri=Apiconst.productimage;
    var a = '${widget.other_images}';
    var ab = jsonDecode(a);
    List<dynamic> abc = ab as List;
    return
      Column(
      children: [
        Text(
          "${widget.product_name}",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize:MediaQuery.of(context).size.width/25,),),
        Row(
          children: [
            CarouselSlider(

              items: abc.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  zoompic(image: imageuri+'$i')),
                        );
                      },
                      child: Container(
                        height:400,

                        width: 400,
                        child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  15.0),
                            ),
                            elevation: 5,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  15.0),
                              child: Image.network(
                                imageuri+i, fit: BoxFit.fill,
                                height:400,),
                            )
                        ),
                      ),

                    );
                  },
                );
                // $i'
              }).toList(),
              options: CarouselOptions(
                height: 400,
                aspectRatio: 12/9,
                viewportFraction: 1,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
                // onPageChanged: callbackFunction,
                scrollDirection: Axis.horizontal,
              ),

            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment
                      .spaceBetween,
                  children: [
                    Container(
                      width: 270,
                      child: Text(dropdownvalue, style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                    ),
                    PopupMenuButton<String>(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      icon: const Icon(Icons.sort),
                      onSelected: (String? newValue) {
                        setState(() {
                          dropdownvalue = newValue!;
                          const value = true;
                        });
                      },
                      itemBuilder: (BuildContext context) {
                        return [
                          '₹${widget.year_10price}'+' @ 10 Years ₹${widget.year_10}'+'/m',
                          '₹${widget.year_5price}'+' @ 5 Years ₹${widget.year_5}'+'/m',
                          '₹${widget.year_2price}'+' @ 2 Years ₹${widget.year_2}'+'/m',
                          '₹${widget.month_12price}'+' @ 12 month ₹${widget.month_12}'+'/m',
                          '₹${widget.month_6price}'+' @ 6 month ₹${widget.month_6}'+'/m',

                          '₹${widget.month_3price}'+' @ 3 month ₹${widget.month_3}'+'/m',
                          'Selling Full Source code & Setup @ ₹${widget.selling_price}',


                        ].map((String choice) {
                          return PopupMenuItem<String>(
                            value: choice,
                            child: Text(choice),
                          );
                        }).toList();
                      },
                    ),

                  ],
                ),
                Divider(thickness: 1,),
                Row(
                  children: [
                    Icon(Icons.check, size: 18,),
                    Text('     Quality checked by Envato')
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.check, size: 18,),
                    Text('   Quality checked by Envato')
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.check, size: 18,),
                    Text('    Quality checked by Envato')
                  ],
                ),
              ],
            )
          ],
        )
      ],
    );

  }

  // Future<List<Allproducts>> Allproduct() async {
  //   final response = await http.post(
  //     Uri.parse(
  //         "https://sv.codescarts.com/apponrent/guruji/api/Mobile_app/product_category?device_id=1&category=1&count=10&id=1"),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //   );
  //   var jsond = json.decode(response.body)["data"];
  //   print(response.body);
  //   List<Allproducts> alllround = [];
  //   for (var o in jsond) {
  //     Allproducts al = Allproducts(
  //       o["id"],
  //       o["product_image"],
  //       o["other_images"],
  //       o["category"],
  //       o["product_name"],
  //       o["sdescription"],
  //       o["full_description"],
  //       o["seo"],
  //       o["mispell_key"],
  //       o["features"],
  //       o["rental_price"],
  //       o["selling_price"],
  //       o["discount"],
  //       o["time"],
  //       o["product_spiecified"],
  //       o["admin_url"],
  //       o["web_url"],
  //       o["mobile_app"],
  //       o["video_url"],
  //       o["likes"],
  //       o["recentview"],
  //       o["wishlists"],
  //       o["mywishlist"],
  //       o["mylikes"],
  //       o["product_category"],
  //       o["plan_name"],
  //       o["month_3"],
  //       o["month_6"],
  //       o["month_12"],
  //       o["year_2"],
  //       o["year_5"],
  //       o["year_10"],
  //       o["month_3price"],
  //       o["month_6price"],
  //       o["month_12price"],
  //       o["year_2price"],
  //       o["year_5price"],
  //       o["year_10price"],
  //
  //     );
  //     alllround.add(al);
  //   }
  //   return alllround;
  // }
  Add_wish_list()async {
    print("pjunlike");
    print('${widget.id}');
    final id=widget.id;
    final prefs = await SharedPreferences.getInstance();
    final key = 'deviceId';
    final deviceId = prefs.getString(key) ?? "0";
    final url= Apiconst.addwishlisht+"product_id=$id&device_id=$deviceId&status=1";
    final unlikeapi= await http.get(Uri.parse(url));
    print(url);

    final data=jsonDecode(unlikeapi.body);
    if (data['error'] == 200) {
      Fluttertoast.showToast(
          msg: data['msg'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
    else {
      Fluttertoast.showToast(
          msg: data['msg'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
    print(data);
  }



}
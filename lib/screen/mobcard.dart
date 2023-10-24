import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:hovering/hovering.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testt/constants.dart';
import 'package:testt/responsive.dart';
import 'package:testt/HOME_pages/Home.dart';
import 'package:testt/HOME_pages/addtocartall.dart';
import 'package:testt/screen/ontapproduct.dart';
import 'package:testt/testg/src/like_button.dart';
import 'package:testt/testg/src/utils/like_button_model.dart';
import 'package:testt/widget/sizes_helpers.dart';
import 'package:testt/widget/mobstar.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_share/flutter_share.dart';

import 'package:like_button/src/painter/bubbles_painter.dart';
import 'package:like_button/src/painter/circle_painter.dart';
import 'package:like_button/src/utils/like_button_model.dart';
import 'package:like_button/src/utils/like_button_typedef.dart';
import 'package:like_button/src/utils/like_button_util.dart';
class mobcard extends StatefulWidget {
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
   mobcard({
     required this.id,
     required this.product_image,
    required this.other_images,
    required this.category,
    required this.product_name,
     required this.sdescription,
     required this.full_description,
    required this.seo
    ,required this.mispell_key
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

  }) ;
  @override
  State<mobcard> createState() => _mobcardState();
}
List<String> favoriteDataList = [];

class _mobcardState extends State<mobcard> {

  Future<void> share() async {
    await FlutterShare.share(
        title: widget.selling_price.toString(),
        text: "hi we liked that product ${widget.product_name} can you check it once on ${widget.product_category} sector",
        linkUrl: 'https://flutter.dev/',
        chooserTitle: widget.category,
    );
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Responsive(
        mobile: mobile(context),
        tablet: tablet(context),
        desktop: desk(context),
      ),

    );



  }
  bool raja=false;
  mobile(BuildContext context) {
    final lkes=int.parse(widget.likes==null?'0':"${widget.likes}");
    pj(){
      if(widget.mylikes=='1'){
        setState(() {
          raja=true;
        });
      }
    }
    // var lko=lkes;

    return InkWell(
      onTap: (){

        Navigator.push(context, MaterialPageRoute(builder: (context)=>OnTap(
          id: widget.id, product_image: widget.product_image, other_images: widget.other_images,
          sdescription: widget.sdescription, full_description: widget.full_description, product_name: widget.product_name,
          mispell_key: widget.mispell_key, features: widget.features, rental_price: widget.rental_price,
          selling_price: widget.selling_price, discount: widget.discount, time: widget.time, seo: widget.seo, web_url: widget.web_url,
          product_spiecified: widget.product_spiecified, mobile_app: widget.mobile_app, category:widget.category,
          likes: widget.likes, video_url: widget.video_url, wishlists: widget.wishlists, admin_url: widget.admin_url,
          mylikes: widget.mylikes, product_category: widget.product_category, plan_name:widget.plan_name, month_3: widget.month_3,
          month_6: widget.month_6, mywishlist: widget.mywishlist, month_12: widget.month_12, year_2: widget.year_2,
          year_10: widget.year_10, year_10price: widget.year_10price, year_5: widget.year_5, recentview: widget.recentview, month_3price: widget.month_3price, month_6price: widget.month_6price, month_12price: widget.month_12price, year_2price: widget.year_2price, year_5price: widget.year_5price,
        )));
      },
      child: Container(

        height: MediaQuery.of(context).size.height*0.40,
        child:  Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height:MediaQuery.of(context).size.height*0.20,
                    width: MediaQuery.of(context).size.width,
                    child:
                    widget.product_image==null? Container():
                    ClipRRect(
                      borderRadius: BorderRadius.only
                        (topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      child: Image.network(
                        Apiconst.productimage+"${widget.product_image}",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Positioned(

                      child:
                      widget.discount==null?Container():
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.5),
                          borderRadius: BorderRadius.only
                            (topLeft: Radius.circular(10),
                          ),
                        ),

                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text("${widget.discount} %",style: TextStyle
                                (color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),),
                              Text("Discount",style: TextStyle
                                (color: Colors.white,
                                fontSize: 10,
                              ),),
                            ],
                          ),
                        ),
                      )),
                  Positioned(
                    bottom: 0,
                    child:Container(
                        decoration: BoxDecoration(
                          color: Colors.green.withOpacity(0.5),

                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(widget.product_category==null?'':"${widget.product_category}".toString(),
                            style: TextStyle(fontSize: displayWidth(context)* 0.038,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),),
                        )),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child:Container(


                        child: Padding(
                            padding: const EdgeInsets.only(right:4.0,top: 1,),
                            child: IconButton(onPressed: share,
                              icon: Icon(Icons.share_outlined,size: 30,),
                            )
                        )),
                  ),

                  Positioned(
                      top: 5,
                      right: 70,
                      child:
                      LikeButton(
                        size: 20,
                        isLiked:raja,

                        likeBuilder: (bool isLiked) {
                          return Icon(
                            Icons.favorite,
                            color: isLiked ? Colors.red : Colors.grey,
                            size: 30,
                          );
                        },
                        //likeCount: lkes,
                        countBuilder: ( count, bool isLiked, String text) {
                          var color = isLiked ? Colors.red : Colors.grey;
                          Widget result;
                          if (count == 0) {
                            result = Text(
                              "0",
                              style: TextStyle(color: color),
                            );
                          } else
                            result = Text(
                              text,
                              style: TextStyle(color: color),
                            );
                          return result;
                        },
                      ),
                  )


                ],
              ),
              SizedBox(height: 8,),
              Text(widget.product_name==null?'':"${widget.product_name}",
                style: TextStyle( fontSize:MediaQuery.of(context).size.width/18,
                fontWeight: FontWeight.bold,color: Colors.black.withOpacity(0.7),),),
              SizedBox(height: 8,),
              Container(
                width: displayWidth(context)*0.9,
                // height: displayHeight(context)*0.10,

                child: Container(
                    margin: EdgeInsets.only(left: 5),
                    width: displayWidth(context)*0.4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          // height: 37,
                          child: Text(
                            widget.sdescription==null?'':"${widget.sdescription}"
                            ,maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize:MediaQuery.of(context).size.width/35,),),
                        ),
                        SizedBox(height: 10,),

                        Row(
                          children: [
                            // Text(lko.toString(),style: TextStyle(fontSize: 20),),
                            SizedBox(width: 5,),
                            LikeButton(
                              onTap: onLikeButtonTapped,

                              size: 20,

                              likeBuilder: (bool isLiked) {

                                return Icon(
                                  Icons.thumb_up_alt,
                                  color: isLiked ? Colors.blue : Colors.grey,
                                  size: 20,
                                );
                              },
                              likeCount: lkes,
                              countBuilder: ( count, bool isLiked, String text) {
                                var color = isLiked ? Colors.blue : Colors.grey;
                                Widget result;
                                if (count == 0) {
                                  result = Text(
                                    "0",
                                    style: TextStyle(color: color),
                                  );
                                } else
                                  result = Text(
                                    text,
                                    style: TextStyle(color: color),
                                  );
                                return result;
                              }, isLiked: false,
                            ),

                            SizedBox(width: 20,),
                            Text(widget.recentview==null?'0':"${widget.recentview}",style: TextStyle(fontSize: 20),),
                            SizedBox(width: 5,),

                            Icon(Icons.remove_red_eye_outlined,color: Colors.blue.withOpacity(0.5),),
                            Spacer(),
                            Text(widget.time==null?'0':"${widget.time}",style: TextStyle(fontSize: 20),),
                            SizedBox(width: 5,),

                            Icon(Icons.watch_later_outlined,color: Colors.blue.withOpacity(0.5),),


                          ],
                        ),

                      ],
                    )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  tablet(BuildContext context) {
    final lkes=int.parse(widget.likes==null?'0':"${widget.likes}");
    var lko=lkes;
    return InkWell(
      onTap: (){

        Navigator.push(context, MaterialPageRoute(builder: (context)=>OnTap(
          id: widget.id, product_image: widget.product_image, other_images: widget.other_images,
          sdescription: widget.sdescription, full_description: widget.full_description, product_name: widget.product_name,
          mispell_key: widget.mispell_key, features: widget.features, rental_price: widget.rental_price,
          selling_price: widget.selling_price, discount: widget.discount, time: widget.time, seo: widget.seo, web_url: widget.web_url,
          product_spiecified: widget.product_spiecified, mobile_app: widget.mobile_app, category:widget.category,
          likes: widget.likes, video_url: widget.video_url, wishlists: widget.wishlists, admin_url: widget.admin_url,
          mylikes: widget.mylikes, product_category: widget.product_category, plan_name:widget.plan_name, month_3: widget.month_3,
          month_6: widget.month_6, mywishlist: widget.mywishlist, month_12: widget.month_12, year_2: widget.year_2,
          year_10: widget.year_10, year_10price: widget.year_10price, year_5: widget.year_5, recentview: widget.recentview, month_3price: widget.month_3price, month_6price: widget.month_6price, month_12price: widget.month_12price, year_2price: widget.year_2price, year_5price: widget.year_5price,
        )));
      },
      child:Container(

        height: MediaQuery.of(context).size.height,
        child:  Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height:MediaQuery.of(context).size.height*0.20,
                    width: MediaQuery.of(context).size.width,
                    child:
                    widget.product_image==null? Container():
                    ClipRRect(
                      borderRadius: BorderRadius.only
                        (topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      child: Image.network(
                        Apiconst.productimage+"${widget.product_image}",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Positioned(

                      child:
                      widget.discount==null?Container():
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.5),
                          borderRadius: BorderRadius.only
                            (topLeft: Radius.circular(10),
                          ),
                        ),

                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text("${widget.discount} %",style: TextStyle
                                (color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),),
                              Text("Discount",style: TextStyle
                                (color: Colors.white,
                                fontSize: 10,
                              ),),
                            ],
                          ),
                        ),
                      )),
                  Positioned(
                    bottom: 0,
                    child:Container(
                        decoration: BoxDecoration(
                          color: Colors.green.withOpacity(0.5),

                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(widget.product_category==null?'':"${widget.product_category}".toString(),
                            style: TextStyle(fontSize: displayWidth(context)* 0.038,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),),
                        )),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child:Container(


                        child: Padding(
                            padding: const EdgeInsets.only(right:4.0,top: 1,),
                            child: IconButton(onPressed: share,
                              icon: Icon(Icons.share_outlined,size: 30,),
                            )
                        )),
                  ),

                  Positioned(
                    top: 5,
                    right: 50,
                    child:
                    lkstatus==null? IconButton(onPressed: (){
                      setState(() {
                        lkstatus='1';
                      });
                      like();
                    },
                        icon: Icon(Icons.favorite_border)):
                        widget.mylikes==null?
                    IconButton(onPressed: (){
                      lkstatus=null;
                      unlike();
                     }, icon: Icon(Icons.favorite)) :
                        IconButton(onPressed: (){
                          setState(() {
                            lkstatus=null;
                          });
                          unlike();
                        }, icon: Icon(Icons.favorite))
                  )
                  ,

                ],
              ),
              SizedBox(height: 8,),
              Text(widget.product_name==null?'':"${widget.product_name}",
                style: TextStyle( fontSize:MediaQuery.of(context).size.width/18,
                  fontWeight: FontWeight.bold,color: Colors.black.withOpacity(0.7),),),
              SizedBox(height: 8,),
              Container(
                width: displayWidth(context)*0.9,
                // height: displayHeight(context)*0.10,

                child: Container(
                    margin: EdgeInsets.only(left: 5),
                    width: displayWidth(context)*0.4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 40,
                          child: Text(
                            widget.sdescription==null?'':"${widget.sdescription}"
                            ,maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize:MediaQuery.of(context).size.width/35,),),
                        ),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            Text(lko.toString(),style: TextStyle(fontSize: 20),),
                            SizedBox(width: 5,),
                            lkstatus==null? IconButton(onPressed: (){
                              setState(() {

                                lko= lkes+1;
                                lkstatus='1';
                              });
                              like();
                            },
                                icon: Icon(Icons.thumb_up_alt_outlined)):
                            widget.mylikes==null?
                            IconButton(onPressed: (){
                              final lkes=int.parse(widget.likes==null?'0':"${widget.likes}"),

                              lko= lkes+1;
                              lkstatus=null;
                              unlike();
                            }, icon: Icon(Icons.thumb_up_alt)) :

                            IconButton(onPressed: (){
                              final lkes=int.parse(widget.likes==null?'0':"${widget.likes}");

                              setState(() {

                                lko= lkes-1;
                                lkstatus=null;
                              });
                              unlike();
                            }, icon: Icon(Icons.thumb_up_alt)),
                          //  Icon(Icons.thumb_up_alt,color: Colors.blue,),
                            SizedBox(width: 20,),
                            Text(widget.recentview==null?'0':"${widget.recentview}",style: TextStyle(fontSize: 20),),
                            SizedBox(width: 5,),

                            Icon(Icons.remove_red_eye_outlined,color: Colors.blue.withOpacity(0.5),),
                            Spacer(),
                            Text(widget.time==null?'0':"${widget.time}",style: TextStyle(fontSize: 20),),
                            SizedBox(width: 5,),

                            Icon(Icons.watch_later_outlined,color: Colors.blue.withOpacity(0.5),),
                          ],
                        ),

                      ],
                    )
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
  desk(BuildContext context) {
    final lkes=int.parse(widget.likes==null?'0':"${widget.likes}");
    pj(){
      if(widget.mylikes=='1'){
        setState(() {
          raja=true;
        });
      }
    }
    // var lko=lkes;

    return InkWell(
      onTap: (){

        Navigator.push(context, MaterialPageRoute(builder: (context)=>OnTap(
          id: widget.id, product_image: widget.product_image, other_images: widget.other_images,
          sdescription: widget.sdescription, full_description: widget.full_description, product_name: widget.product_name,
          mispell_key: widget.mispell_key, features: widget.features, rental_price: widget.rental_price,
          selling_price: widget.selling_price, discount: widget.discount, time: widget.time, seo: widget.seo, web_url: widget.web_url,
          product_spiecified: widget.product_spiecified, mobile_app: widget.mobile_app, category:widget.category,
          likes: widget.likes, video_url: widget.video_url, wishlists: widget.wishlists, admin_url: widget.admin_url,
          mylikes: widget.mylikes, product_category: widget.product_category, plan_name:widget.plan_name, month_3: widget.month_3,
          month_6: widget.month_6, mywishlist: widget.mywishlist, month_12: widget.month_12, year_2: widget.year_2,
          year_10: widget.year_10, year_10price: widget.year_10price, year_5: widget.year_5, recentview: widget.recentview, month_3price: widget.month_3price, month_6price: widget.month_6price, month_12price: widget.month_12price, year_2price: widget.year_2price, year_5price: widget.year_5price,
        )));
      },
      child: Container(

        height: MediaQuery.of(context).size.height*0.40,
        child:  Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),),
          child:  HoverWidget(
            hoverChild: Container(
              height: MediaQuery.of(context).size.height*0.40,
              width: MediaQuery.of(context).size.width*0.40,

              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height:MediaQuery.of(context).size.height*0.20,
                        width: MediaQuery.of(context).size.width,
                        child:
                        widget.product_image==null? Container():
                        ClipRRect(
                          borderRadius: BorderRadius.only
                            (topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                          child: Image.network(
                            Apiconst.productimage+"${widget.product_image}",
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Positioned(

                          child:
                          widget.discount==null?Container():
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.blue.withOpacity(0.5),
                              borderRadius: BorderRadius.only
                                (topLeft: Radius.circular(10),
                              ),
                            ),

                            child: Padding(
                              padding:  EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Text("${widget.discount} %",style: TextStyle
                                    (color: Colors.white,
                                      fontSize: 8,
                                      fontWeight: FontWeight.bold),),
                                  Text("Discount",style: TextStyle
                                    (color: Colors.white,
                                    fontSize: 7,
                                  ),),
                                ],
                              ),
                            ),
                          )),
                      Positioned(
                        bottom: 0,
                        child:Container(
                            decoration: BoxDecoration(
                              color: Colors.green.withOpacity(0.5),

                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(widget.product_category==null?'':"${widget.product_category}".toString(),
                                style: TextStyle(fontSize: 8,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),),
                            )),
                      ),
                      Positioned(
                          top: 5,
                          right: 0,
                          child:
                          lkstatus==null? IconButton(onPressed: (){
                            setState(() {
                              lkstatus='1';
                            });
                            like();
                          },
                              icon: Icon(Icons.favorite_border)):
                          widget.mylikes==null?
                          IconButton(onPressed: (){
                            lkstatus=null;
                            unlike();
                          }, icon: Icon(Icons.favorite)) :
                          IconButton(onPressed: (){
                            setState(() {
                              lkstatus=null;
                            });
                            unlike();
                          }, icon: Icon(Icons.favorite))
                      )
                      ,

                    ],
                  ),
                  Text(widget.product_name==null?'':"${widget.product_name}",
                    style: TextStyle( fontSize:14,
                      fontWeight: FontWeight.bold,color: Colors.black.withOpacity(0.7),),),
                  SizedBox(height: 8,),
                  Container(
                    width: displayWidth(context)*0.9,
                    // height: displayHeight(context)*0.10,

                    child: Container(
                        margin: EdgeInsets.only(left: 5),
                        width: displayWidth(context)*0.4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 40,
                              child: Text(
                                widget.sdescription==null?'':"${widget.sdescription}"
                                ,maxLines: 2,

                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize:12),),
                            ),
                            SizedBox(height: 10,),
                            Row(
                              children: [
                                Text(widget.likes!,style: TextStyle(fontSize: 20),),
                                SizedBox(width: 5,),

                                //  Icon(Icons.thumb_up_alt,color: Colors.blue,),
                                SizedBox(width: 20,),
                                Text(widget.recentview==null?'0':"${widget.recentview}",style: TextStyle(fontSize: 20),),
                                SizedBox(width: 5,),

                                Icon(Icons.remove_red_eye_outlined,color: Colors.blue.withOpacity(0.5),),
                                Spacer(),
                                Text(widget.time==null?'0':"${widget.time}",style: TextStyle(fontSize: 20),),
                                SizedBox(width: 5,),

                                Icon(Icons.watch_later_outlined,color: Colors.blue.withOpacity(0.5),),
                              ],
                            ),

                          ],
                        )
                    ),
                  ),
                ],
              ),
            ),
            // onHover: (event) {
            // _key.currentState.showSnackBar(SnackBar(
            // content: Text('Yaay! I am Hovered'),
            // ));
            // },
            onHover: (PointerEnterEvent event) {  },
            child: Container(
              height: MediaQuery.of(context).size.height*0.40,
              width: MediaQuery.of(context).size.width*0.40,
              // color: Colors.red,
              child:  Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height:MediaQuery.of(context).size.height*0.25,
                        width: MediaQuery.of(context).size.width,
                        child:
                        widget.product_image==null? Container():
                        ClipRRect(
                          borderRadius: BorderRadius.only
                            (topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                          child: Image.network(
                            Apiconst.productimage+"${widget.product_image}",
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Positioned(

                          child:
                          widget.discount==null?Container():
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.blue.withOpacity(0.5),
                              borderRadius: BorderRadius.only
                                (topLeft: Radius.circular(10),
                              ),
                            ),

                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Text("${widget.discount} %",style: TextStyle
                                    (color: Colors.white,
                                      fontSize: 8,
                                      fontWeight: FontWeight.bold),),
                                  Text("Discount",style: TextStyle
                                    (color: Colors.white,
                                    fontSize: 10,
                                  ),),
                                ],
                              ),
                            ),
                          )),
                      Positioned(
                        bottom: 0,
                        child:Container(
                            decoration: BoxDecoration(
                              color: Colors.green.withOpacity(0.5),

                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(widget.product_category==null?'':"${widget.product_category}".toString(),
                                style: TextStyle(fontSize: 8,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),),
                            )),
                      ),
                      Positioned(
                          top: 5,
                          right: 0,
                          child:
                          lkstatus==null? IconButton(onPressed: (){
                            setState(() {
                              lkstatus='1';
                            });
                            like();
                          },
                              icon: Icon(Icons.favorite_border)):
                          widget.mylikes==null?
                          IconButton(onPressed: (){
                            lkstatus=null;
                            unlike();
                          }, icon: Icon(Icons.favorite)) :
                          IconButton(onPressed: (){
                            setState(() {
                              lkstatus=null;
                            });
                            unlike();
                          }, icon: Icon(Icons.favorite))
                      )
                      ,

                    ],
                  ),
                  Text(widget.product_name==null?'':"${widget.product_name}",
                    style: TextStyle( fontSize:MediaQuery.of(context).size.width/38,
                      fontWeight: FontWeight.bold,color: Colors.black.withOpacity(0.7),),),
                ],
              ),


            ),
          ),
        ),
      ),
    );

  }
 var lkstatus=null;

   unlike()async {
     print("pjunlike");
     print('${widget.id}');
final id=widget.id;
     final prefs = await SharedPreferences.getInstance();
     final key = 'deviceId';
     final deviceId = prefs.getString(key) ?? "0";
     final url= Apiconst.updatelike+"product_id=$id&device_id=$deviceId&status=0";

     final unlikeapi= await http.get(Uri.parse(url));
     print(url);

     final data=jsonDecode(unlikeapi.body);
      print(data);
   }
  like() async {
    print("pjlike");
print('${widget.id}');
    final id=widget.id;
    final prefs = await SharedPreferences.getInstance();
    final key = 'deviceId';
    final deviceId = prefs.getString(key) ?? "0";
    final url= Apiconst.like+"product_id=$id&device_id=$deviceId&status=1";
    final likeapi= await http.get(Uri.parse(url));
    print(url);
    final data=jsonDecode(likeapi.body);
    print(data);
   }
  Future<bool> onLikeButtonTapped(bool isLiked) async{
    final id=widget.id;
    final prefs = await SharedPreferences.getInstance();
    final key = 'deviceId';
    final deviceId = prefs.getString(key) ?? "0";

    final url= Apiconst.like+"product_id=$id&device_id=$deviceId&status=1";
    final urls= Apiconst.updatelike+"product_id=$id&device_id=$deviceId&status=0";
    final urla=isLiked==true?urls:url;

    final likeapi= await http.get(Uri.parse(url));
    final data=jsonDecode(likeapi.body);
print(data);
    return !isLiked;
  }
}

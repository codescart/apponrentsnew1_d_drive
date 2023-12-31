import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:testt/HOME_pages/web_view/web_all_product.dart';
import 'package:testt/constants.dart';
import 'package:testt/launch.dart';
import 'package:testt/responsive.dart';
import 'package:testt/screen/deskcard.dart';
import 'package:testt/screen/featured_files.dart';
import 'package:testt/screen/mobcategories.dart';
import 'package:testt/screen/shimmmmmer/alproductshimmer.dart';
import 'package:testt/screen/shimmmmmer/categorieshimmer.dart';
import 'package:testt/screen/slide.dart';
import 'package:testt/screen/tabcart.dart';
import 'package:testt/test.dart';
import 'package:http/http.dart' as http;
import 'package:testt/screen/mobcard.dart';
import 'package:testt/HOME_pages/categories/home_categories_view.dart';
import 'package:testt/widget/sizes_helpers.dart';

class catagories_screen_list extends StatefulWidget {
 final String id;
 final String name;

 catagories_screen_list({
   required this.id, required this.name, });

  @override
  State<catagories_screen_list> createState() => _catagories_screen_listState();
}

class _catagories_screen_listState extends State<catagories_screen_list> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
  GlobalKey<RefreshIndicatorState>();

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

      body: ListView(
        children: [
          Row(
            children: [
              SizedBox(height: 40, width: 10,),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Text(widget.name!, style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold, fontSize: 19,),),
              ),
              Icon(Icons.arrow_forward_ios, size: 19,),
              SizedBox(width: 10,),
              Text('Products', style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold, fontSize: 22,),),
              Icon(Icons.arrow_forward_ios, size: 22,),
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

  mobile(BuildContext context) {
    return
      FutureBuilder<List<Allproducts>>(
          future: Allproduct(),
          builder: (context, snapshot) {
            if (snapshot.hasData) print(snapshot.error);
            return snapshot.hasData
                ? GridView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: snapshot.data!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  crossAxisSpacing: 20.0,
                  mainAxisSpacing: 20.0),
              itemBuilder: (BuildContext context, int index) {
                return
                  mobcard(
                    id: snapshot.data![index].id,
                    product_image: snapshot.data![index].product_image,
                    other_images: snapshot.data![index].other_images,
                    sdescription: snapshot.data![index].sdescription,
                    full_description: snapshot.data![index].full_description,
                    product_name: snapshot.data![index].product_name,
                    mispell_key: snapshot.data![index].mispell_key,
                    features: snapshot.data![index].features,
                    rental_price: snapshot.data![index].rental_price,
                    selling_price: snapshot.data![index].selling_price,
                    discount: snapshot.data![index].discount,
                    time: snapshot.data![index].time,
                    seo: snapshot.data![index].seo,
                    web_url: snapshot.data![index].web_url,
                    product_spiecified: snapshot.data![index]
                        .product_spiecified,
                    mobile_app: snapshot.data![index].mobile_app,
                    category: snapshot.data![index].category,
                    likes: snapshot.data![index].likes,
                    video_url: snapshot.data![index].video_url,
                    wishlists: snapshot.data![index].wishlists,
                    admin_url: snapshot.data![index].admin_url,
                    mylikes: snapshot.data![index].mylikes,
                    product_category: snapshot.data![index].product_category,
                    plan_name: snapshot.data![index].plan_name,
                    month_3: snapshot.data![index].month_3,
                    month_6: snapshot.data![index].month_6,
                    mywishlist: snapshot.data![index].mywishlist,
                    month_12: snapshot.data![index].month_12,
                    year_2: snapshot.data![index].year_2,
                    year_10: snapshot.data![index].year_10,
                    year_10price: snapshot.data![index].year_10price,
                    year_5: snapshot.data![index].year_5,
                    recentview: snapshot.data![index].recentview,
                    month_3price: snapshot.data![index].month_3price,
                    month_6price: snapshot.data![index].month_6price,
                    month_12price: snapshot.data![index].month_12,
                    year_2price: snapshot.data![index].year_2price,
                    year_5price: snapshot.data![index].year_5price
                );
              },
            ) : AllproductShimmer();
          }
      );
  }

  tablet(BuildContext context) {
    return
      FutureBuilder<List<Allproducts>>(
          future: Allproduct(),
          builder: (context, snapshot) {
            if (snapshot.hasData) print(snapshot.error);
            return snapshot.hasData
                ? GridView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: snapshot.data!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20.0,
                  mainAxisSpacing: 20.0,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (BuildContext context, int index) {
                return mobcard(
                    id: snapshot.data![index].id,
                    product_image: snapshot.data![index].product_image,
                    other_images: snapshot.data![index].other_images,
                    sdescription: snapshot.data![index].sdescription,
                    full_description: snapshot.data![index].full_description,
                    product_name: snapshot.data![index].product_name,
                    mispell_key: snapshot.data![index].mispell_key,
                    features: snapshot.data![index].features,
                    rental_price: snapshot.data![index].rental_price,
                    selling_price: snapshot.data![index].selling_price,
                    discount: snapshot.data![index].discount,
                    time: snapshot.data![index].time,
                    seo: snapshot.data![index].seo,
                    web_url: snapshot.data![index].web_url,
                    product_spiecified: snapshot.data![index]
                        .product_spiecified,
                    mobile_app: snapshot.data![index].mobile_app,
                    category: snapshot.data![index].category,
                    likes: snapshot.data![index].likes,
                    video_url: snapshot.data![index].video_url,
                    wishlists: snapshot.data![index].wishlists,
                    admin_url: snapshot.data![index].admin_url,
                    mylikes: snapshot.data![index].mylikes,
                    product_category: snapshot.data![index].product_category,
                    plan_name: snapshot.data![index].plan_name,
                    month_3: snapshot.data![index].month_3,
                    month_6: snapshot.data![index].month_6,
                    mywishlist: snapshot.data![index].mywishlist,
                    month_12: snapshot.data![index].month_12,
                    year_2: snapshot.data![index].year_2,
                    year_10: snapshot.data![index].year_10,
                    year_10price: snapshot.data![index].year_10price,
                    year_5: snapshot.data![index].year_5,
                    recentview: snapshot.data![index].recentview,
                    month_3price: snapshot.data![index].month_3price,
                    month_6price: snapshot.data![index].month_6price,
                    month_12price: snapshot.data![index].month_12,
                    year_2price: snapshot.data![index].year_2price,
                    year_5price: snapshot.data![index].year_5price
                );
              },
            ) : AllproductShimmer();
          }
      );
  }

  desk(BuildContext context) {
    return
      FutureBuilder<List<Allproducts>>(
          future: Allproduct(),
          builder: (context, snapshot) {
            if (snapshot.hasData) print(snapshot.error);
            return snapshot.hasData
                ? GridView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: snapshot.data!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 20.0,
                mainAxisSpacing: 20.0,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (BuildContext context, int index) {
                return web_all_categories(
                    id: snapshot.data![index].id,
                    product_image: snapshot.data![index].product_image,
                    other_images: snapshot.data![index].other_images,
                    sdescription: snapshot.data![index].sdescription,
                    full_description: snapshot.data![index].full_description,
                    product_name: snapshot.data![index].product_name,
                    mispell_key: snapshot.data![index].mispell_key,
                    features: snapshot.data![index].features,
                    rental_price: snapshot.data![index].rental_price,
                    selling_price: snapshot.data![index].selling_price,
                    discount: snapshot.data![index].discount,
                    time: snapshot.data![index].time,
                    seo: snapshot.data![index].seo,
                    web_url: snapshot.data![index].web_url,
                    product_spiecified: snapshot.data![index]
                        .product_spiecified,
                    mobile_app: snapshot.data![index].mobile_app,
                    category: snapshot.data![index].category,
                    likes: snapshot.data![index].likes,
                    video_url: snapshot.data![index].video_url,
                    wishlists: snapshot.data![index].wishlists,
                    admin_url: snapshot.data![index].admin_url,
                    mylikes: snapshot.data![index].mylikes,
                    product_category: snapshot.data![index].product_category,
                    plan_name: snapshot.data![index].plan_name,
                    month_3: snapshot.data![index].month_3,
                    month_6: snapshot.data![index].month_6,
                    mywishlist: snapshot.data![index].mywishlist,
                    month_12: snapshot.data![index].month_12,
                    year_2: snapshot.data![index].year_2,
                    year_10: snapshot.data![index].year_10,
                    year_10price: snapshot.data![index].year_10price,
                    year_5: snapshot.data![index].year_5,
                    recentview: snapshot.data![index].recentview,
                    month_3price: snapshot.data![index].month_3price,
                    month_6price: snapshot.data![index].month_6price,
                    month_12price: snapshot.data![index].month_12,
                    year_2price: snapshot.data![index].year_2price,
                    year_5price: snapshot.data![index].year_5price
                );
              },
            ) : AllproductShimmer();
          }
      );
  }

  Future<List<Allproducts>> Allproduct() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'deviceId';
    final deviceId = prefs.getString(key) ?? "0";
    final prefs1 = await SharedPreferences.getInstance();
    final key1 = 'categaryId';
    final categaryId = prefs1.getString(key1) ?? "0";
    print(categaryId);
    print('qqqqqqqqqqqqqqqqq');
    // final uri="";
    final cat=widget.id;
    final response = await http.get(
      Uri.parse(
          Apiconst.categarios_wise + "?device_id=$deviceId&category=$cat&count=10"),
    );
    var jsond = json.decode(response.body)["data"];
    print(response.body);
    List<Allproducts> alllround = [];
    for (var o in jsond) {
      Allproducts al = Allproducts(
        o["id"],
        o["product_image"],
        o["other_images"],
        o["category"],
        o["product_name"],
        o["sdescription"],
        o["full_description"],
        o["seo"],
        o["mispell_key"],
        o["features"],
        o["rental_price"],
        o["selling_price"],
        o["discount"],
        o["time"],
        o["product_spiecified"],
        o["admin_url"],
        o["web_url"],
        o["mobile_app"],
        o["video_url"],
        o["likes"],
        o["recentview"],
        o["wishlists"],
        o["mywishlist"],
        o["mylikes"],
        o["product_category"],
        o["plan_name"],
        o["month_3"],
        o["month_6"],
        o["month_12"],
        o["year_2"],
        o["year_5"],
        o["year_10"],
        o["month_3price"],
        o["month_6price"],
        o["month_12price"],
        o["year_2price"],
        o["year_5price"],
        o["year_10price"],

      );
      alllround.add(al);
    }
    return alllround;
  }

}
  class Allproducts {
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

  Allproducts(
  this.id,
  this.product_image,
  this.other_images,
  this.category,
  this.product_name,
  this.sdescription,
  this.full_description,
  this.seo,
  this.mispell_key,
  this.features,
  this.rental_price,
  this.selling_price,
  this.discount,
  this.time,
  this.product_spiecified,
  this.admin_url,
  this.web_url,
  this.mobile_app,
  this.video_url,
  this.likes,
  this.recentview,
  this.wishlists,
  this.mywishlist,
  this.mylikes,
  this.product_category,
  this.plan_name,
  this.month_3,
  this.month_6,
  this.month_12,
  this.year_2,
  this.year_5,
  this.year_10,
  this.month_3price,
  this.month_6price,
  this.month_12price,
  this.year_2price,
  this.year_5price,
  this.year_10price,
  );
  }




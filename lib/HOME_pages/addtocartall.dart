import 'package:flutter/material.dart';
import 'package:testt/constants.dart';
import 'package:testt/responsive.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:flutter/services.dart';

class AddToCart extends StatefulWidget {
  final String? product_image;
  final String? category;
  final String? product_name;
  final String? discount;
  final String? plan;


  AddToCart(
      {super.key,
         this.product_image,
         this.category,
         this.product_name,
         this.discount,
         this.plan}
      );

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  static const platform = MethodChannel("Sagar sandwich");
  late Razorpay _razorpay;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Wrap( //will break to another line on overflow
        direction: Axis.vertical, //use vertical to show  on vertical axis
        children: <Widget>[ //button first

          // Container(
          //     margin:EdgeInsets.all(10),
          //     child: FloatingActionButton(
          //       onPressed: (){
          //         //action code for button 2
          //       },
          //       backgroundColor: Colors.white,
          //       child: Image.asset('images/wp.gif'),
          //     )
          // ), // button second
          // button third

          // Add more buttons here
        ],),
      // appBar: HomeDrewer(),
      body: Responsive(
        mobile: mobile(context),
        tablet: tablet(context),
        desktop: desk(context),
      ),
    );
  }

  mobile(BuildContext context){

    return   SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,

          leading: IconButton(onPressed: () { Navigator.pop(context); }, icon: Icon(Icons.arrow_back,color:Colors.black),

          ),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text("Checkout",
                  style: TextStyle(fontWeight: FontWeight.w500,color:Colors.black,fontSize: 25),),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Order Details",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,),),
              ),

              Expanded(
                child: ListView.builder(

                    itemCount: 1,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.5,
                            child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      15.0),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                          15.0,),
                                      child: Image.network(
                                       Apiconst.productimage+"${widget.product_image}", fit: BoxFit.fill,
                                        width:MediaQuery.of(context).size.width,
                                        height: MediaQuery.of(context).size.height * 0.3,
                                      ),
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.only(left:8.0),
                                      child: Text("${widget.product_name}",style: TextStyle(color: Colors.redAccent,fontWeight: FontWeight.bold),),
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.only(left:8.0,top:10),
                                      child: Text("${widget.plan}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,),),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [

                                          Text("Item by App ON Rents",style:TextStyle(
                                            fontSize:MediaQuery.of(context).size.width/25,
                                          )),
                                          SizedBox(height: 20,),
                                          Row(
                                            children: [
                                              Text("Liciences :", style: TextStyle(
                                                  fontSize:MediaQuery.of(context).size.width/25,
                                                  fontWeight: FontWeight.bold),),
                                              Text("xyzz ", style: TextStyle(color: Colors.blue),),
                                              SizedBox(width: 20,),
                                              Text("Support :", style: TextStyle(
                                                  fontSize:MediaQuery.of(context).size.width/25,
                                                  fontWeight: FontWeight.bold),),
                                              Text("privacy ", style: TextStyle(color: Colors.blue),)
                                            ],
                                          )
                                        ],
                                      ),
                                    ),

                                  ],
                                )
                            ),
                          ),
                          SizedBox(height: 15,),
                          Form(child: TextFormField(
                            keyboardType: TextInputType.text,
                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),
                            maxLength: 10,
                            decoration: InputDecoration(
                              counterText: "",
                              filled: true,
                              fillColor: Colors.red.withOpacity(0.1),
                              hintText: "Have a Coupon?",
                              hintStyle: TextStyle(color: Colors.grey,fontSize: 18,fontWeight: FontWeight.bold,fontFamily: "Proxima Nova"),
                              suffixIcon: ElevatedButton.icon(
                                onPressed: (){
                                },
                                icon: Icon(
                                  Icons.check,size: 14,
                                ), label:Text('SUBMIT',style: TextStyle(color: Colors.white,fontSize: 10,fontWeight: FontWeight.bold,fontFamily: "Proxima Nova"),),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.red,
                                  onPrimary: Colors.white,
                                  shadowColor: Colors.redAccent,
                                  elevation: 3,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),

                              labelStyle: const TextStyle(fontSize: 20),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:  BorderSide(
                                  color: Colors.red.withOpacity(0.1),
                                ),
                              ),
                              focusedBorder:  OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors.red.withOpacity(0.1),
                                ),
                              ),
                            ),
                          ),
                          ),
                          SizedBox(height: 20,),

                          Container(
                            width: double.infinity,
                            color:Colors.redAccent.withOpacity(0.5),
                            child: Center(child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Order Summary",style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 20),
                              ),
                            ),)
                          ),
                          Card(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left:8.0,right: 8,top: 10,bottom: 5),
                                  child: Row(children:[
                                    Text("Sub Total : "),
                                    Spacer(),
                                    Text("${widget.plan}")
                                  ]),
                                ),

                                Padding(
                                  padding: const EdgeInsets.only(left:8.0,right: 8,top: 10,bottom: 5),
                                  child: Row(children:[
                                    Text("Discount : "),
                                    Spacer(),
                                    Text("${widget.discount}")
                                  ]),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left:8.0,right: 8,top: 10,bottom: 5),
                                  child: Row(children:[
                                    Text("Coupon & Voucher: "),
                                    Spacer(),
                                    Text("₹1.00")
                                  ]),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left:8.0,right: 8,top: 10,bottom: 5),
                                  child: Row(children:[
                                    Text("Tax: "),
                                    Spacer(),
                                    Text("₹1.00")
                                  ]),
                                ),
                                Divider(thickness: 1.5,),
                                Padding(
                                  padding: const EdgeInsets.only(left:8.0,right: 8,top: 10,bottom: 5),
                                  child: Row(children:[
                                    Text("Total payable: "),
                                    Spacer(),
                                    Text("${widget.plan}")
                                  ]),
                                ),






                              ],
                            ),
                          ),
                          SizedBox(height: 100,)
                        ],
                      );
                    }
                    ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: InkWell(
          onTap: openCheckout,
          child: Container(
            height: 50,
            color: Colors.redAccent,
            width: double.infinity,
            child: Center(child: Text("Proceed",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20),),),
          ),
        ),
      ),

    );

  }


  tablet(BuildContext context){

    return   SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,

          leading: IconButton(onPressed: () { Navigator.pop(context); }, icon: Icon(Icons.arrow_back,color:Colors.black),

          ),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text("Checkout",
                  style: TextStyle(fontWeight: FontWeight.w500,color:Colors.black,fontSize: 25),),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Order Details",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,),),
              ),

              Expanded(
                child: ListView.builder(

                    itemCount: 1,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.5,
                            child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      15.0),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                        15.0,),
                                      child: Image.asset(
                                        'images/img.png', fit: BoxFit.fill,
                                        width:MediaQuery.of(context).size.width,
                                        height: MediaQuery.of(context).size.height * 0.3,
                                      ),
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.only(left:8.0),
                                      child: Text("TEST",style: TextStyle(color: Colors.redAccent,fontWeight: FontWeight.bold),),
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.only(left:8.0,top:10),
                                      child: Text("₹1",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,),),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          TextButton(onPressed: (){},
                                              child: Text("OpenGraphiq WordPress Social Image Generator",
                                                style: TextStyle(fontSize: 15,color: Colors.blue),)),
                                          Text("Item by BoldThemes"),
                                          SizedBox(height: 20,),
                                          Row(
                                            children: [
                                              Text("Liciences :", style: TextStyle(fontSize:20,fontWeight: FontWeight.bold),),
                                              Text("xyzz ", style: TextStyle(color: Colors.blue),),
                                              SizedBox(width: 20,),
                                              Text("Support :", style: TextStyle( fontSize: 20,fontWeight: FontWeight.bold),),
                                              Text("privacy ", style: TextStyle(color: Colors.blue),)
                                            ],
                                          )
                                        ],
                                      ),
                                    ),

                                  ],
                                )
                            ),
                          ),
                          SizedBox(height: 15,),
                          Form(child: TextFormField(
                            keyboardType: TextInputType.text,
                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),
                            maxLength: 10,
                            decoration: InputDecoration(
                              counterText: "",
                              filled: true,
                              fillColor: Colors.red.withOpacity(0.1),
                              hintText: "Have a Coupon?",
                              hintStyle: TextStyle(color: Colors.grey,fontSize: 18,fontWeight: FontWeight.bold,fontFamily: "Proxima Nova"),
                              suffixIcon: ElevatedButton.icon(
                                onPressed: (){
                                },
                                icon: Icon(
                                  Icons.check,size: 14,
                                ), label:Text('SUBMIT',style: TextStyle(color: Colors.white,fontSize: 10,fontWeight: FontWeight.bold,fontFamily: "Proxima Nova"),),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.red,
                                  onPrimary: Colors.white,
                                  shadowColor: Colors.redAccent,
                                  elevation: 3,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),

                              labelStyle: const TextStyle(fontSize: 20),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:  BorderSide(
                                  color: Colors.red.withOpacity(0.1),
                                ),
                              ),
                              focusedBorder:  OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors.red.withOpacity(0.1),
                                ),
                              ),
                            ),
                          ),
                          ),
                          SizedBox(height: 20,),

                          Container(
                              width: double.infinity,
                              color:Colors.redAccent.withOpacity(0.5),
                              child: Center(child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Order Summary",style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 20),
                                ),
                              ),)
                          ),
                          Card(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left:8.0,right: 8,top: 10,bottom: 5),
                                  child: Row(children:[
                                    Text("Sub Total : "),
                                    Spacer(),
                                    Text("₹1.00")
                                  ]),
                                ),

                                Padding(
                                  padding: const EdgeInsets.only(left:8.0,right: 8,top: 10,bottom: 5),
                                  child: Row(children:[
                                    Text("Discount : "),
                                    Spacer(),
                                    Text("₹1.00")
                                  ]),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left:8.0,right: 8,top: 10,bottom: 5),
                                  child: Row(children:[
                                    Text("Coupon & Voucher: "),
                                    Spacer(),
                                    Text("₹1.00")
                                  ]),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left:8.0,right: 8,top: 10,bottom: 5),
                                  child: Row(children:[
                                    Text("Tax: "),
                                    Spacer(),
                                    Text("₹1.00")
                                  ]),
                                ),
                                Divider(thickness: 1.5,),
                                Padding(
                                  padding: const EdgeInsets.only(left:8.0,right: 8,top: 10,bottom: 5),
                                  child: Row(children:[
                                    Text("Total payable: "),
                                    Spacer(),
                                    Text("₹5.00")
                                  ]),
                                ),






                              ],
                            ),
                          ),
                          SizedBox(height: 100,)
                        ],
                      );
                    }
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: InkWell(
          onTap: openCheckout,
          child: Container(
            height: 50,
            color: Colors.redAccent,
            width: double.infinity,
            child: Center(child: Text("Proceed",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20),),),
          ),
        ),
      ),

    );

  }

  desk(BuildContext context){
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(left: 100),
              margin: EdgeInsets.all(20),
              child: Text("Shopping Cart",
                style: TextStyle(fontWeight: FontWeight.w500,fontSize: 30),),
            ),

            Container(
              // height: 20000,
              // margin: EdgeInsets.only(left: 100),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Column(
                      children: [
                        Card(
                          child: Container(
                            height: 50,
                            width: 650,
                            color:  Colors.black,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ButtonStyle(
                                    overlayColor: MaterialStateProperty.resolveWith<Color?>(
                                          (Set<MaterialState> states) {
                                        if (states.contains(MaterialState.hovered))
                                          return borderColors;
                                        else{
                                          return null;
                                        }//<-- SEE HERE
                                        // Defer to the widget's default.
                                      },
                                    ),
                                  ),
                                  child: const Text(
                                    'Continue Shopping',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ButtonStyle(
                                    overlayColor: MaterialStateProperty.resolveWith<Color?>(
                                          (Set<MaterialState> states) {
                                        if (states.contains(MaterialState.hovered))
                                          return nohovertextcolor;
                                        else{
                                          return null;
                                        }//<-- SEE HERE
                                        // Defer to the widget's default.
                                      },
                                    ),
                                  ),
                                  child: const Text(
                                    'Empty Cart',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                              ],
                            ),

                          ),
                        ),
                        Container(
                          height: 1000,
                          width: 700,
                          child: ListView.builder(
                              itemCount: 5,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  height: 150,
                                  width: 700,
                                  padding: const EdgeInsets.all(20.0),
                                  child: Card(
                                      child:  Row(
                                        children: [
                                          Row(
                                            children: [
                                              Image.asset('images/img.png',height:  100,width: 100,),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  TextButton(onPressed: (){},
                                                      child: Text("OpenGraphiq WordPress Social Image Generator",
                                                        style: TextStyle(fontSize: 15,color: Colors.blue),)),
                                                  Text("Item by BoldThemes"),
                                                  Row(
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Text("License:"),
                                                          TextButton(onPressed: (){}, child: Text("Regular License"))
                                                        ],
                                                      ),
                                                      SizedBox(width: 20,),
                                                      Row(
                                                        children: [
                                                          Text("Support: "),
                                                          TextButton(onPressed: (){}, child:  Text("12 months support"))
                                                        ],
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                              SizedBox(width: 120,),
                                              Row(
                                                children: [
                                                  Container(
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.end,
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        Icon(Icons.clear_rounded),
                                                        SizedBox(height: 20,),
                                                        Text("38",style: TextStyle(fontSize: 25),),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ],
                                      )
                                  ),
                                );
                              }),
                        ),

                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Card(
                          child: Container(
                            color: Colors.grey.withOpacity(0.2),
                            child:  Column(
                              children: [
                                Container(
                                  height: 200,
                                  width: 300,
                                  margin: EdgeInsets.all(10),
                                  child:  Column(
                                    children: [
                                      Text('Your Cart Total',style: TextStyle(fontSize: 20),),
                                      SizedBox(height: 15,),
                                      Text("US 164",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800),),
                                      Container(
                                        height: 50,
                                        margin: EdgeInsets.only(top: 20),
                                        child: ElevatedButton(onPressed: (){},
                                            style: ElevatedButton.styleFrom(
                                                primary: Colors.green,
                                                textStyle: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold)),
                                            child:  Text("Secure Checkout")),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 20),
                                        child: Text(' Price is in US dollars and excludes tax'),
                                      ),
                                      Container(

                                        child: TextButton(onPressed: (){},
                                            child:  Text("taxes and a handling fee.")),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  @override
  void initState() {
    super.initState();
    //  (UserSimplePref.getTotalPrice() ?? 1) *
    var prices = 100;
    print(prices);
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  void openCheckout() async {
    var prices = 100;
    print(prices);
    var options = {
      //  double.parse(something) *
      'key': 'rzp_live_lHpffukxVooemY',
      'amount': 100,
      'name': 'Sagar Sandwich',
      'description': "dhfjf",
      'retry': {'enabled': true, 'max_count': 1},
      'send_sms_hash': true,
      'prefill': {'contact': '', 'email': ''},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: e');
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    print('Success Response: $response');

    // postOrder(
    //   id, price, count, sizee, response.paymentId.toString(), 'upi',
    //     totalPrice.toString(), 'success', addressid, context);
    Text(response.paymentId.toString());
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print('Error Response: $response');


  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print('External SDK Response: $response');

  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:golekos/pages/buttom_bar.dart';
import 'package:golekos/services/db_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import '../theme.dart';

class BookingInfo extends StatefulWidget {
  const BookingInfo(this.product);

  final product;

  @override
  _BookingInfoState createState() => _BookingInfoState();
}

class _BookingInfoState extends State<BookingInfo> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController longStay = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);

    if (user.email != null) {
      email.text = user.email;
    }

    if (user.displayName != null) {
      name.text = user.displayName;
    } else {
      name.text = (user.email).substring(0, (user.email).indexOf("@"));
    }
    // First stack

    var ovalImages = Align(
      alignment: Alignment.topRight,
      child: Image.asset(
        'assets/images/oval.png',
        width: 117,
        height: 117,
      ),
    );

    // Second stack
    // Aktivitas pengisian detail booking

    var form = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 15,
        ),
        Row(
          children: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Icon(
                Icons.arrow_back,
                size: 24,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Container(
              width: 300,
              child: Text(
                widget.product['kost_name'] ?? 'Product name',
                style: orderMedium.copyWith(fontSize: 20, color: Colors.white),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          margin: EdgeInsets.only(left: 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Booking Information',
                style: orderMedium.copyWith(fontSize: 20, color: Colors.white),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Please fill in the following booking details',
                style: orderRegular.copyWith(fontSize: 14, color: Colors.white),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 50,
        ),
        Expanded(
          child: Container(
            child: ListView(
              children: [
                SizedBox(
                  height: 30,
                ),

                // Email input

                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Email',
                        style: orderRegular.copyWith(
                            fontSize: 14, color: Colors.black.withOpacity(0.5)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: email,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            // borderSide:
                            //     BorderSide(color: Color(0xffDCDCDC), width: 3),
                          ),
                        ),
                        maxLines: 1,
                        keyboardType: TextInputType.emailAddress,
                        style: orderRegular.copyWith(
                            fontSize: 14, color: Colors.black.withOpacity(0.5)),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),

                // Long stay input

                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'How long?',
                        style: orderRegular.copyWith(
                            fontSize: 14, color: Colors.black.withOpacity(0.5)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: longStay,
                        decoration: InputDecoration(
                          suffix: Text(
                            'Month',
                            style: orderRegular.copyWith(
                                fontSize: 14, color: Color(0xff979797)),
                          ),
                          contentPadding: EdgeInsets.all(20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            // borderSide:
                            //     BorderSide(color: Color(0xffDCDCDC), width: 3),
                          ),
                        ),
                        maxLines: 1,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        keyboardType: TextInputType.number,
                        style: orderRegular.copyWith(
                            fontSize: 14, color: Colors.black.withOpacity(0.5)),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),

                // Phone input

                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Phone',
                        style: orderRegular.copyWith(
                            fontSize: 14, color: Colors.black.withOpacity(0.5)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: phone,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            // borderSide:
                            //     BorderSide(color: Color(0xffDCDCDC), width: 3),
                          ),
                        ),
                        maxLines: 1,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        keyboardType: TextInputType.phone,
                        style: orderRegular.copyWith(
                            fontSize: 14, color: Colors.black.withOpacity(0.5)),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 20,
                ),

                // User input

                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Customer',
                        style: orderRegular.copyWith(
                            fontSize: 14, color: Colors.black.withOpacity(0.5)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: name,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            // borderSide:
                            //     BorderSide(color: Color(0xffDCDCDC), width: 3),
                          ),
                        ),
                        maxLines: 1,
                        keyboardType: TextInputType.text,
                        style: orderRegular.copyWith(
                            fontSize: 14, color: Colors.black.withOpacity(0.5)),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 35,
                ),

                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: ElevatedButton(
                    onPressed: () async {
                      var orders = {
                        'kostID': widget.product['kost_id'],
                        'userID': user.uid,
                        'customer_name': name.text,
                        'phone': phone.text,
                        'email': email.text,
                        'long_rented': longStay.text,
                        'booking_date': DateTime.now().toString(),
                        'total': widget.product['kost_price_per_month'] *
                            int.tryParse(longStay.text),
                        'paid': false,
                        'createdAt': DateTime.now().toString()
                      };

                      DatabaseServices.addOrder(orders).then((_) {
                        var route = MaterialPageRoute(builder: (_) {
                          return ButtomBar();
                        });

                        print('Success');
                        Navigator.of(context)
                            .pushAndRemoveUntil(route, (route) => false);
                      });
                    },
                    child: Text('Check out'),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xffFFC33A),
                      shadowColor: Colors.transparent,
                      padding: EdgeInsets.symmetric(vertical: 18),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      textStyle: orderMedium.copyWith(
                          fontSize: 16, color: Color(0xff414B5A)),
                    ),
                  ),
                ),

                SizedBox(
                  height: 20,
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
          ),
        ),
      ],
    );

    // MAIN

    return Scaffold(
      backgroundColor: Color(0xff0062CD),
      body: SafeArea(
          child: Stack(
        children: [
          ovalImages,
          form,
        ],
      )),
    );
  }
}

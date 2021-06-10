import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:golekos/pages/booking_info.dart';
import 'package:golekos/theme.dart';
import 'package:golekos/widgets/list_user_riview.dart';
import 'package:intl/intl.dart';

class DetailPage extends StatefulWidget {
  final name, type, imageUrl, location;
  final price;
  final bed;
  final bath;
  final kitchen;
  const DetailPage(
      {this.name,
      this.bed,
      this.bath,
      this.kitchen,
      this.location,
      this.type,
      this.price,
      this.imageUrl});
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    final currencyFormat = NumberFormat("#,##0", "en_US");

    String path;
    path = widget.imageUrl;
    return Scaffold(
      backgroundColor: Color(0xffF2F6FD),
      bottomNavigationBar: Container(
        color: Colors.white,
        height: 69,
        child: Row(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 22, vertical: 2),
                  child: Column(
                    children: [
                      Text(
                        'Rp ${currencyFormat.format(widget.price) ?? 0}',
                        style: orderMedium.copyWith(
                            fontSize: 24, color: Colors.black),
                      ),
                      Text(
                        "/month",
                        style: orderLight.copyWith(
                            fontSize: 14, color: Color(0xffA5A5A5)),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Expanded(
              child: InkWell(
                child: Container(
                  alignment: Alignment.center,
                  color: Color(0xff29D5F8),
                  child: Text(
                    "BOOKING NOW",
                    style: orderSemiBold.copyWith(
                        fontSize: 24, color: Colors.white),
                  ),
                ),
                onTap: () {
                  var route = MaterialPageRoute(builder: (_) {
                    return BookingInfo();
                  });

                  Navigator.of(context).push(route);
                },
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 360,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(path),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 30),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        icon: SvgPicture.asset(
                          'assets/svg/btn_back.svg',
                          width: 50,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                    IconButton(
                        icon: SvgPicture.asset(
                          'assets/svg/btn_love.svg',
                          width: 50,
                        ),
                        onPressed: () {
                          print("love");
                        }),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 330),
              decoration: BoxDecoration(
                color: Color(0xffF2F6FD),
                borderRadius: BorderRadius.vertical(top: Radius.circular(35)),
              ),
              child: Padding(
                padding: EdgeInsets.all(25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.name ?? "Product name",
                          style: orderSemiBold.copyWith(fontSize: 24),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                        // Text(widget.location ?? "add",
                        //     style: orderMedium.copyWith(fontSize: 14),
                        //     overflow: TextOverflow.ellipsis,
                        //     maxLines: 4),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.type,
                          style: orderLight.copyWith(
                            fontSize: 18,
                            color: Color(0xffA5A5A5),
                          ),
                        ),
                        SvgPicture.asset('assets/svg/rate.svg')
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Room Specs',
                      style: orderBold.copyWith(fontSize: 16),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 90, left: 22),
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/double-bed.png'),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 90),
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/bath.png'),
                            ),
                          ),
                        ),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image:
                                  AssetImage('assets/images/bar-counter.png'),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text(
                          ('${widget.bed} Master Bed'),
                          style: orderLight.copyWith(
                              fontSize: 14, color: Color(0xFF525252)),
                        ),
                        SizedBox(
                          width: 46,
                        ),
                        Text(
                          ('${widget.bath} Bathrooms'),
                          style: orderLight.copyWith(
                              fontSize: 14, color: Color(0xFF525252)),
                        ),
                        SizedBox(
                          width: 46,
                        ),
                        Text(
                          ('${widget.kitchen} Kitchen'),
                          style: orderLight.copyWith(
                              fontSize: 14, color: Color(0xFF525252)),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Photo",
                      style: orderBold.copyWith(fontSize: 16),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    // DISPLAY PHOTO BOARDING ROOM
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Container(
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: NetworkImage(path),
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Container(
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: NetworkImage(path),
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Container(
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: NetworkImage(path),
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Container(
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: NetworkImage(path),
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Location",
                      style: orderBold.copyWith(fontSize: 16),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: Color(0xFF868686),
                        ),
                        Text(
                          widget.location ?? "loading",
                          style: orderRegular.copyWith(
                            fontSize: 19,
                            color: Color(0xFF868686),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

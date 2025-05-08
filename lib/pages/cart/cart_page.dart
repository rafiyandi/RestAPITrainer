import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sanberapp66/config/custom/image/custom_box_image_network.dart';
import 'package:sanberapp66/config/style/app_color.dart';
import 'package:sanberapp66/controller/cart_controller.dart';

import '../../model/cart_model.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    var cartC = Get.put(CartController());

    return Scaffold(
      appBar: AppBar(
        title: Text('Keranjang'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GetBuilder(
            init: cartC,
            builder: (context) {
              return ListView.builder(
                itemCount: cartC.carts.length,
                itemBuilder: (context, index) => Container(
                  margin: EdgeInsets.only(top: 10),
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: blackColor),
                      boxShadow: [
                        BoxShadow(
                            color: blackColor.withOpacity(0.4),
                            offset: Offset(1, 2)),
                      ]),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomBoxImageNetwork(
                          width: 80,
                          height: 80,
                          urlImage: cartC.carts[index].urlImage),
                      SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            cartC.carts[index].name,
                            style: GoogleFonts.poppins(
                                fontSize: 15,
                                color: blackColor,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Rp. ${cartC.carts[index].price}',
                            style: GoogleFonts.poppins(
                                fontSize: 15,
                                color: blackColor,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              InkWell(
                                  onTap: () {
                                    cartC.decrement(index);
                                  },
                                  child: Icon(Icons.remove)),
                              SizedBox(width: 10),
                              Container(
                                padding: EdgeInsets.only(
                                    left: 10, right: 10, top: 5, bottom: 5),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                  color: blackColor.withOpacity(0.4),
                                )),
                                child: Text(
                                  '${cartC.carts[index].qty}',
                                  style: GoogleFonts.poppins(
                                      fontSize: 15,
                                      color: blackColor,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              SizedBox(width: 10),
                              InkWell(
                                  onTap: () {
                                    cartC.increment(index);
                                  },
                                  child: Icon(Icons.add)),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            }),
      ),
      bottomSheet: IntrinsicHeight(
        child: GetBuilder(
            init: cartC,
            builder: (context) {
              return Container(
                  padding: EdgeInsets.all(16),
                  width: double.infinity,
                  decoration: BoxDecoration(color: Colors.amber[500]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Total Bayar',
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            color: blackColor,
                            fontWeight: FontWeight.w600,
                          )),
                      SizedBox(height: 16),
                      Text('${cartC.totalPayment}',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: blackColor,
                            fontWeight: FontWeight.w700,
                          ))
                    ],
                  ));
            }),
      ),
    );
  }
}

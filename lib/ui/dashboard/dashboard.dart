import 'dart:convert';

import 'package:dems1/ui/dashboard/dashboard_viewmodel.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:stacked/stacked.dart';
import 'dashboard_viewmodel.dart';
import 'package:dems1/core/model/res/images.dart';




class Dashboardpage extends StatefulWidget {
  const Dashboardpage({Key? key}) : super(key: key);

  @override
  State<Dashboardpage> createState() => _DashboardpageState();
}

class _DashboardpageState extends State<Dashboardpage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  FocusNode searchFocusNode = FocusNode();
  FocusNode textFieldFocusNode = FocusNode();
  SingleValueDropDownController? _cnt;

  @override
  void initState() {
    _cnt = SingleValueDropDownController();
    super.initState();
  }

  final List<String> items = [
    '25 Pending',
    '2 Pending',
    '3 Pending',
    '4 Pending',
  ];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color(C6EE3),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 350,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/img/back.png"),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topCenter,
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 50, left: 16),
                      child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Image.asset("assets/img/dp.png")),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 50, left: 100),
                      child: Text("TRIPWISE",
                          style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.w700,
                              color: Colors.white)),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 50, left: 100),
                      child:
                          Icon(Icons.notifications_none, color: Colors.white),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(top: 130, left: 16),
                child: Text("Hello !",
                    style: TextStyle(color: Colors.white, fontSize: 16)),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(top: 170, left: 16),
                child: Text("Arun Kumar",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.w700)),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(top: 230, left: 16),
                child: Text("Overview",
                    style: TextStyle(color: Colors.white, fontSize: 16)),
              ),
              Container(
                padding: EdgeInsets.only(top: 270, left: 16, right: 16),
                child: Card(
                  //color: Colors.black,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                              left: 16,
                              right: 70,
                              top: 10,
                              bottom: 10,
                            ),
                            child: Text("Annual expenses",
                                style: TextStyle(fontWeight: FontWeight.w600)),
                          ),
                          Container(
                            height: 50,
                            width: 120,
                            padding: EdgeInsets.only(top: 10, bottom: 10),
                            child: Form(
                              key: _formKey,
                              child: DropDownTextField(

                                textFieldDecoration: InputDecoration(
                                    labelText: "Annual",
                                    labelStyle: TextStyle(fontSize: 12),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                controller: _cnt,
                                clearOption: true,
                                searchDecoration: InputDecoration(
                                    ),
                                validator: (value) {
                                  if (value == null) {
                                    return "Required field";
                                  } else {
                                    return null;
                                  }
                                },
                                dropDownItemCount: 6,
                                textStyle: TextStyle(fontSize: 13),
                                dropDownList: const [
                                  DropDownValueModel(
                                      name: 'name1', value: "value1"),
                                  DropDownValueModel(
                                      name: 'name2',
                                      value: "value2",
                                      toolTipMsg:
                                          "DropDownButton is a widget that we can use to select one unique value from a set of values"),
                                  DropDownValueModel(
                                      name: 'name3', value: "value3"),
                                  DropDownValueModel(
                                      name: 'name4',
                                      value: "value4",
                                      toolTipMsg:
                                          "DropDownButton is a widget that we can use to select one unique value from a set of values"),
                                  DropDownValueModel(
                                      name: 'name5', value: "value5"),
                                  DropDownValueModel(
                                      name: 'name6', value: "value6"),
                                  DropDownValueModel(
                                      name: 'name7', value: "value7"),
                                  DropDownValueModel(
                                      name: 'name8', value: "value8"),
                                ],
                                onChanged: (val) {},
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                                top: 20, right: 20, left: 5, bottom: 20),
                            child: Image.asset("assets/img/circle.png"),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 20, bottom: 20),
                            child: Image.asset("assets/img/row.png"),
                          ),
                        ],
                      ),
                    ],
                  ),
                  //
                ),
              ),
            ]),
            ///CARD STARTING
            Row(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 16, top: 16),
                  child: Text("Trips"),
                ),
                Container(
                  padding: EdgeInsets.only(top: 16, left: 250),
                  child: Icon(Icons.add_circle_outline,
                      size: 15, color: Colors.blue),
                ),
                Container(
                  padding: EdgeInsets.only(top: 16, left: 5),
                  child: InkWell(
                    onTap: () => null,
                    child: Text("New Trip",
                        style: TextStyle(color: Colors.blue, fontSize: 14)),
                  ),
                )
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                      height: 160,
                      width: 152,
                      child: Card(
                          child: Column(
                        children: [
                          Stack(
                            children: [
                              Image.asset(
                                Images.tripwise,
                                 //"assets/img/purple.png",
                                // height: 152,
                                // width: 152,
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 35, left: 25),
                                child: Text("25",
                                    style: TextStyle(
                                        fontSize: 34,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white)),
                              ),
                              Container(
                                  padding: EdgeInsets.only(top: 85, left: 25),
                                  child: Text("Trips",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white))),
                              Container(
                                  padding: EdgeInsets.only(top: 100, left: 25),
                                  child: Text("Completed",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white))),
                            ],
                          ),
                        ],
                      ))),
                  Container(
                      height: 160,
                      width: 152,
                      child: Card(
                          child: Column(
                        children: [
                          Stack(
                            children: [
                              Image.asset(
                                Images.tripwise1,
                                height: 152,
                                width: 152,
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 35, left: 25),
                                child: Text("2",
                                    style: TextStyle(
                                        fontSize: 34,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white)),
                              ),
                              Container(
                                  padding: EdgeInsets.only(top: 85, left: 25),
                                  child: Text("Trips",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white))),
                              Container(
                                  padding: EdgeInsets.only(top: 100, left: 25),
                                  child: Text("Pending",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white))),
                            ],
                          ),
                        ],
                      ))),
                  Container(
                      child: Card(
                          child: Column(
                    children: [
                      Stack(
                        children: [
                          Image.asset(
                            Images.tripwise2
                          ),

                          Container(
                            padding: EdgeInsets.only(top: 35, left: 25),
                            child: Text("3",
                                style: TextStyle(
                                    fontSize: 34,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white)),
                          ),
                          Container(
                              padding: EdgeInsets.only(top: 85, left: 25),
                              child: Text("Trips",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white))),
                          Container(
                              padding: EdgeInsets.only(top: 100, left: 25),
                              child: Text("Approved",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white))),
                        ],
                      ),
                    ],
                  ))),
                  Container(
                      child: Card(
                          child: Column(
                    children: [
                      Stack(
                        children: [
                          Image.asset(
                            Images.tripwise3
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 35, left: 25),
                            child: Text("25",
                                style: TextStyle(
                                    fontSize: 34,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white)),
                          ),
                          Container(
                              padding: EdgeInsets.only(top: 85, left: 25),
                              child: Text("Trips",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white))),
                          Container(
                              padding: EdgeInsets.only(top: 100, left: 25),
                              child: Text("Cancelled",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white))),
                        ],
                      ),
                    ],
                  ))),
                ],
              ),
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 16, top: 16),
                  child: Text("Claim"),
                ),
                Container(
                  padding: EdgeInsets.only(top: 16, left: 250),
                  child: Icon(Icons.add_circle_outline,
                      size: 15, color: Colors.blue),
                ),
                Container(
                  padding: EdgeInsets.only(top: 16, left: 2),
                  child: InkWell(
                    onTap: () => null,
                    child: Text("New Claim",
                        style: TextStyle(color: Colors.blue, fontSize: 14)),
                  ),
                ),
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                      child: Card(
                          child: Column(
                    children: [
                      Stack(
                        children: [
                          Image.asset(
                            Images.tripwise3,
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 35, left: 25),
                            child: Text("4",
                                style: TextStyle(
                                    fontSize: 34,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white)),
                          ),
                          Container(
                              padding: EdgeInsets.only(top: 85, left: 25),
                              child: Text("Claims",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white))),
                          Container(
                              padding: EdgeInsets.only(top: 100, left: 25),
                              child: Text("Pending",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white))),
                        ],
                      ),
                    ],
                  ))),
                  Container(
                      child: Card(
                          child: Column(
                    children: [
                      Stack(
                        children: [
                          Image.asset(
                            Images.tripwise4,
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 35, left: 25),
                            child: Text("25",
                                style: TextStyle(
                                    fontSize: 34,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white)),
                          ),
                          Container(
                              padding: EdgeInsets.only(top: 85, left: 25),
                              child: Text("Trips",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white))),
                          Container(
                              padding: EdgeInsets.only(top: 100, left: 25),
                              child: Text("Claimed",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white))),
                        ],
                      ),
                    ],
                  ))),
                  Container(
                      child: Card(
                    child: Stack(
                      children: [
                        Image.asset(
                         Images.tripwise5
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 35, left: 25),
                          child: Text("2",
                              style: TextStyle(
                                  fontSize: 34,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white)),
                        ),
                        Container(
                            padding: EdgeInsets.only(top: 85, left: 25),
                            child: Text("Claims",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white))),
                        Container(
                            padding: EdgeInsets.only(top: 100, left: 25),
                            child: Text("Approved",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white))),
                      ],
                    ),
                  )),
                  Container(
                      child: Card(
                          child: Column(
                    children: [
                      Stack(
                        children: [
                          Image.asset(
                            Images.tripwise,
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 35, left: 25),
                            child: Text("25",
                                style: TextStyle(
                                    fontSize: 34,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white)),
                          ),
                          Container(
                              padding: EdgeInsets.only(top: 85, left: 25),
                              child: Text("Claims",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white))),
                          Container(
                              padding: EdgeInsets.only(top: 100, left: 25),
                              child: Text("Rejected",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white))),
                        ],
                      ),
                    ],
                  ))),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(top: 16, left: 16),
              child: Text("Upcoming Trip",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
            ),
            Container(
              height: 225,
              width: 360,
              padding: EdgeInsets.only(top: 16),
              child: Card(
                elevation: 5,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(7),
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                padding: EdgeInsets.only(left: 15),
                                height: 40,
                                width: 60,
                                child: Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(top: 5),
                                      child: Image.asset(
                                        Images.bags,
                                        height: 32,
                                        width: 32,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )),
                        Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                padding: EdgeInsets.only(top: 5, right: 100),
                                child: Text(
                                  'TRIP-12345',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.only(top: 2, right: 138),
                              child: Text(
                                'Local',
                                style: TextStyle(
                                    fontSize: 14, color: Color(0xff949494)),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.only(right: 16),
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: 77,
                              height: 20,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.blue.shade100,
                              ),
                              child: Center(
                                  child: Text(
                                'Approved',
                                style: TextStyle(
                                    color: Color(0xff0370F2), fontSize: 12),
                              )),
                            ),
                          ),
                        )
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 25),
                      child: Row(
                        children: [
                          Container(
                            child: Text("Chennai",
                                style: TextStyle(color: Colors.blue)),
                          ),
                          SizedBox(
                            width: 10.67,
                          ),
                          Container(
                              child: Icon(
                            Icons.sync_alt,
                            size: 18,
                            color: Color(0xff242424),
                          )),
                          SizedBox(
                            width: 10.67,
                          ),
                          Container(
                            child: Text("Coimbatore",
                                style: TextStyle(color: Colors.blue)),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(left: 25, top: 11),
                          child: Text("Thu, 22 Nov - Sun Nov",
                              style: TextStyle(
                                color: Color(0xff949494),
                              )),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10, top: 11),
                          child: Text("23h 59min left",
                              style: TextStyle(
                                  color: Color(0xffEA4335), fontSize: 12)),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 20,
                        left: 20,
                      ),
                      child: Divider(
                        color: Colors.grey,
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        children: [
                          Container(
                              alignment: Alignment.centerLeft,
                              padding:
                                  EdgeInsets.only(top: 5, bottom: 10, left: 28),
                              child: Text(
                                "Outstatiton customer store visit",
                                style: TextStyle(fontSize: 12),
                              )),
                          Container(
                            height: 32,
                            width: 296,
                            padding: EdgeInsets.only(),

                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xff34A853),
                                elevation: 3, //elevation of button
                                //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5) //to set border radius to button
                              ),
                              onPressed: () => null,
                              child: Text("Start Trip",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  )),
                            ),

                            // child: ElevatedButton(
                            //   onPressed: () {},
                            //   style: ElevatedButton.styleFrom(
                            //     padding: EdgeInsets.symmetric(
                            //         horizontal: 40.0, vertical: 20.0),
                            //     //primary: Color(0xff34A853),
                            //     shape: StadiumBorder(),
                            //   ),
                            //   child: Text(
                            //     "Start Trip",
                            //     style: TextStyle(color: Colors.black, fontSize: 15),
                            //   ),
                            // ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(top: 16, left: 16),
                  child: Text("Trip Approvals",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                ),
                // Container(
                //   height: 45,
                //   width: 142,
                //   padding: EdgeInsets.only(top: 10, bottom: 10),
                //   child: Form(
                //     key: _formKey,
                //     child: DropDownTextField(
                //       textFieldDecoration: InputDecoration(
                //           labelText: "Approval Pending",
                //           labelStyle: TextStyle(fontSize: 10,color: Color(0xff949494)),
                //           enabledBorder: OutlineInputBorder(
                //               borderRadius: BorderRadius.circular(10))),
                //       controller: _cnt,
                //       clearOption: true,
                //       searchDecoration: InputDecoration(
                //           hintText: "enter your custom hint text here"),
                //       validator: (value) {
                //         if (value == null) {
                //           return "Required field";
                //         } else {
                //           return null;
                //         }
                //       },
                //       dropDownItemCount: 6,
                //       dropDownList: const [
                //         DropDownValueModel(
                //             name: 'name1', value: "value1"),
                //         DropDownValueModel(
                //             name: 'name2',
                //             value: "value2",
                //             toolTipMsg:
                //             "DropDownButton is a widget that we can use to select one unique value from a set of values"),
                //         DropDownValueModel(
                //             name: 'name3', value: "value3"),
                //         DropDownValueModel(
                //             name: 'name4',
                //             value: "value4",
                //             toolTipMsg:
                //             "DropDownButton is a widget that we can use to select one unique value from a set of values"),
                //         DropDownValueModel(
                //             name: 'name5', value: "value5"),
                //         DropDownValueModel(
                //             name: 'name6', value: "value6"),
                //         DropDownValueModel(
                //             name: 'name7', value: "value7"),
                //         DropDownValueModel(
                //             name: 'name8', value: "value8"),
                //       ],
                //       onChanged: (val) {},
                //     ),
                //   ),
                // )
                Container(
                  padding: EdgeInsets.only(left: 110, top: 16),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      isExpanded: true,
                      hint: Row(
                        children: [
                          SizedBox(
                            width: 4,
                          ),
                          Expanded(
                            child: Text(
                              'Approval Pending',
                              style: TextStyle(
                                fontSize: 9,
                                fontWeight: FontWeight.bold,
                                color: Color(0xffD5D5D5),
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      items: items
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xffD5D5D5),
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ))
                          .toList(),
                      value: selectedValue,
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value as String;
                        });
                      },
                      buttonStyleData: ButtonStyleData(
                        height: 25,
                        width: 120,
                        padding: const EdgeInsets.only(left: 2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Color(0xffD5D5D5),
                          ),
                          color: Color(0xffFFFFFF),
                        ),
                      ),
                      // iconStyleData: const IconStyleData(
                      //   icon: Icon(
                      //     Icons.arrow_drop_down_outlined,
                      //   ),
                      //   iconSize: 14,
                      //   iconEnabledColor: Color(0xff949494),
                      //   iconDisabledColor: Colors.grey,
                      // ),
                      // dropdownStyleData: DropdownStyleData(
                      //   maxHeight: 200,
                      //   width: 200,
                      //   padding: null,
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(14),
                      //     //color: Colors.redAccent,
                      //   ),
                      //
                      //   ),
                    ),
                    //menuItemStyleData: const MenuItemStyleData(
                    //height: 40,
                    //padding: EdgeInsets.only(left: 14, right: 14),
                  ),
                ),
              ],
            ),
            Container(
              height: 190,
              width: 360,
              padding: EdgeInsets.only(top: 16),
              child: Card(
                // elevation: 2,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(7),
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                padding: EdgeInsets.only(left: 15),
                                height: 40,
                                width: 60,
                                child: Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(top: 5),
                                      child: Image.asset(
                                        Images.bag,
                                        height: 32,
                                        width: 32,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )),
                        Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Stack(children: [
                                Container(
                                  padding: EdgeInsets.only(top: 16, right: 200),
                                  child: Text(
                                    'Arun Kumar C',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 185, top: 16),
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      width: 77,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: Colors.blue.shade100,
                                      ),
                                      child: Center(
                                          child: Text(
                                        'Approved',
                                        style: TextStyle(
                                            color: Color(0xff0370F2),
                                            fontSize: 12),
                                      )),
                                    ),
                                  ),
                                )
                              ]),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.only(top: 2, right: 175),
                              child: Text(
                                'TRIP-12345 · Local',
                                style: TextStyle(
                                    fontSize: 12, color: Color(0xff949494)),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 25, top: 12),
                      child: Row(
                        children: [
                          Container(
                            child: Text("Chennai",
                                style: TextStyle(color: Colors.blue)),
                          ),
                          SizedBox(
                            width: 10.67,
                          ),
                          Container(
                              child: Icon(
                            Icons.sync_alt,
                            size: 18,
                            color: Color(0xff242424),
                          )),
                          SizedBox(
                            width: 10.67,
                          ),
                          Container(
                            child: Text("Coimbatore",
                                style: TextStyle(color: Colors.blue)),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(left: 25, top: 11),
                          child: Text("Thu, 22 Nov - Sun Nov",
                              style: TextStyle(
                                color: Color(0xff949494),
                              )),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 20,
                        left: 20,
                      ),
                      child: Divider(
                        color: Colors.grey,
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        children: [
                          Container(
                              alignment: Alignment.centerLeft,
                              padding:
                                  EdgeInsets.only(top: 5, bottom: 10, left: 28),
                              child: Text(
                                "Local customer store visit",
                                style: TextStyle(fontSize: 12),
                              )),

                          // child: ElevatedButton(
                          //   onPressed: () {},
                          //   style: ElevatedButton.styleFrom(
                          //     padding: EdgeInsets.symmetric(
                          //         horizontal: 40.0, vertical: 20.0),
                          //     //primary: Color(0xff34A853),
                          //     shape: StadiumBorder(),
                          //   ),
                          //   child: Text(
                          //     "Start Trip",
                          //     style: TextStyle(color: Colors.black, fontSize: 15),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 190,
              width: 360,
              padding: EdgeInsets.only(top: 16),
              child: Card(
                elevation: 5,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(7),
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                padding: EdgeInsets.only(left: 15),
                                height: 40,
                                width: 60,
                                child: Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(top: 5),
                                      child: Image.asset(
                                        Images.bag,
                                        height: 32,
                                        width: 32,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )),
                        Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Stack(children: [
                                Container(
                                  padding: EdgeInsets.only(top: 16, right: 200),
                                  child: Text(
                                    'Arun Kumar C',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 182, top: 16),
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      width: 77,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: Colors.blue.shade100,
                                      ),
                                      child: Center(
                                          child: Text(
                                        'Approved',
                                        style: TextStyle(
                                            color: Color(0xff0370F2),
                                            fontSize: 12),
                                      )),
                                    ),
                                  ),
                                )
                              ]),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.only(top: 2, right: 148),
                              child: Text(
                                'TRIP-12345 · Outstation',
                                style: TextStyle(
                                    fontSize: 12, color: Color(0xff949494)),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 25, top: 12),
                      child: Row(
                        children: [
                          Container(
                            child: Text("Chennai",
                                style: TextStyle(color: Colors.blue)),
                          ),
                          SizedBox(
                            width: 10.67,
                          ),
                          Container(
                              child: Icon(
                            Icons.sync_alt,
                            size: 18,
                            color: Color(0xff242424),
                          )),
                          SizedBox(
                            width: 10.67,
                          ),
                          Container(
                            child: Text("Coimbatore",
                                style: TextStyle(color: Colors.blue)),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(left: 25, top: 11),
                          child: Text("Thu, 22 Nov - Sun Nov",
                              style: TextStyle(
                                color: Color(0xff949494),
                              )),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 20,
                        left: 20,
                      ),
                      child: Divider(
                        color: Colors.grey,
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        children: [
                          Container(
                              alignment: Alignment.centerLeft,
                              padding:
                                  EdgeInsets.only(top: 5, bottom: 10, left: 28),
                              child: Text(
                                "Local customer store visit",
                                style: TextStyle(fontSize: 12),
                              )),
                          // child: ElevatedButton(
                          //   onPressed: () {},
                          //   style: ElevatedButton.styleFrom(
                          //     padding: EdgeInsets.symmetric(
                          //         horizontal: 40.0, vertical: 20.0),
                          //     //primary: Color(0xff34A853),
                          //     shape: StadiumBorder(),
                          //   ),
                          //   child: Text(
                          //     "Start Trip",
                          //     style: TextStyle(color: Colors.black, fontSize: 15),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
    ),
    Container(
        padding: EdgeInsets.only(top: 50),
        child: Image.asset(
          Images.bottom,
          width: 550,
          fit: BoxFit.cover,
        )),



    ]
    ),
      )
    );
            //
   //
   //
   // // @override
   // //  DashViewModel viewModelBuilder(BuildContext context) => DashViewModel();
   // //
   // //  Widget getOverViewWidget(BuildContext context, DashViewModel viewModel) {
   // //  final GlobalKey<AnimatedCircularChartState> _chartKey =
   // //  new GlobalKey<AnimatedCircularChartState>();
   // //  return Container(
   // //  width: deviceWidth(context),
   // //  padding: EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 20),
   // //  child: Column(
   // //  crossAxisAlignment: CrossAxisAlignment.start,
   // //  children: [
   // //  Row(
   // //  children: [
   // //  Text(
   // //  "Travel Claim Summary",
   // //  style: AppTextStyle.sp16.copyWith(
   // //  fontWeight: FontWeight.w600, color: AppColor.primaryText),
   // //  ),
   // //  Spacer(),
   // //  Container(
   // //  child: InkWell(
   // //  onTap: () {},
   // //  child: Container(
   // //  height: 30,
   // //  decoration: BoxDecoration(
   // //  borderRadius: BorderRadius.circular(8),
   // //  border: Border.all(
   // //  color: AppColor.grey_shade2, width: 1),
   // //  ),
   // //  child: InkWell(
   // //  onTap: () {
   // //  viewModel.showExpenseBottomSheet();
   // //  },
   // //  child: Row(
   // //  children: [
   // //  HorizontalSpacing.custom(value: 10),
   // //  Text(
   // //  viewModel.expenseType,
   // //  style: AppTextStyle.sp12.copyWith(
   // //  fontWeight: FontWeight.w600,
   // //  color: AppColor.grey_shade1),
   // //  ),
   // //  HorizontalSpacing.custom(value: 13),
   // //  SvgPicture.asset(Images.down_arrow),
   // //  HorizontalSpacing.custom(value: 8),
   // //  ],
   // //  ),
   // //  ),
   // //  )))
   // //  ],
   // //  ),
   // //  Container(
   // //  margin: EdgeInsets.only(top: 28),
   // //  child: Row(
   // //  mainAxisAlignment: MainAxisAlignment.start,
   // //  children: [
   // //  Container(
   // //  height: 100,
   // //  width: 100,
   // //  margin: EdgeInsets.only(left: 6),
   // //  child: AnimatedCircularChart(
   // //  key: _chartKey,
   // //  size: Size(150, 150),
   // //  holeRadius: 40,
   // //  initialChartData: <CircularStackEntry>[
   // //  !(viewModel.farePercent == 0.0 &&
   // //  viewModel.lodgingPercent == 0.0 &&
   // //  viewModel.boardingPercent == 0.0 &&
   // //  viewModel.otherPercent == 0.0)
   // //  ? new CircularStackEntry(
   // //  <CircularSegmentEntry>[
   // //  new CircularSegmentEntry(
   // //  viewModel.farePercent!,
   // //  AppColor.indicator1,
   // //  rankKey: 'completed',
   // //  ),
   // //  new CircularSegmentEntry(
   // //  viewModel.lodgingPercent!,
   // //  AppColor.indicator2,
   // //  rankKey: 'remaining',
   // //  ),
   // //  new CircularSegmentEntry(
   // //  viewModel.boardingPercent!,
   // //  AppColor.indicator3,
   // //  rankKey: 'remaining',
   // //  ),
   // //  new CircularSegmentEntry(
   // //  viewModel.otherPercent!,
   // //  AppColor.indicator4,
   // //  rankKey: 'remaining',
   // //  ),
   // //  ],
   // //  rankKey: 'progress',
   // //  )
   // //      : new CircularStackEntry(
   // //  <CircularSegmentEntry>[
   // //  new CircularSegmentEntry(
   // //  100,
   // //  AppColor.grey_shade1,
   // //  rankKey: 'completed',
   // //  ),
   // //  ],
   // //  rankKey: 'progress',
   // //  ),
   // //  ],
   // //  chartType: CircularChartType.Radial,
   // //  edgeStyle: SegmentEdgeStyle.round,
   // //  percentageValues: true,
   // //  holeLabel: '₹' + viewModel.total.toString() == "null"
   // //  ? "₹ 0"
   // //      : viewModel.moneyFormat(
   // //  viewModel.display_total.toString()),
   // //
   // //  //    subholeLabel: 'Total'
   // //  ),
   // //  ),
   // //  HorizontalSpacing.custom(value: 24),
   // //  Expanded(
   // //  child: Container(
   // //  margin: EdgeInsets.only(top: 6),
   // //  child: Column(
   // //  crossAxisAlignment: CrossAxisAlignment.start,
   // //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
   // //  children: [
   // //  getExpenseData(
   // //  'Fare',
   // //  viewModel.fare.toString() == "null"
   // //  ? "0"
   // //      : viewModel
   // //      .moneyFormat(viewModel.display_fare!),
   // //  // : NumberFormat.currency(locale: 'HI',symbol: '₹ ',decimalDigits: 0).format(double.parse(viewModel.fare!)*100),
   // //  AppColor.indicator1),
   // //  VerticalSpacing.custom(value: 9),
   // //  getExpenseData(
   // //  'Lodging ',
   // //  viewModel.lodging.toString() == "null"
   // //  ? "0"
   // //      : viewModel.moneyFormat(
   // //  viewModel.display_lodging.toString()),
   // //  AppColor.indicator2),
   // //  VerticalSpacing.custom(value: 9),
   // //  getExpenseData(
   // //  'Boarding ',
   // //  viewModel.boarding.toString() == "null"
   // //  ? "0"
   // //      : viewModel.moneyFormat(
   // //  viewModel.display_boarding.toString()),
   // //  AppColor.indicator3),
   // //  VerticalSpacing.custom(value: 9),
   // //  getExpenseData(
   // //  'Others',
   // //  viewModel.others.toString() == "null"
   // //  ? "0"
   // //      : viewModel.moneyFormat(
   // //  viewModel.display_others.toString()),
   // //  AppColor.indicator4),
   // //  VerticalSpacing.custom(value: 9),
   // //  ],
   // //  ),
   // //  ),
   // //  )
   // //  ],
   // //  ),
   // //  )
   // //  ],
   // //  ));
   // //  }

  }
}

// @override
// class DashPage <T extends ViewModelBuilderWidget> {
//   @override
//   Widget builder(BuildContext context, DashViewModel viewModel, Widget? child) {
//     return Scaffold();
//     // TODO: implement builder
//     throw UnimplementedError();
//   }
//
//   @override
//   DashViewModel viewModelBuilder(BuildContext context) {
//     // TODO: implement viewModelBuilder
//     throw UnimplementedError();
//   }
// }



// Widget getCard(String title, String count, String bg, DashViewModel viewModel,
//     String? status,int type) {
//   return InkWell(
//     onTap: (){
//       viewModel.navigateToTripList(
//           status![0].toUpperCase() + status.substring(1),type);
//     },
//     child: Stack(
//       children: [
//         GestureDetector(
//           onTap: () {
//
//
//             viewModel.navigateToTripList(
//                 status![0].toUpperCase() + status.substring(1),type);
//           },
//           child: Container(
//             height: 132,
//             width: 132,
//             margin: EdgeInsets.only(right: 12),
//             child: Image.asset("assets/img/purple.png"),
//           ),
//         ),
//         Container(
//           height: 132,
//           width: 132,
//           padding: EdgeInsets.all(12),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 count == "null" ? "--" : count,
//                 style: AppTextStyle.sp34.copyWith(
//                     fontWeight: FontWeight.w700, ),
//               ),
//               Flexible(
//                 child: Text(
//                   title,
//                   style: AppTextStyle.sp14.copyWith(
//                       fontWeight: FontWeight.w700, ),
//                 ),
//               ),
//             ],
//           ),
//         )
//       ],
//     ),
//   );
// }

// class AppColor {
// }
//
// class AppTextStyle {
//   static var sp34;
//
//   static var sp14;
// }



// class DashPage extends ViewModelWidget<DashViewModel> {
//   @override
//   Widget builder(BuildContext context, DashViewModel viewModel) {
//     // TODO: implement build
//     throw UnimplementedError();
//   }
//
//   @override
//   Widget build(BuildContext context, DashViewModel viewModel) {
//     // TODO: implement build
//     throw UnimplementedError();
//   }
//
// }




  Widget getCard(String title, String count, String bg, DashViewModel viewModel,
      String? status,int type) {
    return InkWell(
      onTap: (){
        viewModel.navigateToTripList(
            status![0].toUpperCase() + status.substring(1),type);
      },
      child: Container(
          height: 160,
          width: 152,
          child: Card(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Image.asset(
                        Images.tripwise1,
                        height: 152,
                        width: 152,
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 35, left: 25),
                        child: Text( "2",
                            style: TextStyle(
                                fontSize: 34,
                                fontWeight: FontWeight.w700,
                                color: Colors.white)),
                      ),
                     Container(
                          padding: EdgeInsets.only(top: 85, left: 25),
                          child: Text("Trips",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white))),
                      Container(
                          padding: EdgeInsets.only(top: 100, left: 25),
                          child: Text("Pending",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white))),
                    ],
                  ),
                ],
              ))),

    );
}
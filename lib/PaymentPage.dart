import 'package:babycry/AppBar.dart';
import 'package:babycry/util/StringUtils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'Dashboard.dart';

class Payment extends StatefulWidget {
  final String name;
  final String price;
  Payment({required this.price, required this.name});
  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  late int selectedRadioTile;

  @override
  void initState() {
    super.initState();
    selectedRadioTile = 0;
  }

  setSelectedRadioTile(int val) {
    setState(() {
      selectedRadioTile = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(48.0),
          // here the desired height
          child: MyAppBar().getAppBar(
            context: context,
          )),
      bottomNavigationBar: Container(
        height: 50.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: MaterialButton(
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Dashboard()));
          },
          color: Colors.pink[200],
          child: Text(
            StringUtils.payNow,
            style: const TextStyle(color: Colors.white, fontSize: 20.0),
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 0,
                          child: Icon(
                            Icons.attachment,
                            color: Colors.pink[200],
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(StringUtils.tenPercentInstantOff),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 0,
                          child: Icon(
                            Icons.attachment,
                            color: Colors.pink[200],
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(StringUtils.fivePercentInstantOff),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                      child: Text(
                    StringUtils.viewAllOffers,
                    style: TextStyle(
                        color: Colors.pink[200], fontWeight: FontWeight.bold),
                  )),
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Column(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(right: 10.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: RadioListTile(
                                value: 1,
                                groupValue: selectedRadioTile,
                                title: Text(StringUtils.hdfcBank),
                                onChanged: (val) {
                                  if (kDebugMode) {
                                    print("Radio Tile pressed $val");
                                  }
                                  setSelectedRadioTile(val!);
                                },
                                activeColor: Colors.pink[200],
                              ),
                            ),
                            Text(
                              StringUtils.hdfc,
                              style: const TextStyle(
                                  color: Color(0xff0000A0),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            )
                          ],
                        ),
                        selectedRadioTile == 1
                            ? Padding(
                                padding: const EdgeInsets.only(
                                    left: 70.0, bottom: 20.0),
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        height: 40.0,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey.shade300),
                                            borderRadius:
                                                BorderRadius.circular(6.0)),
                                        child: const TextField(
                                          obscureText: true,
                                          decoration: InputDecoration(
                                            suffixText: "CVV  ",
                                            enabledBorder:
                                                UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color:
                                                      Colors.transparent),
                                            ),
                                            focusedBorder:
                                                UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color:
                                                      Colors.transparent),
                                            ),
                                          ),
                                          keyboardType: TextInputType.phone,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                        flex: 1,
                                        child: GestureDetector(
                                            onTap: () {},
                                            child: Text(
                                                StringUtils.whatIsCv,
                                                style: const TextStyle(
                                                    color: Colors
                                                        .blueAccent)))),
                                  ],
                                ),
                              )
                            : Container(),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(right: 10.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: RadioListTile(
                                value: 6,
                                groupValue: selectedRadioTile,
                                title: Text(StringUtils.icicBank),
                                onChanged: (val) {
                                  if (kDebugMode) {
                                    print("Radio Tile pressed $val");
                                  }
                                  setSelectedRadioTile(val!);
                                },
                                activeColor: Colors.pink[200],
                              ),
                            ),
                            Text(
                              StringUtils.icici,
                              style: TextStyle(
                                  color: Colors.pink[200],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            )
                          ],
                        ),
                        selectedRadioTile == 6
                            ? Padding(
                                padding: const EdgeInsets.only(
                                    left: 70.0, bottom: 20.0),
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        height: 40.0,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey.shade300),
                                            borderRadius:
                                                BorderRadius.circular(6.0)),
                                        child: const TextField(
                                          obscureText: true,
                                          decoration: InputDecoration(
                                            suffixText: "CVV  ",
                                            enabledBorder:
                                                UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color:
                                                      Colors.transparent),
                                            ),
                                            focusedBorder:
                                                UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color:
                                                      Colors.transparent),
                                            ),
                                          ),
                                          keyboardType: TextInputType.phone,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                        flex: 1,
                                        child: GestureDetector(
                                            onTap: () {},
                                            child: Text(
                                                StringUtils.whatIsCv,
                                                style: const TextStyle(
                                                    color: Colors
                                                        .blueAccent)))),
                                  ],
                                ),
                              )
                            : Container(),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: RadioListTile(
                      value: 2,
                      groupValue: selectedRadioTile,
                      title: Text(StringUtils.upi),
                      onChanged: (val) {
                        if (kDebugMode) {
                          print("Radio Tile pressed $val");
                        }
                        setSelectedRadioTile(val!);
                      },
                      activeColor: Colors.pink[200],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: RadioListTile(
                      value: 3,
                      groupValue: selectedRadioTile,
                      title: Text(StringUtils.paytm),
                      onChanged: (val) {
                        if (kDebugMode) {
                          print("Radio Tile pressed $val");
                        }
                        setSelectedRadioTile(val!);
                      },
                      activeColor: Colors.pink[200],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: RadioListTile(
                      value: 4,
                      groupValue: selectedRadioTile,
                      title: Text(StringUtils.googlePay),
                      onChanged: (val) {
                        if (kDebugMode) {
                          print("Radio Tile pressed $val");
                        }
                        setSelectedRadioTile(val!);
                      },
                      activeColor: Colors.pink[200],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: RadioListTile(
                      value: 5,
                      groupValue: selectedRadioTile,
                      title: Text(StringUtils.netBanking),
                      onChanged: (val) {
                        if (kDebugMode) {
                          print("Radio Tile pressed $val");
                        }
                        setSelectedRadioTile(val!);
                      },
                      activeColor: Colors.pink[200],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        StringUtils.profileDetails,
                        style: TextStyle(
                          color: Colors.pink[200],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: <Widget>[
                                Expanded(flex: 5, child: Text(widget.name)),
                                Expanded(
                                  flex: 1,
                                  child: SizedBox(
                                      height: 15,
                                      child: Text(StringUtils.rs)),
                                ),
                                Expanded(
                                    flex: 1,
                                    child: Text(
                                      widget.price,
                                      style: TextStyle(
                                          color: Colors.pink[200],
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                                flex: 5,
                                child: Text(StringUtils.grandTotal)),
                            Expanded(
                              flex: 1,
                              child: SizedBox(
                                  height: 15, child: Text(StringUtils.rs)),
                            ),
                            Expanded(
                                flex: 1,
                                child: Text(
                                  widget.price,
                                  style: TextStyle(
                                      color: Colors.pink[200],
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                )),
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
      ),
    );
  }
}

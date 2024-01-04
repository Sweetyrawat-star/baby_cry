import 'package:babycry/PaymentPage.dart';
import 'package:babycry/util/theme.dart';
import 'package:babycry/util/StringUtils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddToCart extends StatefulWidget {
  final String ?event;
  final String ?nameOfProduct;
  final String ?priceOfProduct;
  final String ?imageOfProduct;
  final String ?lengthOfProduct;
  const AddToCart(
      {super.key, this.event,
      this.imageOfProduct,
      this.priceOfProduct,
      this.nameOfProduct,
      this.lengthOfProduct});

  @override
  _AddToCartState createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  buildCard(
      {String ?txt,
      String ?image,
      Color ?color,
      String? txt2,
      String? txt3,
      String? price}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 3,
        child: Stack(
          children: <Widget>[
            Positioned(
              left: 0.0,
              top: 0.0,
              bottom: 0.0,
              right: 80.0,
              child: Container(
                height: 30.0,
                width: 30.0,
                // color: Colors.red,
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(60.0),
                    gradient: LinearGradient(
                        colors: [Colors.blue.shade400, Colors.pink])),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: Icon(
                        Icons.clear,
                        color: Colors.white,
                      )),
                ),
              ),
            ),
            Container(
                //color: Colors.grey,
                height: 100,
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(60.0),
                ),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: <Widget>[
                              Image.asset(
                                image!,
                                fit: BoxFit.cover,
                                height: 60,
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: <Widget>[
                            SizedBox(
                              width: 200.0,
                              child: ListTile(
                                title: Text(
                                  txt!,
                                  style: const TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                ),
                                subtitle: Row(
                                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    const SizedBox(
                                      height: 30.0,
                                    ),
                                    CircleAvatar(
                                      radius: 8.0,
                                      backgroundColor: color,
                                    ),
                                    const SizedBox(
                                      width: 5.0,
                                    ),
                                    Text(
                                      txt2!,
                                      style: const TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 60.0,
                                    ),
                                    Text(
                                      txt3!,
                                      style: const TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            //SizedBox(height: 10.0,),
                            Row(
                              children: <Widget>[
                                Text(
                                  widget.priceOfProduct!,
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 20),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ThemeChanger themechanger = Provider.of<ThemeChanger>(context);
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 10.0),
        child: ListView(
          children: <Widget>[
            Container(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        InkWell(
                          child: const Icon(Icons.arrow_back_ios),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Text(StringUtils.myBag,
                            style: TextStyle(
                                color:
                                    themechanger.getTheme() == ThemeData.dark()
                                        ? Colors.black
                                        : Colors.white,
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Icon(
                      Icons.delete,
                      color: Colors.pink[200],
                      size: 30.0,
                    ),
                  ],
                )),
            buildCard(
              txt: widget.nameOfProduct,
              color: Colors.yellow,
              txt2: StringUtils.yellow,
              price: StringUtils.price,
              image: widget.imageOfProduct,
              txt3: '1 Pair',
            ),
            const SizedBox(
              height: 10.0,
            ),
            Container(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(StringUtils.subTotal),
                      Text(widget.lengthOfProduct!),
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(StringUtils.shipping),
                      Text(StringUtils.priceCost),
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(StringUtils.totalCost),
                      Text(widget.priceOfProduct!),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: SizedBox(
                height: 50.0,
                width: 300,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Payment(
                                  name: widget.nameOfProduct!,
                                  price: widget.priceOfProduct!,
                                )));
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  color: Colors.pink[200],
                  child: Text(
                    StringUtils.continueTxt,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:babycry/addToCart.dart';
import 'package:babycry/data.dart';
import 'package:babycry/util/StringUtils.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  final String ?event;
  final String ?nameOfProduct;
  final String ?priceOfProduct;
  final String ?imageOfProduct;
  final String ?lengthOfProduct;
  const DetailsScreen({super.key, this.event, this.imageOfProduct, this.priceOfProduct, this.nameOfProduct, this.lengthOfProduct});

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {


  buildContainer(){
    return Container(
      height: 40.0,
      width: 300,
      color: Colors.white,
      padding: const EdgeInsets.only(left: 10.0,right: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              CircleAvatar(
                  radius: 12.0,
                  backgroundColor: Colors.pink[200],
                  child: const Icon(Icons.flash_on,color: Colors.pink,size: 12,)),
              const SizedBox(width: 10,),
              Text(StringUtils.flashSale),
            ],
          ),
          const Icon(Icons.arrow_forward_ios,size: 12,),
        ],
      ),
    );
  }
  buildQualityContainer(){
    return Container(
      height: 40.0,
      color: Colors.white,
      padding: const EdgeInsets.only(left: 10.0,right: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(StringUtils.selectSizeColorQuality),
          const Icon(Icons.arrow_forward_ios,size: 12,),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            height: 300.0,
            width: 380.0,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(widget.imageOfProduct!),fit: BoxFit.fill),
            ),
            child: Container(
              padding: const EdgeInsets.only(left: 10.0,top: 10.0,right: 10),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topLeft,
                          child: GestureDetector(
                            onTap: (){
                              Navigator.pop(context);
                            },
                              child: const Icon(Icons.arrow_back_ios,))
                      ),
                      const Icon(Icons.share),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20.0,),
         Container(
           padding: const EdgeInsets.only(left: 10.0,right: 10.0),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: <Widget>[
               Row(
                 children: <Widget>[
                   Text(widget.nameOfProduct!),
             ],
           ),
               Row(
                 children: <Widget>[
                   Column(
                     children: <Widget>[
                       const Icon(Icons.favorite_border,size: 20.0,),
                       Text(StringUtils.text,style: const TextStyle(fontSize: 14),),
                     ],
                   )
                 ],
               ),
        ],
      ),
         ),
          const SizedBox(height: 10.0,),
          Container(
            height: 80,
            color: Colors.pink[100],
            padding: const EdgeInsets.only(left: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text('Rp ${widget.priceOfProduct}'),
                    const SizedBox(width: 30.0,),
                    Container(
                      height: 20.0,
                      width: 40.0,
                      color: Colors.pink,
                      child: Center(
                          child: Text(StringUtils.sixtyPercentOff,style: const TextStyle(color: Colors.white,fontSize: 10.0),)),
                    )
                  ],
                ),
                const SizedBox(height: 10.0,),
                Container(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        height: 20.0,
                        width: 90.0,
                        decoration: BoxDecoration(
                            color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(color: Colors.pink)
                        ),
                        child: Center(child: Text(StringUtils.eightPercentClaimed)),
                      ),
                     const SizedBox(width: 20.0,) ,
                      Container(
                        height: 20.0,
                        width: 90.0,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(color: Colors.pink)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Icon(Icons.rotate_left,color: Colors.pink,size: 12,),
                            Text(StringUtils.timing),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20.0,),
          buildContainer(),
          const SizedBox(height: 10.0,),
          buildQualityContainer(),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: SizedBox(
              height: 50.0,
              width: 300,
              child: MaterialButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> AddToCart(
                    nameOfProduct: widget.nameOfProduct!,
                    priceOfProduct: widget.priceOfProduct!,
                    imageOfProduct: widget.imageOfProduct!,
                    lengthOfProduct: widget.lengthOfProduct!,
                  )));
                },
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                color: Colors.pink[200],
                child: Text(StringUtils.addToCart,style: const TextStyle(color: Colors.white),),
              ),
            ),
          )

        ]) );
  }
}

import 'package:babycry/util/StringUtils.dart';
import 'package:flutter/material.dart';

import 'RecommendedScreen.dart';

class EmptyCartPage extends StatefulWidget {
  @override
  _EmptyCartPageState createState() => _EmptyCartPageState();
}

class _EmptyCartPageState extends State<EmptyCartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:  CustomScrollView(
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(left:10.0,top:40.0,bottom: 10.0,right: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(StringUtils.cart,style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.bold)),
                          Icon(Icons.bookmark),
                        ],
                      ),
                    );
                  }, childCount: 1),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index){
                    return Column(
                      children: <Widget>[
                        ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Container(
                              height: 300.0,
                              width: 300.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                image: DecorationImage(image: AssetImage("assets/shop3.jpg"),fit: BoxFit.fill),
                              ),
                            )
                        ),
                        SizedBox(height: 10.0,),
                        Text(StringUtils.youHaveNotAdded),
                        Padding(
                          padding: const EdgeInsets.only(left:10.0,right: 10.0,top: 30.0),
                          child: Container(
                            height: 50.0,
                            width: 300,
                            child: MaterialButton(
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> Recommended()));
                              },
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                              color: Colors.pink[200],
                              child: Text(StringUtils.startShopping,style: TextStyle(color: Colors.white),),
                            ),
                          ),
                        ),
                      ],
                    );
                  },childCount: 1
              ),
            ),
          ],
        )
    );
  }
}

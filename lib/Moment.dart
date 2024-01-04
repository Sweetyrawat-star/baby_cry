import 'package:babycry/data.dart';
import 'package:babycry/util/StringUtils.dart';
import 'package:flutter/material.dart';

class Moment extends StatefulWidget {
  const Moment({super.key});

  @override
  _MomentState createState() => _MomentState();
}

class _MomentState extends State<Moment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(
                    left: 10.0, top: 40.0, bottom: 10.0, right: 10.0),
                child: Text(StringUtils.moments,
                    style:
                        TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
              );
            }, childCount: 1),
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Stack(children: <Widget>[
                      Container(
                        height: double.infinity,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                              image: AssetImage(
                                AppData.momentList[index].image!,
                              ),
                              fit: BoxFit.fill),
                        ),
                      ),
                      const Positioned(
                          top: 160,
                          left: 10.0,
                          child: Icon(
                            Icons.favorite_border,
                            color: Colors.white,
                          ))
                    ]));
              },
              childCount: AppData.momentList.length,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
              childAspectRatio: 1,
            ),
          ),
        ],
      ),
    ));
  }
}

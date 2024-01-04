import 'package:babycry/AppBar.dart';
import 'package:babycry/DetailScreen.dart';
import 'package:babycry/data.dart';
import 'package:flutter/material.dart';

class Recommended extends StatefulWidget {
  @override
  _RecommendedState createState() => _RecommendedState();
}

class _RecommendedState extends State<Recommended> {
  Widget makeCard({context, image, required String txt, required String txt2}) {
    return AspectRatio(
      aspectRatio: 4 / 5,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13.0),
        ),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13.0),
                    image: DecorationImage(
                        image: AssetImage(image), fit: BoxFit.fill),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 6,
                          offset: const Offset(0, 10))
                    ]),
              ),
            ),
            const SizedBox(
              height: 2.0,
            ),
            Expanded(
              flex: 0,
              child: Column(
                children: <Widget>[
                  Text(
                    txt,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    txt2,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w200,
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

  List<String> lengthOfRecommendedIncart = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(48.0),
            // here the desired height
            child: MyAppBar().getAppBar(
              context: context,
            )),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomScrollView(
            slivers: <Widget>[
              SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return GestureDetector(
                        onTap: () {
                          lengthOfRecommendedIncart
                              .add(AppData.clothesList[index].name!);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailsScreen(
                                        nameOfProduct:
                                            AppData.clothesList[index].name!,
                                        priceOfProduct: AppData
                                            .clothesList[index].price
                                            .toString(),
                                        imageOfProduct:
                                            AppData.clothesList[index].image!,
                                        lengthOfProduct:
                                            lengthOfRecommendedIncart.length
                                                .toString(),
                                      )));
                        },
                        child: makeCard(
                          image: AppData.clothesList[index].image,
                          txt: AppData.clothesList[index].name!,
                          txt2: AppData.clothesList[index].category!,
                        ));
                  },
                  childCount: AppData.clothesList.length,
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20.0,
                  crossAxisSpacing: 10.0,
                  childAspectRatio: 1,
                ),
              ),
            ],
          ),
        ));
  }
}

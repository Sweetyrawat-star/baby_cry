import 'package:babycry/DetailScreen.dart';
import 'package:babycry/ListUtils.dart';
import 'package:babycry/data.dart';
import 'package:babycry/util/theme.dart';
import 'package:babycry/util/StringUtils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'RecommendedScreen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<String> lengthOfRecommendedIncart = [];

  Widget buildBabyImages() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Recommended()));
      },
      child: Material(
        elevation: 1.0,
        child: SizedBox(
          height: 100.0,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: ListUtils.listOfBaby.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(2.0),
                        child: CircleAvatar(
                          backgroundColor: Colors.grey.shade300,
                          radius: 30.0,
                          backgroundImage:
                              AssetImage(ListUtils.listOfBaby[index]),
                        ),
                      ),
                      Text(ListUtils.listOfTopPandit[index],
                          style: const TextStyle(fontSize: 10.0, color: Colors.grey)),
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }

  buildGoPremium() {
    return Container(
      height: 115,
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          gradient: LinearGradient(colors: [
            Colors.pink.shade100,
            Colors.pinkAccent.shade200,
          ])),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            radius: 40.0,
            backgroundColor: Colors.pink[100],
            backgroundImage: const AssetImage("assets/cartoon.jpg"),
          ),
          //Image.asset("assets/cartoon.jpg",height: 130.0,width: 100,),
          const SizedBox(
            width: 20.0,
          ),
          Column(
            children: <Widget>[
              Text(
                StringUtils.children,
                style: const TextStyle(color: Colors.white, fontSize: 24),
              ),
              Text(
                StringUtils.enlightment,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Container(
                  height: 25.0,
                  width: 80.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Center(
                      child: Text(
                    StringUtils.seeMore,
                    style: const TextStyle(
                      color: Colors.pink,
                    ),
                  ))),
            ],
          )
        ],
      ),
    );
  }

  buildPopularClothes() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 0.0, top: 10.0, bottom: 10.0),
          child: Text(
            StringUtils.treading,
            style: const TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.w500),
          ),
        ),
        SizedBox(
            height: 200.0,
            width: double.infinity,
            child: CustomScrollView(
              scrollDirection: Axis.horizontal,
              primary: false,
              slivers: <Widget>[
                SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return InkWell(
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
                        child: Stack(
                          clipBehavior: Clip.hardEdge,
                          children: <Widget>[
                            SizedBox(
                              height: 180.0,
                              width: 180.0,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Image.asset(
                                    AppData.clothesList[index].image!,
                                    fit: BoxFit.fill,
                                  )),
                            ),
                            Positioned(
                                top: 0,
                                left: 0.0,
                                child: CircleAvatar(
                                  radius: 20.0,
                                  backgroundColor: Colors.pink,
                                  child: Text(
                                    StringUtils.sixtyPercentOff,
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 10),
                                  ),
                                ))
                          ],
                        ),
                      );
                    },
                    childCount: AppData.clothesList.length,
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisSpacing: 0.0,
                  ),
                ),
              ],
            )),
      ],
    );
  }

  buildOfferAdContainer() {
    return Container(
      height: 190.0,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.white,
          image: const DecorationImage(
              image: AssetImage('assets/parents.jfif'), fit: BoxFit.fill)),
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 40.0,
          ),
          Text(StringUtils.familyDay,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0)),
          const SizedBox(
            height: 5.0,
          ),
          Text(StringUtils.fiftyPercentOff,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 13.0)),
          const SizedBox(
            height: 15.0,
          ),
          Container(
              height: 25.0,
              width: 80.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Center(
                  child: Text(
                StringUtils.seeNow,
                style: const TextStyle(
                  color: Colors.pink,
                ),
              ))),
        ],
      ),
    );
  }

  buildGoPremiumSecond() {
    return Container(
      height: 115,
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          gradient: LinearGradient(colors: [
            Colors.pinkAccent.shade200,
            Colors.pink.shade100,
          ])),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    StringUtils.babyGirl,
                    style: const TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    StringUtils.enlightment,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                ],
              ),
              const SizedBox(
                width: 10.0,
              ),
              Container(
                  height: 25.0,
                  width: 80.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Center(
                      child: Text(
                    StringUtils.seeMore,
                    style: const TextStyle(
                      color: Colors.pink,
                    ),
                  ))),
            ],
          ),
          const SizedBox(
            width: 20.0,
          ),
          CircleAvatar(
            radius: 40.0,
            backgroundColor: Colors.pink[100],
            backgroundImage: const AssetImage("assets/baby1.jpg"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ThemeChanger themechanger = Provider.of<ThemeChanger>(context);
    return Scaffold(
        key: _scaffoldKey,
        body: CustomScrollView(
          slivers: <Widget>[
            SliverList(
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(
                      left: 10.0, top: 40.0, bottom: 10.0, right: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(StringUtils.discover,
                              style: const TextStyle(
                                  fontSize: 24.0, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      CustomTrailingWidget(themechanger: themechanger),
                    ],
                  ),
                );
              }, childCount: 1),
            ),
            SliverList(
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
                return Padding(
                    padding: const EdgeInsets.only(
                        left: 10.0, top: 10.0, bottom: 10.0, right: 10.0),
                    child: Column(
                      children: <Widget>[
                        buildBabyImages(),
                        const SizedBox(
                          height: 10.0,
                        ),
                        buildGoPremium(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 0.0, top: 10.0, bottom: 10.0),
                              child: Text(
                                StringUtils.treading,
                                style: TextStyle(
                                    color: themechanger.getTheme() ==
                                            ThemeData.dark()
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            SizedBox(
                                height: 200.0,
                                width: double.infinity,
                                child: CustomScrollView(
                                  scrollDirection: Axis.horizontal,
                                  primary: false,
                                  slivers: <Widget>[
                                    SliverGrid(
                                      delegate: SliverChildBuilderDelegate(
                                        (BuildContext context, int index) {
                                          return InkWell(
                                            onTap: () {
                                              lengthOfRecommendedIncart.add(
                                                  AppData
                                                      .clothesList[index].name!);
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder:
                                                          (context) =>
                                                              DetailsScreen(
                                                                nameOfProduct: AppData
                                                                    .clothesList[
                                                                        index]
                                                                    .name!,
                                                                priceOfProduct: AppData
                                                                    .clothesList[
                                                                        index]
                                                                    .price
                                                                    .toString(),
                                                                imageOfProduct:
                                                                    AppData
                                                                        .clothesList[
                                                                            index]
                                                                        .image!,
                                                                lengthOfProduct:
                                                                    lengthOfRecommendedIncart
                                                                        .length
                                                                        .toString(),
                                                              )));
                                            },
                                            child: Stack(
                                              clipBehavior: Clip.hardEdge,
                                              children: <Widget>[
                                                SizedBox(
                                                  height: 180.0,
                                                  width: 180.0,
                                                  child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                      child: Image.asset(
                                                        AppData
                                                            .clothesList[index]
                                                            .image!,
                                                        fit: BoxFit.fill,
                                                      )),
                                                ),
                                                Positioned(
                                                    top: 0,
                                                    left: 0.0,
                                                    child: CircleAvatar(
                                                      radius: 20.0,
                                                      backgroundColor:
                                                          Colors.pink,
                                                      child: Text(
                                                        StringUtils
                                                            .sixtyPercentOff,
                                                        style: const TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 10),
                                                      ),
                                                    ))
                                              ],
                                            ),
                                          );
                                        },
                                        childCount: AppData.clothesList.length,
                                      ),
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 1,
                                        mainAxisSpacing: 0.0,
                                      ),
                                    ),
                                  ],
                                )),
                          ],
                        ),
                        // buildPopularClothes(),
                        buildOfferAdContainer(),
                        const SizedBox(
                          height: 10.0,
                        ),
                        buildGoPremiumSecond()
                      ],
                    ));
              }, childCount: 1),
            ),
          ],
        ));
  }
}
class CustomTrailingWidget extends StatelessWidget {
  final ThemeChanger themechanger;

  CustomTrailingWidget({required this.themechanger});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const Icon(Icons.search),
        GestureDetector(
          onTap: () {
            if (themechanger.getTheme() == ThemeData.dark()) {
              themechanger.setTheme(ThemeData.light());
            } else {
              themechanger.setTheme(ThemeData.dark());
            }
          },
          child: Stack(
            children: <Widget>[
              const SizedBox(
                height: 30,
                width: 60,
              ),
              Positioned(
                top: 7,
                right: 10,
                left: 10,
                child: Container(
                  height: 20,
                  width: 60,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      color: themechanger.getTheme() == ThemeData.dark()
                          ? Colors.white
                          : Colors.black,
                    ),
                    shape: BoxShape.rectangle,
                  ),
                ),
              ),
              Positioned(
                top: 9,
                right: themechanger.getTheme() == ThemeData.dark() ? 13 : 30,
                child: Container(
                  height: 17,
                  width: 17,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: themechanger.getTheme() == ThemeData.dark()
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}


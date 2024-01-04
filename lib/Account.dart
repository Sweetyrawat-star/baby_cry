import 'package:babycry/util/StringUtils.dart';
import 'package:flutter/material.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  buildOption({String ?text, String ?text2, IconData ?iconData}) {
    return ListTile(
      leading: Icon(iconData),
      title: Text(text!),
      subtitle: Text(text2!),
      trailing: Icon(
        Icons.lock,
        color: Colors.grey[400],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(
                    left: 10.0, top: 40.0, bottom: 10.0, right: 10.0),
                child: Text(StringUtils.hereThere,
                    style:
                        TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
              );
            }, childCount: 1),
          ),
          SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return Column(
                children: <Widget>[
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(StringUtils.signInOrJoin),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text(StringUtils.babyShopAccount),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 10.0, right: 10.0, top: 30.0),
                    child: SizedBox(
                      height: 50.0,
                      width: 300,
                      child: MaterialButton(
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        color: Colors.pink[200],
                        child: Text(
                          StringUtils.signIn,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(StringUtils.newToBabyShop),
                      Text(StringUtils.joinUs),
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Divider(
                    color: Colors.grey[400],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  buildOption(
                      iconData: Icons.shop,
                      text: StringUtils.order,
                      text2: StringUtils.trackCancelAndReturn),
                  buildOption(
                      iconData: Icons.bookmark,
                      text: StringUtils.wishList,
                      text2: StringUtils.addYourFavorite),
                  const SizedBox(
                    height: 10.0,
                  ),
                  buildOption(
                      iconData: Icons.book,
                      text: StringUtils.profileDetails,
                      text2: StringUtils.updateYourPersonalInformation),
                  const SizedBox(
                    height: 10.0,
                  ),
                  buildOption(
                      iconData: Icons.child_care,
                      text: StringUtils.myMoments,
                      text2: StringUtils.seeYourBabyCutest),
                  const SizedBox(
                    height: 10.0,
                  ),
                  buildOption(
                      iconData: Icons.star,
                      text: StringUtils.favoriteBrands,
                      text2: StringUtils.followTheBrandsYouLove),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Divider(
                    color: Colors.grey[400],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 10.0, top: 0.0, bottom: 10.0, right: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            const Icon(Icons.help),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              StringUtils.help,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 14),
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            const Icon(Icons.mail_outline),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              StringUtils.feedback,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 14),
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            const Icon(Icons.share),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              StringUtils.share,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 14),
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            const Icon(Icons.star_border),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              StringUtils.rate,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 14),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              );
            }, childCount: 1),
          ),
        ],
      ),
    );
  }
}

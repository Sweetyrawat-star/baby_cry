import 'package:babycry/Account.dart';
import 'package:babycry/EmptyCartPage.dart';
import 'package:babycry/Moment.dart';
import 'package:babycry/util/theme.dart';
import 'package:babycry/util/StringUtils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'FabBottomAppBarItem.dart';
import 'HomePage.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard>
    with AutomaticKeepAliveClientMixin, WidgetsBindingObserver {
  @override
  bool get wantKeepAlive {
    return true;
  }

  bool isOpened = false;
  int _tabSelected = 0;


  void selectedTab(int index) {
    setState(() {
      _tabSelected = index;
      pageController.animateToPage(index,
          duration: const Duration(milliseconds: 10), curve: Curves.ease);
    });
  }

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  Widget buildPageView() {
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      pageSnapping: false,
      controller: pageController,
      onPageChanged: (index) {
        pageChanged(index);
      },
      children: <Widget>[
        HomePage(),
        const Moment(),
        EmptyCartPage(),
        Account(),
      ],
    );
  }

  void pageChanged(int index) {
    setState(() {
      _tabSelected = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return getMainDashboardWidget(context);
  }

  Scaffold getMainDashboardWidget(BuildContext context) {
    ThemeChanger themechanger = Provider.of<ThemeChanger>(context);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: buildPageView(),
        bottomNavigationBar: AnimatedContainer(
            color: Colors.white,
            duration: const Duration(milliseconds: 500),
            child: FabBottomAppBar(
              selectedIndex: _tabSelected,
              backgroundColor: themechanger.getTheme() == ThemeData.dark()
                  ? Colors.black
                  : Colors.white,
              color: themechanger.getTheme() == ThemeData.dark()
                  ? Colors.white30
                  : Colors.black45,
              selectedColor: Colors.pink,
              onTabSelected: selectedTab,
              items: [
                FabBottomAppBarItem(icon: Icons.home, text: StringUtils.home),
                FabBottomAppBarItem(
                    icon: Icons.favorite_border, text: StringUtils.favourite),
                FabBottomAppBarItem(
                    icon: Icons.add_shopping_cart, text: StringUtils.cart),
                FabBottomAppBarItem(
                    icon: Icons.person, text: StringUtils.account),
              ],
            )));
  }
}

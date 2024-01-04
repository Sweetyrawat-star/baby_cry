import 'package:flutter/material.dart';


class FabBottomAppBarItem {
  FabBottomAppBarItem({this.key,this.icon, /*this.selectedAssetImage,this.unselectedAssetImage,*/ this.text});
  GlobalKey ?key;
  IconData ?icon;
 /* String selectedAssetImage;
  String unselectedAssetImage;*/
  String ?text;
}

class FabBottomAppBar extends StatefulWidget {

  FabBottomAppBar({
    this.items,
    this.centerItemText,
    this.height = 54.0,
    this.iconSize = 36.0,
    this.backgroundColor,
    this.color,
    this.selectedColor,
    this.notchedShape,
    this.onTabSelected,
    required this.selectedIndex,
  }) {
    assert(this.items?.length == 2 || this.items?.length == 4);
  }

  final List<FabBottomAppBarItem> ?items;
  final String ?centerItemText;
  final double ?height;
  final double ?iconSize;
  final Color ?backgroundColor;
  final Color ?color;
  final Color ?selectedColor;
  final NotchedShape ?notchedShape;
  final ValueChanged<int>? onTabSelected;
  int selectedIndex = 0;

  @override
  _FabBottomAppBarState createState() => _FabBottomAppBarState();
}

class _FabBottomAppBarState extends State<FabBottomAppBar> {

  _updateIndex(int index) {
    widget.onTabSelected!(index);
    setState(() {
      widget.selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = List.generate((widget.items?.length ?? 0), (int index) {
      return _buildTabItem(
        item: widget.items![index],
        index: index,
        onPressed: _updateIndex,
      );
    });

    return BottomAppBar(
      key: widget.key,
      color: widget.backgroundColor,
      //shape: widget.notchedShape,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: items,
      ),
    );
  }

  Widget _buildMiddleTabItem() {
    return Expanded(
      child: SizedBox(
        height: widget.height,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: widget.iconSize),
            Text(
              widget.centerItemText ?? '',
              style: TextStyle(color: widget.color),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabItem({
    required FabBottomAppBarItem item,
    required int index,
    required ValueChanged<int> onPressed,
  }) {
    Color? color = widget.selectedIndex == index ? widget.selectedColor : widget.color;
    return Expanded(
      key: item.key,
      child: SizedBox(
        height: widget.height,
        //height: 300.0,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            customBorder : const RoundedRectangleBorder(borderRadius : BorderRadius.only(
                topLeft: Radius.elliptical(20.0, 40.0),
                topRight: Radius.elliptical(20.0, 40.0),
                bottomRight: Radius.elliptical(20.0, 40.0),
                bottomLeft: Radius.elliptical(20.0, 40.0))),
            highlightColor: Colors.transparent ,
            splashColor : Colors.white,
            onTap: () => onPressed(index),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //Image.asset(assetImage,color: color,scale: 3.3,),
                Icon(item.icon,color: Colors.pink[200],),
                const SizedBox(height: 2.0,),
                Text(
                  item.text!,
                  style: TextStyle(color: color,fontSize: 11.0),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
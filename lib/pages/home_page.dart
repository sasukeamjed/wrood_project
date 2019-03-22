import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  GlobalKey _key = GlobalKey();

  _getSizes() {
    final RenderBox renderBoxRed = _key.currentContext.findRenderObject();
    final sizeRed = renderBoxRed.size;
  }

  _afterLayout(_) {
    _getSizes();
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(_afterLayout);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
//    print('GridView Page Height: ${MediaQuery.of(context).size.height}');
//    double heightOfItem = (MediaQuery.of(context).size.height) / 5;
//    print('heightOfItem: $heightOfItem');
    return _mainGridView();
  }

  Widget _mainGridView() {
    return GridView.count(
      childAspectRatio: 1.17,
      crossAxisCount: 2,
      children: <Widget>[
        _mainItem(
          icon: 'assets/balloons.png',
          title: 'Happy Occasions',
          image: 'assets/happy_occasions_image.jpg',
//          size: size,
          key: _key,
        ),
        _mainItem(
          icon: 'assets/gift.png',
          title: 'Gifts Shops',
          image: 'assets/gifts_shop_image.jpg',
//          size: size,
        ),
        _mainItem(
          icon: 'assets/rose.png',
          title: 'Flowers',
          image: 'assets/flowers_image.jpg',
//          size: size,
        ),
        _mainItem(
          icon: 'assets/cupcake.png',
          title: 'Cakes and Cookies',
          image: 'assets/cakes_and_cookies_image.jpg',
//          size: size,
        ),
        _mainItem(
          icon: 'assets/care.png',
          title: 'Special Orders',
          image: 'assets/special_orders_image.jpg',
//          size: size,
        ),
      ],
    );
  }

//  _mainItem(icon: 'assets/balloons.png', title: 'Happy Occasions', image: 'assets/happy_occasions_image.jpg'),
//  _mainItem(icon: 'assets/gift.png', title: 'Gifts Shops', image: 'assets/gifts_shop_image.jpg'),
//  _mainItem(icon: 'assets/rose.png', title: 'Flowers', image: 'assets/flowers_image.jpg'),
//  _mainItem(icon: 'assets/cupcake.png', title: 'Cakes and Cookies', image: 'assets/cakes_and_cookies_image.jpg'),
//  _mainItem(icon: 'assets/care.png', title: 'Special Orders', image: 'assets/special_orders_image.jpg'),

  Widget _mainItem(
      {String icon, String title, String image, GlobalKey key}) {
//    print('main item method = $size');
    return Opacity(
      opacity: 0.5,
      child: Container(
        key: key,
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.only(top: 5.0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(14),
          ),
          boxShadow: [
            BoxShadow(
              color: Color(0xff000000).withOpacity(0.5),
              blurRadius: 5,
              offset: Offset(-1, -1),
            ),
          ],
        ),
        child: Center(
          child: FittedBox(
            fit: BoxFit.fitHeight,
            child: Column(
              children: <Widget>[
                Image.asset(icon),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      color: Colors.black),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

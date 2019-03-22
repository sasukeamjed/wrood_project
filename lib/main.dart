import 'package:flutter/material.dart';

import 'package:bmnav/bmnav.dart' as bmnav;

import './pages/home_page.dart';
import './pages/search_page.dart';
import './pages/profile_page.dart';
import './pages/cart_page.dart';

//next to do is to get the perfect size of the item container by using renderBox

void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: Color(0xffe2c6c6),
        bottomAppBarColor: Color(0xff97318D),
        accentColor: Color(0xff97318D),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int currentTap = 0;

  double _getHeight(){
    return MediaQuery.of(context).size.height / 4;
  }

  final List<Widget> pages = [
    HomePage(),
    SearchPage(),
    ProfilePage(),
    CartPage(),
  ];



  Widget currentPage = HomePage();

  final PageStorageBucket bucket = PageStorageBucket();



  @override
  Widget build(BuildContext context) {
    print('Main Page Height: ${MediaQuery.of(context).size.height}');
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        leading: Icon(
          Icons.menu,
          color: Colors.black.withOpacity(0.5),
        ),
        actions: <Widget>[
          Icon(
            Icons.shopping_cart,
            color: Colors.black.withOpacity(0.5),
          ),
        ],
        title: Text('WROOD'),
        backgroundColor: Theme.of(context).accentColor,
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: currentPage,
        ),
      ),
      bottomNavigationBar: bmnav.BottomNav(
        color: Theme.of(context).accentColor,
        index: currentTap,
        iconStyle: bmnav.IconStyle(
          color: Colors.black,
          onSelectColor: Colors.white,
        ),
        onTap: (i) {
          setState(() {
            currentTap = i;
            currentPage = pages[i];
          });
        },
        items: [
          bmnav.BottomNavItem(Icons.home),
          bmnav.BottomNavItem(Icons.search),
          bmnav.BottomNavItem(Icons.account_box),
          bmnav.BottomNavItem(Icons.shopping_cart),
        ],
      ),
    );
  }


}

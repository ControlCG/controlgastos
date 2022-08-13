import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:cgg/app/ui/pages/home/daily_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      bottomNavigationBar: getFooter(),
      floatingActionButton: FloatingActionButton(
        onPressed:(){
          setTabs(4);
        },
        child:  const Icon(Icons.add,size: 25),
        backgroundColor: Colors.blue,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
  
  getBody() {
    return IndexedStack(
      index: pageIndex,
      children: const [
        DailyPage(),
        Center(
          child: Text("Graficas"),
        ),
        Center(
          child: Text("Agregar usuarios y demas"),
        ),
        Center(
          child: Text("Estado"),
        ),
        Center(
          child: Text("Perfil"),
        ),
      ],
    );
  }
  getFooter (){
    List<IconData> iconItems = [
      Icons.calendar_month_outlined,
      Icons.bar_chart_outlined,
      Icons.monetization_on,
      Icons.person
    ];
    return AnimatedBottomNavigationBar(
      icons: iconItems , 
      activeColor: Colors.blue,
      splashColor: Colors.grey,
      inactiveColor: Colors.black.withOpacity(0.5),
      activeIndex: pageIndex,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.softEdge, 
      leftCornerRadius: 10,
      iconSize: 25,
      rightCornerRadius: 10,
      onTap: (index){
        setTabs(index);
      });
  }
  setTabs(index){
    setState(() {
      pageIndex = index;
    });
  }
}
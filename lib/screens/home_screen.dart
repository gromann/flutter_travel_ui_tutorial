import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_travel_ui_starter/models/destination_model.dart';
import 'package:flutter_travel_ui_starter/models/hotel_model.dart';
import 'package:flutter_travel_ui_starter/widgets/destination_carousel.dart';
import 'package:flutter_travel_ui_starter/widgets/hotel_carousel.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIdx = 0;
  int currentTab = 0;
  List<IconData> icons = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.walking,
    FontAwesomeIcons.biking,
  ];

  Widget buildIcon(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIdx = index;
        });
      },
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
            color: selectedIdx == index
                ? Theme.of(context).accentColor
                : Colors.grey[300],
            borderRadius: BorderRadius.circular(30)),
        child: Icon(
          icons[index],
          size: 25,
          color: selectedIdx == index
              ? Theme.of(context).primaryColor
              : Colors.grey[500],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 120),
                child: Text(
                  "What would you like to find?",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children:
                    // display all icons
                    icons.asMap().entries.map((e) => buildIcon(e.key)).toList(),
              ),
              SizedBox(
                height: 20,
              ),
              DestinationCarousel(),
              SizedBox(
                height: 20,
              ),
              HotelCarousel(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentTab,
        onTap: (int val) {
          setState(() {
            currentTab = val;
          });
        },
        items: [
          BottomNavigationBarItem(
              title: SizedBox.shrink(),
              icon: Icon(
                Icons.search,
                size: 30,
              )),
          BottomNavigationBarItem(
              title: SizedBox.shrink(),
              icon: Icon(
                Icons.local_pizza,
                size: 30,
              )),
          BottomNavigationBarItem(
              title: SizedBox.shrink(),
              icon: Icon(
                Icons.account_circle_outlined,
                size: 30,
              )),
        ],
      ),
    );
  }
}

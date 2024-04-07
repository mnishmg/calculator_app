import 'package:calculator_app/UISys.dart';
import 'package:calculator_app/keyTile.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(Calculator());
}

class Calculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(primarySwatch: Colors.red),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();

  static _MainPageState? of(BuildContext context) =>
      context.findRootAncestorStateOfType<_MainPageState>();
}

class _MainPageState extends State<MainPage> {
  bool isDark = false;
  Color shadeRed = Colors.red.shade300;

  late SharedPreferences prefs;

  @override
  void initState() {
    getThemeMode();
    super.initState();
  }

  void getThemeMode() async {
    prefs = await SharedPreferences.getInstance();
    isDark = prefs.getBool('isDark') ?? false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Color bgColor = isDark ? Color(0xff151515) : Color(0xfffafafa);
    Color fgColor = isDark ? Color(0xff1a1a1a) : Color(0xffffffff);
    Color textColor = isDark ? Colors.white : Colors.black;
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: fgColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.menu,
              color: textColor,
            ),
            Text(
              'Calculator',
              style: TextStyle(
                  fontFamily: 'Mukta',
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.7,
                  color: textColor),
            ),
            Row(
              children: [
                InkWell(
                  child: Icon(
                    isDark ? Iconsax.sun_15 : Iconsax.moon5,
                    color: textColor,
                  ),
                  onTap: () {
                    setState(() {
                      isDark = !isDark;
                      prefs.setBool('isDark', isDark);
                    });
                  },
                ),
                // Switch(
                //     onChanged: (value) {
                //       isDark = value;
                //       if (isDark) {
                //         bgColor = Color(0xff151515);
                //         fgColor = Color(0xff1a1a1a);
                //         textColor = Colors.white;
                //       } else {
                //         bgColor = Color(0xfffafafa);
                //         fgColor = Color(0xffffffff);
                //         textColor = Colors.black;
                //       }
                //       setState(() {});
                //     },
                //     value: isDark)
              ],
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: fgColor,
              child: Column(
                children: [
                  Expanded(
                      flex: 3,
                      child: Container(
                        child: Center(child: Text('calculation history')),
                      )),
                  Expanded(
                      flex: 2,
                      child: Container(
                          child: Center(
                        child: Text(
                          'result',
                          style: textStyle(fontsize: 40, color: textColor),
                        ),
                      )))
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    keyTile(
                        keyValue: 'AC',
                        keyTextcolor: textColor.withOpacity(0.4)),
                    keyTile(
                        keyValue: 'C',
                        keyTextcolor: textColor.withOpacity(0.4)),
                    keyTile(
                        keyValue: '%',
                        keyTextcolor: textColor.withOpacity(0.4)),
                    keyTile(keyValue: '/', keyTextcolor: shadeRed),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    keyTile(keyValue: '7', keyTextcolor: textColor),
                    keyTile(keyValue: '8', keyTextcolor: textColor),
                    keyTile(keyValue: '9', keyTextcolor: textColor),
                    keyTile(keyValue: '*', keyTextcolor: shadeRed),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    keyTile(keyValue: '4', keyTextcolor: textColor),
                    keyTile(keyValue: '5', keyTextcolor: textColor),
                    keyTile(keyValue: '6', keyTextcolor: textColor),
                    keyTile(keyValue: '+', keyTextcolor: shadeRed),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    keyTile(keyValue: '1', keyTextcolor: textColor),
                    keyTile(keyValue: '2', keyTextcolor: textColor),
                    keyTile(keyValue: '3', keyTextcolor: textColor),
                    keyTile(keyValue: '-', keyTextcolor: shadeRed),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    keyTile(
                        keyValue: '00',
                        keyTextcolor: textColor.withOpacity(0.4)),
                    keyTile(keyValue: '0', keyTextcolor: textColor),
                    keyTile(
                        keyValue: '.',
                        keyTextcolor: textColor.withOpacity(0.4)),
                    keyTile(
                        keyValue: '=',
                        keyTextcolor: Colors.white,
                        KeyBGColor: shadeRed),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


// Switch(
//             onChanged: (value) {
//               isDark = value;
//               if (isDark) {
//                 bgColor = Color(0xff151515);
//                 fgColor = Color(0xff1a1a1a);
//               } else {
//                 bgColor = Color(0xfffafafa);
//                 fgColor = Color(0xffffffff);
//               }
//               setState(() {});
//             },
//             value: isDark)
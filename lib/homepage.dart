import 'package:clock_app/clock_view.dart';
import 'package:clock_app/data.dart';
import 'package:clock_app/theme_data.dart';
import 'package:clock_app/views/alarm_page.dart';
import 'package:clock_app/views/clock_page.dart';
import 'package:clock_app/views/enums.dart';
import 'package:clock_app/views/menu_info.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formattedTime = DateFormat("HH:mm").format(now);
    var formattedDate = DateFormat("EEE, d MMM").format(now);

    var timezoneString = now.timeZoneOffset.toString().split(".").first;
    var offsetSign = '';
    if (!timezoneString.startsWith("-")) offsetSign = "+";
    print(timezoneString);

   return Scaffold(
      backgroundColor: CustomColors.pageBackgroundColor,
      body: Row(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: menuItems.map((currentMenuInfo) => buildMenuButton(currentMenuInfo)).toList(),
          ),
          VerticalDivider(
            color: CustomColors.dividerColor,
            width: 1.5,
          ),
          Expanded(
            child: Consumer<MenuInfo>(
              builder: (BuildContext context, MenuInfo value, Widget? child) {
                if (value.menuType==MenuType.clock)
                  return ClockPage();
                else if (value.menuType==MenuType.alarm)
                  return AlarmPage();
                else
                  return Container(
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(fontSize: 20),
                        children: <TextSpan>[
                          TextSpan(text: 'Upcoming\n'),
                          TextSpan(
                            text: value.title,
                            style: TextStyle(fontSize: 48),
                          ),
                        ],
                      ),
                    ),
                  );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMenuButton(MenuInfo currentMenuInfo) {
    return Consumer<MenuInfo>(
      builder: (BuildContext context, MenuInfo value, child) {
        return MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(topRight: Radius.circular(20)),
          ),
        color: currentMenuInfo.menuType == value.menuType ?  CustomColors.menuBackgroundColor : Colors.transparent,
        padding: EdgeInsets.symmetric(vertical: 10),
        onPressed: () {
          var menuInfo=Provider.of<MenuInfo>(context,listen: false);
          menuInfo.updateMenu(currentMenuInfo);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              currentMenuInfo.imageSource!,
               scale: 1.5
              ),
            SizedBox(
              height: 10,
            ),
            Text(
              currentMenuInfo.title ?? "",
              style: TextStyle(
                fontFamily: "avenir",
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ],
        ),
      );
      },  
    );
  }
}

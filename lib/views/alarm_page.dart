import 'package:clock_app/data.dart';
import 'package:clock_app/theme_data.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class AlarmPage extends StatefulWidget {
  const AlarmPage({super.key});

  @override
  State<AlarmPage> createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32,vertical: 64),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
          "Alarm",
            style: TextStyle(
            fontWeight: FontWeight.w700,
            fontFamily: "avenir",
            color: CustomColors.primaryTextColor,
            fontSize: 24),
          ),
          Expanded(
            child: ListView(
              children: 
              alarms.map<Widget>((alarm) {
                return Container(
                  margin: EdgeInsets.only(bottom: 30),
                  padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: alarm.gradientColors!,
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: alarm.gradientColors!.last.withOpacity(0.3),
                        blurRadius: 8,
                        spreadRadius: 2,
                        offset: Offset(4,4),
                      ),
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(24)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                      Row(
                        children: [
                          Icon(Icons.label,color: Colors.white,size: 25,),
                        ],
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(alarm.description!,style: TextStyle(color: Colors.white,fontFamily: "avenir"),
                      ),
                      Switch(value: true, onChanged: (bool value){},
                      activeColor: Colors.white,
                      ),
                     ],
                     ), 
                    
                    Text("Mon-Fri",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "avenir"
                    ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "07:00 AM",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "avenir",
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                        ),
                        ),
                        Icon(Icons.keyboard_arrow_down,color: Colors.white,size: 36,),
                      ],
                    ),
                    ],
                  ),
                );
              }).followedBy([
                DottedBorder(
                  strokeWidth: 3,
                  color: CustomColors.clockOutline,
                  borderType: BorderType.RRect,
                  radius: Radius.circular(24),
                  dashPattern: [5,4],
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                       color: CustomColors.clockBG,
                      borderRadius: BorderRadius.all(Radius.circular(24),),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 32,vertical: 16),
                    child: MaterialButton(
                      onPressed: (){
                
                      },
                      child: Column(
                        children: [
                          Image.asset("assets/add_alarm.png", 
                          scale: 1.5,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text("Add Alarm",
                          style: TextStyle(
                            color: Colors.white,fontFamily: "avenir"
                          ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ]).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
import 'package:clock_app/views/enums.dart';
import 'package:flutter/cupertino.dart';

class MenuInfo extends ChangeNotifier{
  MenuType ? menuType;
  String ? title;
  String ? imageSource;
  
  MenuInfo(this.menuType,{this.title,this.imageSource});
   
   updateMenu(MenuInfo menuInfo){
    this.menuType=menuInfo.menuType;
    this.title=menuInfo.title;
    this.imageSource=menuInfo.imageSource;

    //Important
    notifyListeners();

   }
}
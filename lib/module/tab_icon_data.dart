import 'package:flutter/animation.dart';

class TabIconData {
  TabIconData({
    this.imagePath = '',
    this.index = 0,
    this.selectedImagePath = '',
    this.title = '',
    this.isSelected = true,
    this.animationController,
  });

  String imagePath;
  String selectedImagePath;
  String title;
  bool isSelected;
  int index;
  // IconData icon;

  AnimationController? animationController;



static List<TabIconData> newAppList = <TabIconData>[
   TabIconData(
      imagePath: 'assets/images/home_outlined.png',
      selectedImagePath: 'assets/images/home.png',
      title: '首頁',
      index: 0,
      isSelected: false,
      animationController: null,
    ),
   
    TabIconData(
      imagePath: 'assets/images/user_outlined.png',
      selectedImagePath: 'assets/images/user.png',
      title: '其他',
      index: 3,
      isSelected: false,
      animationController: null,
    ),
  ];
}

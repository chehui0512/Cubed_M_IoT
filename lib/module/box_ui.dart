import 'package:e_fu/my_data.dart';



import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class Box {
  static final List<String> executeText = ["一", '二', '三', '四', '五', '六', '日'];
  static const BorderRadius normamBorderRadius =
      BorderRadius.all(Radius.circular(30));
  static List<BoxShadow> getshadow(Color color) {
    return [
      BoxShadow(
          color: color,
          offset: const Offset(6.0, 6.0), //陰影x軸偏移量
          blurRadius: 0, //陰影模糊程度
          spreadRadius: 0 //陰影擴散程度
          )
    ];
  }

  static Widget boxHasRadius(
      {Color? color,
      double? height,
      double? width,
      Border? border,
      required Widget? child,
      EdgeInsetsGeometry? margin,
      EdgeInsetsGeometry? padding,
      List<BoxShadow>? boxShadow}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: normamBorderRadius,
        color: color ?? Colors.white,
        border: border,
        boxShadow: boxShadow,
      ),
      height: height,
      width: width,
      margin: margin,
      padding: padding,
      child: child,
    );
  }

  static Widget boxWithTitle(String title, Widget child) {
    return (Column(
      children: [Text(title), const Padding(padding: EdgeInsets.all(5)), child],
    ));
  }

  static Widget textRadiusBorder(String text,
      {int? textType,
      Color? color,
      Color? border,
      double? width,
      EdgeInsets margin = const EdgeInsets.all(10),
      EdgeInsets padding = const EdgeInsets.all(2.5),
      double? height,
      Color? filling}) {
    return Container(
        padding: padding,
        margin: margin,
        alignment: const Alignment(0, 0),
        height: height ?? 30,
        width: width ?? 110,
        decoration: BoxDecoration(
            color: filling ?? MyTheme.buttonColor,
            borderRadius: BorderRadius.all(Radius.circular(height ?? 25)),
            border: Border.all(color: border ?? Colors.white)),
        child: textWidget(
            text: text,
            type: textType ?? TextType.sub,
            color: color ?? Colors.white));
  }

  static Widget titleText(String title,
      {AlignmentGeometry? alignment,
      double? gap,
      double? fontSize,
      Color? color,
      FontWeight? fontWeight}) {
    return Container(
      alignment: alignment ?? Alignment.centerLeft,
      padding: EdgeInsets.fromLTRB(0, gap ?? 0, 0, gap ?? 0),
      child: Text(
        title,
        style: TextStyle(
            fontWeight: fontWeight ?? FontWeight.bold,
            fontSize: fontSize,
            color: color),
        textAlign: TextAlign.left,
      ),
    );
  }

  

  

  static Widget inviteMember({String? type, String? name, Widget? accept}) {
    return Flex(
      direction: Axis.horizontal,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
            flex: 2, child: textWidget(text: type ?? '', type: TextType.sub)),
        Expanded(
            flex: 5,
            child: Center(
                child: textWidget(text: name ?? '', type: TextType.sub))),
        Expanded(flex: 2, child: accept ??= Container()),
      ],
    );
  }

  static Widget twoinfo(String title, String? describe,
      {List<Widget>? widget}) {
    return Box.boxHasRadius(
      padding: const EdgeInsets.fromLTRB(30, 10, 10, 10),
      margin: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: widget ??
            [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(describe!),
            ],
      ),
    );
  }

  static Widget twoinfoWithInput(
      String title, TextEditingController controller) {
    return Box.boxHasRadius(
      padding: const EdgeInsets.fromLTRB(30, 10, 10, 10),
      margin: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          TextFormField(
            controller: controller,
            decoration: InputDecoration(
              border: InputBorder.none,
              floatingLabelStyle: TextStyle(color: MyTheme.lightColor),
            ),
          )
        ],
      ),
    );
  }

  

  static Widget boxWithX(String title, {Function()? function}) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: function,
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          Box.textRadiusBorder(
            title,
            color: MyTheme.buttonColor,
            filling: Colors.white,
            border: MyTheme.buttonColor,
            margin: const EdgeInsets.fromLTRB(5, 15, 5, 5),
          ),
          Box.boxHasRadius(
            child: const Text(
              "X",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
            color: MyTheme.lightColor,
            width: 15,
            height: 15,
          )
        ],
      ),
    );
  }

  static Widget yesnoBox(Function() yes, Function() no,
      {String? yestTitle,
      noTitle,
      double? height,
      width,
      Color? noColor,
      yesColor}) {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Box.boxHasRadius(
              height: height,
              width: width,
              child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: no,
                  child: Box.textRadiusBorder(noTitle ?? '取消',
                      border: noColor ?? MyTheme.lightColor,
                      filling: noColor ?? MyTheme.lightColor)),
              color: noColor ?? MyTheme.lightColor),
          Box.boxHasRadius(
            height: height,
            width: width,
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: yes,
              child: Box.textRadiusBorder(yestTitle ?? '確定',
                  border: yesColor ?? MyTheme.buttonColor,
                  filling: yesColor ?? MyTheme.buttonColor),
            ),
            color: yesColor ?? MyTheme.buttonColor,
          )
        ],
      ),
    );
  }

 

  

  static List<Widget> executeWeek({bool? show}) {
    List<Widget> result = [];
    int today = DateTime.now().weekday;
    bool check = show != null && show;

    for (var element in executeText) {
      bool isToday = (today == (result.length + 1) && check);

      result.add(Expanded(
        flex: 1,
        child: Box.boxHasRadius(
            height: 30,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                element,
                textAlign: TextAlign.center,
                style: TextStyle(color: isToday ? Colors.white : null),
              ),
            ),
            color: isToday ? MyTheme.color : Colors.white),
      ));
    }
    return result;
  }

  

  //設立組數的輸入框
  static Widget setsBox(String title, TextEditingController controller) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(width: 70, alignment: Alignment.center, child: Text(title)),
        TextInput.radius('組數', controller, width: 80),
        const SizedBox(width: 40, child: Text('組')),
      ],
    );
  }

  //表單標題和輸入框
  static Widget textInput(
      String title, String hintText, TextEditingController controller) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        Expanded(child: TextInput.radius(hintText, controller)),
      ],
    );
  }
}

class Chart {
  static Widget avgChart(List<double> values) {
    return RadarChart(
      RadarChartData(
          titlePositionPercentageOffset: 0.3,
          getTitle: (index, angle) {
            switch (index) {
              case 0:
                return const RadarChartTitle(text: '左手');
              case 2:
                return const RadarChartTitle(text: '右手');
              case 1:
                return const RadarChartTitle(text: '下肢');
              default:
                return const RadarChartTitle(text: '');
            }
          },
          ticksTextStyle: const TextStyle(fontSize: 0),
          dataSets: [
            RadarDataSet(
              fillColor: MyTheme.lightColor,
              borderColor: MyTheme.lightColor,
              entryRadius: 2.3,
              dataEntries: values.map((e) => RadarEntry(value: e)).toList(),
              borderWidth: 2.3,
            )
          ]),

      swapAnimationDuration: const Duration(milliseconds: 150), // Optional
      swapAnimationCurve: Curves.linear, // Optional
    );
  }
}

class TextInput {
  static Widget radius(
    String text,
    TextEditingController controller, {
    TextField? textField,
    Function()? onTap,
    double? width,
    double? height,
    Color? color,
  }) {
    return Container(
        width: width,
        height: height ?? 45,
        margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(color: color ?? MyTheme.lightColor)),
        child: textField ??
            TextField(
              onTap: onTap,
              controller: controller,
              cursorColor: color ?? MyTheme.lightColor,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                isCollapsed: true,
                contentPadding: const EdgeInsets.all(10),
                border: InputBorder.none,
                hintText: text,
                hintStyle: TextStyle(color: MyTheme.hintColor, fontSize: 14),
              ),
            ));
  }

  static Widget radiusWithTitle(String text, TextEditingController controller,
      {TextField? textField, Function()? onTap}) {
    return SizedBox(
      width: 200,
      height: 200,
      child: Row(
        children: [
          Text(text),
          Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(color: MyTheme.lightColor)),
            child: textField ??
                TextFormField(
                  onTap: onTap,
                  controller: controller,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    // labelText: text,
                    floatingLabelStyle: TextStyle(color: MyTheme.lightColor),
                  ),
                ),
          )
        ],
      ),
    );
  }
}

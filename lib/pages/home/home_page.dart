import 'dart:convert';

import 'package:e_fu/mqttHandler.dart';

import 'package:e_fu/module/page.dart';
import 'package:e_fu/request/exercise/exercise_data.dart';

import 'package:e_fu/my_data.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class Invite {
  Invite(
      {required this.host,
      required this.remark,
      required this.name,
      required this.dateTime,
      required this.accept});
  String host;
  String remark;
  String name;
  DateTime dateTime;
  String accept;
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  String userName = "柯明朗";

  MqttHandler mqttHandler = MqttHandler();
  Logger logger = Logger();
  String mqttResult = "";
  Exercise exercise =
      Exercise(user: "user", datetime: DateTime.now(), score: 3);

  @override
  void initState() {
    super.initState();
    mqttHandler.connect();
    connect();
  }

  connect() {
    print("connect ${mqttHandler.data.value}");
    if (mqttResult != "") {
      logger.v(mqttResult);
      print("mqtt result");
      setState(() {
        mqttResult = mqttHandler.data.value;

        exercise = Exercise.fromJson(jsonDecode(mqttResult));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomPage(
      title: "運動輔助",
      headTexttype: TextType.page,
      headHeight: MediaQuery.of(context).size.height * 0.12,
      body: ValueListenableBuilder<String>(
        builder: (BuildContext context, String value, Widget? child) {
          return mqttHandler.data.value.isNotEmpty
              ? SizedBox(
                  height: 100,
                  child: Column(
                    children: <Widget>[
                      const Padding(padding: EdgeInsets.all(10)),
                      textWidget(
                          text: "等級" + mqttHandler.data.value.split(',')[1],
                          type: TextType.fun),
                      const Padding(padding: EdgeInsets.all(10)),
                      textWidget(
                          text: "次數" + mqttHandler.data.value.split(',')[2],
                          type: TextType.fun),
                      // textWidget(text: exercise.user, type: TextType.fun),
                      // textWidget(
                      //     text: exercise.datetime.toIso8601String(),
                      //     type: TextType.fun),
                      // textWidget(text: exercise.score.toString(), type: TextType.fun)
                    ],
                  ),
                )
              : Container();
        },
        valueListenable: mqttHandler.data,
      ),
    );
  }
}

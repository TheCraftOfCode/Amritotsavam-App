import 'package:amritotsavam_app/widgets/appbar_back_button.dart';
import 'package:flutter/material.dart';

class Schedule extends StatefulWidget {
  const Schedule({Key? key}) : super(key: key);

  @override
  _ScheduleState createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarBackButton('Schedule'),
      body: Container(),
    );
  }
}

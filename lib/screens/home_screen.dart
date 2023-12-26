import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/timer_provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var timer;

  @override
  void initState() {
    super.initState();
    timer = Provider.of<TimerProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Stopwatch',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Center(child: homeScreenBody()),
    );
  }

  Widget homeScreenBody() {
    return Container(
      child: Consumer<TimerProvider>(
        builder: (context, timeprovider, widget) {
          return Column(
            children: [
              SizedBox(
                height: 100,
              ),
              Center(
                child: Text(
                  '${timer.hour} : ' +
                      '${timer.minute} : ' +
                      '${timer.seconds} : ' +
                      '${(timer.milliseconds ~/ 10).toString().padLeft(2, '0')}',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 40,
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  (timer.startEnable)
                      ? ElevatedButton(
                    onPressed: timer.continueTimer,
                    child: Icon(
                      Icons.not_started_outlined
                    ),
                  )
                      : ElevatedButton(
                    onPressed: null,
                    child:Icon(
                        Icons.not_started_outlined
                    ),
                  ),
                  (timer.stopEnable)
                      ? ElevatedButton(
                    onPressed: timer.stopTimer,
                    child:  Icon(
                        Icons.pause
                    ),
                  )
                      : ElevatedButton(
                    onPressed: null,
                    child: Icon(
                        Icons.pause
                    ),
                  ),
                  (timer.continueEnable)
                      ? ElevatedButton(
                    onPressed: timer.startTimer,
                    child:  Icon(
                        Icons.restart_alt
                    ),
                  )
                      : ElevatedButton(
                    onPressed: null,
                    child:  Icon(
                        Icons.restart_alt
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

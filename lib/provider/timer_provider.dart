import 'dart:async';

import 'package:flutter/foundation.dart';

class TimerProvider with ChangeNotifier {
  late Timer _timer;
  int _hour = 0;
  int _minute = 0;
  int _seconds = 0;
  int _milliseconds = 0;
  bool _startEnable = true;
  bool _stopEnable = false;
  bool _continueEnable = false;

  int get hour => _hour;
  int get minute => _minute;
  int get seconds => _seconds;
  int get milliseconds => _milliseconds;
  bool get startEnable => _startEnable;
  bool get stopEnable => _stopEnable;
  bool get continueEnable => _continueEnable;

  void startTimer() {
    _hour = 0;
    _minute = 0;
    _seconds = 0;
    _milliseconds = 0;
    _startEnable = false;
    _stopEnable = true;
    _continueEnable = false;

    _timer = Timer.periodic(Duration(milliseconds: 10), (timer) {
      _milliseconds += 10;

      if (_milliseconds >= 1000) {
        _milliseconds = 0;
        if (_seconds < 59) {
          _seconds++;
        } else {
          _seconds = 0;
          if (_minute < 59) {
            _minute++;
          } else {
            _minute = 0;
            _hour++;
          }
        }
      }

      notifyListeners();
    });
  }

  void stopTimer() {
    if (_startEnable == false) {
      _startEnable = true;
      _continueEnable = true;
      _stopEnable = false;
      _timer.cancel();
    }
    notifyListeners();
  }

  void continueTimer() {
    _startEnable = false;
    _stopEnable = true;
    _continueEnable = false;

    _timer = Timer.periodic(Duration(milliseconds: 10), (timer) {
      _milliseconds += 10;

      if (_milliseconds >= 1000) {
        _milliseconds = 0;
        if (_seconds < 59) {
          _seconds++;
        } else {
          _seconds = 0;
          if (_minute < 59) {
            _minute++;
          } else {
            _minute = 0;
            _hour++;
          }
        }
      }

      notifyListeners();
    });
  }
}

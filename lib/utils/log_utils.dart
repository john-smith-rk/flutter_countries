import 'package:flutter/foundation.dart';

class LogUtils{

  static void lodD(String logMsg){
    if(kDebugMode){
      print(logMsg);
    }
  }

}
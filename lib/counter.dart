import 'package:flutter/material.dart';
                                    //ChangeNotifier는 provider와 consumer에서 < >에 사용되기 위해 extends를 사용 
class Counter with ChangeNotifier{ //ChangeNotifier를 썼다면 notifyListeners를 쓴다. 
  int _count =0;
 
  int getCount(){
    return _count;
  }

  void incrementCount(){
    _count++; //1증가후
    notifyListeners(); //ChangeNotifierProvider안에 있는 위젯들에게 이 사실을 알림. 
  }

} 
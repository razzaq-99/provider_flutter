
import 'package:flutter/foundation.dart';


class CountFoundationProvider with ChangeNotifier{

     int _count = 25;
     int get count => _count;


     void setCount(){
       _count++;
       notifyListeners();
     }

}
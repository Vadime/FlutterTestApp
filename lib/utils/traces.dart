import 'package:firebase_performance/firebase_performance.dart';

class Traces {
  static Trace userGenTrace = FirebasePerformance.instance.newTrace("generateUsers");
  
}

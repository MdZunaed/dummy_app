
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = StateProvider((ref){
  return 0;
});

final switchProvider = StateProvider((ref){
  return false;
});
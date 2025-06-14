import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tesstt_task/app.dart';
import 'package:tesstt_task/injection_container.dart' as di;


import 'package:tesstt_task/utils/bloc_observer.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = TaskBlocObserver();

 await di.init();
 
   await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

  runApp(const App());
}

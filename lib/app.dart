import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tesstt_task/features/home/presentation/screens/home.dart';
import 'package:tesstt_task/utils/theme/theme_colors.dart';



class App extends StatefulWidget {

  const App({super.key,});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     theme: ThemeData(
    scaffoldBackgroundColor: ThemeColors.mainColor,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: ThemeColors.mainColor,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
    ),
  ),
      initialRoute: "/",
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (context) => const HomeScreen());
         
          default:
            return null;
        }
      },
    );
    
  }
}

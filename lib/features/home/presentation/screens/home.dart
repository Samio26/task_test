import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tesstt_task/features/home/presentation/bloc/collection_bloc.dart';
import 'package:tesstt_task/features/home/presentation/screens/bottle_screen.dart';
import 'package:tesstt_task/features/home/presentation/screens/home_content.dart';
import 'package:tesstt_task/features/home/presentation/screens/qrcode_screen.dart';
import 'package:tesstt_task/features/home/presentation/screens/settings_screen.dart';
import 'package:tesstt_task/injection_container.dart';
import 'package:tesstt_task/utils/theme/theme_colors.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 1;

  final List<Widget> _screens = [
    const QrCodeScreen(),
    const HomeContentScreen(),
    const BottleScreen(),
    const SettingScreen(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CollectionBloc>()..add(GetCollectionsEvent()),
      child: Scaffold(
        backgroundColor: ThemeColors.mainColor,
        appBar: AppBar(
          backgroundColor: ThemeColors.mainColor,
          elevation: 0,
          title: const Align(
            alignment: Alignment.topLeft,
            child: Text(
              'My collection',
              style: TextStyle(
                  fontSize: 32,
                  fontFamily: 'Serif',
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
            ),
          ),
          actions: [
            Stack(
              children: [
                const Icon(Icons.notifications_none,
                    size: 28, color: Colors.white),
                Positioned(
                  right: 2,
                  bottom: 1,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        body: _screens[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: ThemeColors.mainColor,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          currentIndex: _currentIndex,
          onTap: _onTabTapped,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.qr_code_scanner), label: "Scan"),
            BottomNavigationBarItem(
                icon: Icon(Icons.grid_view), label: "Collection"),
            BottomNavigationBarItem(icon: Icon(Icons.local_bar), label: "Shop"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "Settings"),
          ],
        ),
      ),
    );
  }
}

import 'package:common/controllers/database_controller.dart';
import 'package:common/controllers/gathering_controller.dart';
import 'package:flutter/material.dart';
import 'components/main_screen_bottom_navigation_bar.dart';
import '../home/home_screen.dart';
import '../follow/follow_screen.dart';
import '../user/user_screen.dart';
import '../../controllers/local_controller.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String _userUniversity = '';
  int _currentScreenIndex = 2;

  @override
  void initState() {
    super.initState();
    _getUserUniversity();
    updateScreen();
  }

  void _getUserUniversity() async {
    _userUniversity = await (LocalController.to.getUniversity()) ?? '충남대학교';
    setState(() {});
  }

  Widget _getMainScreen() {
    switch (_currentScreenIndex) {
      case 1:
        return FollowScreen(
          followUserList: DatabaseController.to.user!.likeUser,
        );
      case 2:
        return HomeScreen(university: _userUniversity);
      case 4:
        return UserScreen(
          user: DatabaseController.to.user!,
        );
      default:
        return Container();
    }
  }

  void updateScreen() async {
    await GatheringController.to.updateGathering();
    await DatabaseController.to.getCurrentUser(DatabaseController.to.user!.id);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getMainScreen(),
      bottomNavigationBar: MainScreenBottomNavigationBar(
        currentIndex: _currentScreenIndex,
        onTap: (int index) {
          if (index == 0 || index == 3) {
            return;
          }
          setState(() {
            _currentScreenIndex = index;
          });
        },
      ),
    );
  }
}

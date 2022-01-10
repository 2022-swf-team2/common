import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'components/main_screen_bottom_navigation_bar.dart';
import '../home/home_screen.dart';
import '../university/university_screen.dart';
import '../../constants.dart';
import '../../controllers/gathering_controller.dart';
import '../../controllers/local_controller.dart';
import '../../controllers/user_controller.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final LocalController _localController = Get.put(LocalController());
  final UserController _userController = Get.put(UserController());
  final GatheringController _gatheringController =
      Get.put(GatheringController());
  String _userUniversity = '';
  int _currentScreenIndex = 2;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getUserUniversity();
  }

  void _getUserUniversity() async {
    _userUniversity = await (_localController.getUniversity()) ?? '충남대학교';
    setState(() {});
  }

  Widget _getMainScreen() {
    switch (_currentScreenIndex) {
      case 2:
        return HomeScreen(university: _userUniversity);
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: _getMainScreen(),
      bottomNavigationBar: MainScreenBottomNavigationBar(
        currentIndex: _currentScreenIndex,
        onTap: (int index) {
          if(index == 0 || index == 3){
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

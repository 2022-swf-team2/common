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
  int _currentScreenIndex = 0;

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
      case 0:
        return const HomeScreen();
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kWhiteColor,
        foregroundColor: kBlackColor,
        elevation: 1,
        title: GestureDetector(
          onTap: () {
            Get.to(() => const UniversityScreen());
          },
          child: Row(
            children: [
              Text(_userUniversity),
              const SizedBox(width: 5),
              const RotatedBox(
                quarterTurns: 1,
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                ),
              ),
            ],
          ),
        ),
      ),
      body: _getMainScreen(),
      bottomNavigationBar: MainScreenBottomNavigationBar(
        currentIndex: _currentScreenIndex,
        onTap: (int index) {
          setState(() {
            _currentScreenIndex = index;
          });
        },
      ),
    );
  }
}

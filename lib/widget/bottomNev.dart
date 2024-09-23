// import 'package:flutter/material.dart';

// class Bottomnev extends StatefulWidget {
//   const Bottomnev({super.key});

//   @override
//   State<Bottomnev> createState() => _BottomnevState();
// }

// class _BottomnevState extends State<Bottomnev> {
//   @override
//   Widget build(BuildContext buildContext) {
//     return Scaffold(
//         floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//         bottomNavigationBar: BottomAppBar(
//             clipBehavior: Clip.antiAliasWithSaveLayer,
//             shape: CircularNotchedRectangle(),
//             child: Theme(
//               data: Theme.of(buildContext).copyWith(
//                   canvasColor: Colors.white, primaryColor: Colors.grey),
//               child: BottomNavigationBar(
//                 type: BottomNavigationBarType.fixed,
//                 backgroundColor: Theme.of(buildContext).primaryColor,
//                 elevation: 0.0,
//                 items: [
//                   BottomNavigationBarItem(
//                       icon: Image.asset('assets/icon/home (1).png')),
//                   BottomNavigationBarItem(
//                       icon: Image.asset('assets/icon/home (1).png')),
//                   BottomNavigationBarItem(
//                       icon: Image.asset('assets/icon/home (1).png'))
//                 ],
//               ),
//             )));
//   }
// }
import 'package:flutter/material.dart';
import 'package:foodiapp_ui/component/color.dart';
import 'package:foodiapp_ui/controller/bottomNavController.dart';
import 'package:foodiapp_ui/screens/homeScreen.dart';
import 'package:get/get.dart';

class BottomNev extends StatelessWidget {
  final TextStyle unselectedLabelStyle = TextStyle(
      color: Colors.white.withOpacity(0.5),
      fontWeight: FontWeight.w500,
      fontSize: 12);

  final TextStyle selectedLabelStyle =
      const TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12);

  buildBottomNavigationMenu(context, landingPageController) {
    return Obx(() => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: SizedBox(
          height: 74,
          child: BottomNavigationBar(
            showUnselectedLabels: true,
            showSelectedLabels: true,
            onTap: landingPageController.changeTabIndex,
            currentIndex: landingPageController.tabIndex.value,
            backgroundColor:whiteColor,
            unselectedItemColor: Colors.white.withOpacity(0.5),
            selectedItemColor: Colors.white,
            unselectedLabelStyle: unselectedLabelStyle,
            selectedLabelStyle: selectedLabelStyle,
            items: [
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(bottom: 7),
                  child: const Icon(
                    Icons.home,
                    size: 20.0,
                  ),
                ),
                label: 'Home',
                backgroundColor: const Color.fromRGBO(36, 54, 101, 1.0),
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(bottom: 7),
                  child: const Icon(
                    Icons.search,
                    size: 20.0,
                  ),
                ),
                label: 'Explore',
                backgroundColor: const Color.fromRGBO(36, 54, 101, 1.0),
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(bottom: 7),
                  child: const Icon(
                    Icons.location_history,
                    size: 20.0,
                  ),
                ),
                label: 'Places',
                backgroundColor: const Color.fromRGBO(36, 54, 101, 1.0),
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(bottom: 7),
                  child: const Icon(
                    Icons.settings,
                    size: 20.0,
                  ),
                ),
                label: 'Settings',
                backgroundColor: const Color.fromRGBO(36, 54, 101, 1.0),
              ),
            ],
          ),
        )));
  }

  @override
  Widget build(BuildContext context) {
    final BottomNevController landingPageController =
        Get.put(BottomNevController(), permanent: false);
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar:
          buildBottomNavigationMenu(context, landingPageController),
      body: Obx(() => IndexedStack(
            index: landingPageController.tabIndex.value,
            children: [
              const MyHomePage(title: 'app',),const Text('home'),const Text('home'),const Text('home'),
             
            ],
          )),
    ));
  }
}
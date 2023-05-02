import 'package:common_bottom_nav/bottom_navigation/bottom_viewmodel.dart';
import 'package:common_bottom_nav/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomScreenView extends StatefulWidget {
  static const String route = "/BottomScreenView";

  const BottomScreenView({Key? key}) : super(key: key);

  @override
  State<BottomScreenView> createState() => _BottomScreenViewState();
}

class _BottomScreenViewState extends State<BottomScreenView> {
  @override
  void initState() {
    // withViewModel<BottomViewModel>(context, (viewModel) {
    //   viewModel.isHide = false;
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomViewModel>(
        builder: (context, provider, child) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: WillPopScope(
              onWillPop: () async {
                return true;
              },
              child: Navigator(
                key: navigationKey,
                initialRoute: BottomScreenView.route,
                onGenerateRoute: (RouteSettings settings) {
                  Widget currentClass;
                  switch (settings.name) {
                    // case HomeScreen.route:
                    //   currentClass = const HomeScreen();
                    //   break;
                    default:
                      currentClass = const BottomScreenView();
                  }
                  return PageRouteBuilder(
                    pageBuilder: (_, __, ___) => currentClass,
                    transitionDuration: Duration.zero,
                    reverseTransitionDuration: Duration.zero,
                    settings: settings,
                  );
                },
              ),
            ),
            bottomNavigationBar: provider.isHide
                ? const SizedBox.shrink()
                : SizedBox(
                    height: 60,
                    child: BottomNavigationBar(
                      currentIndex: provider.currentIndex,
                      onTap: (index) {
                        provider.currentIndex = index;
                        // navigationKey.currentState?.popUntil(
                        //   ModalRoute.withName(DateEventScreen.route),
                        // );
                        navigationKey.currentState?.pushNamed(
                          provider.bottomItems[index].routeName,
                        );
                      },
                      items: provider.bottomItems
                          .map<BottomNavigationBarItem>(
                            (e) => BottomNavigationBarItem(
                              icon: Icon(
                                e.iconData,
                              ),
                              activeIcon: Icon(
                                e.iconData,
                              ),
                              label: e.title,
                            ),
                          )
                          .toList(),
                    ),
                  ),
          );
        },
      );
  }
}

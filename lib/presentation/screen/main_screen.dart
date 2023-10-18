import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/core/service_locator.dart';
import 'package:store_app/presentation/blocs/home_bloc/home_bloc.dart';
import 'package:store_app/presentation/screen/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late final PageController pageController;

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children:  [
              BlocProvider(
            create: (context) =>
            locator<HomeBloc>()..add(HomeGetAllProduct()),


            child: HomeScreen(),
          ),
          // HomeScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        // surfaceTintColor: Colors.white,
        items: [
          BottomNavigationBarItem(icon: IconButton(

            onPressed: () {},
            icon: Image.asset(
              "assets/icons/ic_home.png",
              width: 24,
              height: 24,
            ),
          ),label: ""),
          BottomNavigationBarItem(icon: IconButton(
            onPressed: () {},
            icon: Image.asset(
              "assets/icons/ic_heart.png",
              width: 24,
              height: 24,
            ),
          ),label: ""),
          BottomNavigationBarItem(icon: IconButton(
            onPressed: () {},
            icon: Image.asset(
              "assets/icons/ic_bag.png",
              width: 24,
              height: 24,
            ),
          ),label: ""),
          BottomNavigationBarItem(icon: IconButton(
            onPressed: () {},
            icon: Image.asset(
              "assets/icons/ic_notification.png",
              width: 24,
              height: 24,
            ),
          ),label: ""),

        ],
        // child: Row(
        //   children: [
        //     const Spacer(),
        //     IconButton(
        //       onPressed: () {},
        //       icon: Image.asset(
        //         "assets/icons/ic_home.png",
        //         width: 24,
        //         height: 24,
        //       ),
        //     ),
        //     const Spacer(flex: 2),
        //     IconButton(
        //       onPressed: () {},
        //       icon: Image.asset(
        //         "assets/icons/ic_heart.png",
        //         width: 24,
        //         height: 24,
        //       ),
        //     ),
        //     const Spacer(flex: 2),
        //     IconButton(
        //       onPressed: () {},
        //       icon: Image.asset(
        //         "assets/icons/ic_bag.png",
        //         width: 24,
        //         height: 24,
        //       ),
        //     ),
        //     const Spacer(flex: 2),
        //     IconButton(
        //       onPressed: () {},
        //       icon: Image.asset(
        //         "assets/icons/ic_notification.png",
        //         width: 24,
        //         height: 24,
        //       ),
        //     ),
        //     const Spacer(),
        //   ],
        // ),
      ),
    );
  }
}
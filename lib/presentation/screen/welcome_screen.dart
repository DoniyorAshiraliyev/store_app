import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/core/service_locator.dart';
import 'package:store_app/presentation/blocs/home_bloc/home_bloc.dart';
import 'package:store_app/presentation/screen/home_screen.dart';
import 'package:store_app/presentation/screen/main_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Image.asset(
                "assets/images/welcome.png",
                height: size.height * .7,
                width: size.width,
                fit: BoxFit.cover,
              ),
              Expanded(
                child: Container(
                  color: Colors.black,
                ),
              )
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: size.height * .5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Coffee so good, your taste buds will love it.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 34,
                      fontFamily: 'Sora',
                      fontWeight: FontWeight.w600,
                      height: 0,
                      letterSpacing: 0.34,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'The best grain, the finest roast, the powerful flavor.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFA8A8A8),
                      fontSize: 14,
                      fontFamily: 'Sora',
                      fontWeight: FontWeight.w400,
                      height: 0.11,
                      letterSpacing: 0.14,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 50,
                    width: 320,
                    // padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      shadows: [
                        BoxShadow(
                          color: Color(0x2A000000),
                          blurRadius: 3,
                          offset: Offset(0, 2),
                          spreadRadius: 0,
                        ),
                        BoxShadow(
                          color: Color(0x15000000),
                          blurRadius: 3,
                          offset: Offset(0, 0),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (_) => MainScreen()

                        ),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 30,
                              height: 30,
                              child: Image.asset(
                                "assets/images/google.png",
                                height: 30,
                                width: 30,
                              ),
                            ),
                            const SizedBox(width: 15),
                            Text(
                              'Continue with Google',
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.5),
                                fontSize: 16,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

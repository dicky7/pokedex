import 'package:flutter/material.dart';
import 'package:poxedex/presentation/pages/home/home_page.dart';
import 'package:poxedex/utils/styles/styles.dart';

class SplashPage extends StatefulWidget {
  static const routeName = 'splash';
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushNamedAndRemoveUntil(context, HomePage.routeName, (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: splashBgColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Image.asset("assets/poke_splash.gif")
          ),
          const Text(
            "Pokedex",
            style: TextStyle(color: Colors.amber, fontSize: 26),
          )
        ],
      ),
    );
  }
}

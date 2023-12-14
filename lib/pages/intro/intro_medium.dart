import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ndenicolais/routes.dart';

class IntroPageMedium extends StatefulWidget {
  const IntroPageMedium({Key? key}) : super(key: key);

  @override
  IntroPageMediumState createState() => IntroPageMediumState();
}

class IntroPageMediumState extends State<IntroPageMedium> {
  @override
  void initState() {
    super.initState();
    navigateToHomePage();
  }

  navigateToHomePage() async {
    await Future.delayed(const Duration(seconds: 4));

    // Verifica se il widget è ancora montato prima di eseguire la navigazione
    if (mounted) {
      Navigator.of(context).pushNamed(Routes.home);
    }
  }

  @override
  @override
  Widget build(BuildContext context) {
    navigateToHomePage() async {
      await Future.delayed(const Duration(seconds: 4));
      Navigator.of(context).pushNamed(Routes.home);
    }

    navigateToHomePage();
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitFoldingCube(
              color: Theme.of(context).colorScheme.primary,
              size: 150.0,
            ),
            const SizedBox(height: 45),
            Text(
              'ndenicolais',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 20,
                fontFamily: 'CustomFont',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/features/splash/views/widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});
  static const String routeName = '/splash';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashViewBody(),
    );
  }
}

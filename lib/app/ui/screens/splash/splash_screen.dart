import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc_imdb_clone_app/library/resource/assets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'splash_screen_view_model.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    required this.viewModel,
    super.key,
  });

  final SplashScreenViewModel viewModel;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(seconds: 2));
      if (mounted) {
        widget.viewModel.gotoMainScreen(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBDA32),
      body: Center(
        child: SvgPicture.asset(
          AppIcons.imdbLogo,
          height: 200,
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:search_grid/constants/colors.dart';
import 'package:search_grid/widgets/text_widget.dart';
import 'package:stacked/stacked.dart';
import '../../constants/images.dart';
import '../../constants/sizes.dart';
import '../../themes/dimension.dart';
import 'splash_view_model.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashViewModel>.reactive(
      viewModelBuilder: () => SplashViewModel(),
      onViewModelReady: (model) async {
        await Future.delayed(const Duration(seconds: 3));
        model.handleStartUpLogic();
      },
      builder: (context, model, child) => Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const SizedBox(),
                Column(
                  children: [
                    TextWidget(
                      data: 'WelCome To',
                      color: kPrimaryLightTextColor,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                    mHeightSpan,
                    TextWidget(
                      data: 'Mobigic',
                      color: kPrimaryLightTextColor,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(pomo),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

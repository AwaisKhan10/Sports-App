import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sports_app/core/constant/app_assets.dart';
import 'package:sports_app/core/constant/colors.dart';
import 'package:sports_app/core/constant/text_style.dart';
import 'package:sports_app/ui/screens/home/home_view_model.dart';
import 'package:sports_app/widget/drop_down_expendable_button.dart';
import 'package:sports_app/widget/buttons/home_social_media_button.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> socialMediaIcons = [
    {'image': AppAssets().fb},
    {'image': AppAssets().insta},
    {'image': AppAssets().twitter},
    {'image': AppAssets().tiktok},
    {'image': AppAssets().youtube},
    {'image': AppAssets().snap},
  ];

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeScreenViewModel(),
      child: Consumer<HomeScreenViewModel>(
        builder: (context, value, child) {
          return Scaffold(
            backgroundColor: scaffoldColor,

            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                children: [
                  CustomDropDownExpendableButton(
                    text:
                        'Welcome to the Avaya App. For great in-app features such as posting to the Fan Engagement Wall and social sharing, please create a profile here. Digital Ticketing is a separate feature with your Earthquakes Ticketmaster Account login details.',
                  ),
                  40.verticalSpace,
                  Text(
                    'Welcome to App',
                    style: style25.copyWith(fontWeight: FontWeight.w700),
                  ),
                  Text(
                    'Creating a profile and signing will allow you \n to use app',
                    style: style18.copyWith(fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center,
                  ),
                  40.verticalSpace,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomSocialMediaIcon(
                          imagePath: AppAssets().fb,
                          onTap: () {
                            print('fb');
                          },
                        ),
                        CustomSocialMediaIcon(
                          imagePath: AppAssets().twitter,
                          onTap: () {
                            print('twitter');
                          },
                        ),
                        CustomSocialMediaIcon(
                          imagePath: AppAssets().insta,
                          onTap: () {
                            print('insta');
                          },
                        ),
                      ],
                    ),
                  ),
                  40.verticalSpace,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomSocialMediaIcon(
                          imagePath: AppAssets().tiktok,
                          onTap: () {
                            print('tiktok');
                          },
                        ),
                        CustomSocialMediaIcon(
                          imagePath: AppAssets().youtube,
                          onTap: () {
                            print('youtube');
                          },
                        ),
                        CustomSocialMediaIcon(
                          imagePath: AppAssets().snap,
                          onTap: () {
                            print('snap');
                          },
                        ),
                      ],
                    ),
                  ),
                  // _scocailMediaIconButton(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  //   Expanded _scocailMediaIconButton() {
  //     return Expanded(
  //       // Added to prevent overflow
  //       child: GridView.builder(
  //         padding: const EdgeInsets.all(20),
  //         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
  //           crossAxisCount: 3, // 3 items per row
  //           crossAxisSpacing: 20,
  //           mainAxisSpacing: 30,
  //           childAspectRatio: 1.3,
  //         ),
  //         itemCount: socialMediaIcons.length,
  //         itemBuilder: (context, index) {
  //           return CustomSocialMediaIcon(onTap: () {

  //           },
  //             imagePath: socialMediaIcons[index]["image"],
  //           );
  //         },
  //       ),
  //     );
  //   }
}

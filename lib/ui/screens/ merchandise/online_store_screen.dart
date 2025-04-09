import 'package:sports_app/ui/screens/%20merchandise/merchandise_screen_view_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sports_app/core/constant/app_assets.dart';
import 'package:sports_app/core/constant/text_style.dart';
import 'package:sports_app/widget/custom_app_bar.dart';
import 'package:sports_app/widget/online_store_card.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class OnlineStoreScreen extends StatelessWidget {
  const OnlineStoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MerchandiseScreenViewModel(),
      child: Consumer<MerchandiseScreenViewModel>(
        builder: (context, model, child) {
          return Scaffold(
            ///
            /// App Bar
            ///
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(60.h),
              child: CustomAppBar(title: 'Online Store'),
            ),

            ///
            /// Start Body
            ///
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset(AppAssets().onlineStore),
                  20.verticalSpace,
                  _storeItems(model),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _storeItems(MerchandiseScreenViewModel model) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Store Items', style: style18),
          20.verticalSpace,
          GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 10,
              childAspectRatio: 0.7,
            ),
            itemCount: model.OnlineStoreItems.length,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,

            itemBuilder: (BuildContext context, int index) {
              return CustomOnlineStoreCard(
                onTap: () {},
                onlineStore: model.OnlineStoreItems[index],
              );
            },
          ),
        ],
      ),
    );
  }
}

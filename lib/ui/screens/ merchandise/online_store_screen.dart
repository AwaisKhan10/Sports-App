import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sports_app/core/constant/app_assets.dart';
import 'package:sports_app/core/constant/colors.dart';
import 'package:sports_app/core/constant/text_style.dart';
import 'package:sports_app/core/model/online_store.dart';
import 'package:sports_app/ui/screens/%20merchandise/merchandise_screen_view_model.dart';
import 'package:sports_app/widget/header.dart';
import 'package:sports_app/widget/online_store_card.dart';

class OnlineStoreScreen extends StatelessWidget {
  const OnlineStoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MerchandiseScreenViewModel(),
      child: Consumer<MerchandiseScreenViewModel>(
        builder: (context, model, child) {
          return Scaffold(
            backgroundColor: scaffoldColor,
            appBar: AppBar(backgroundColor: whiteColor),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  CustomHeader(
                    title: 'Online Store',
                    icon: Icons.arrow_back_outlined,
                    onTap: () {
                      Navigator.pop(context);
                    },
                    icon2: Icons.shopping_cart_outlined,
                  ),
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
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 10,
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

import 'package:flutter/material.dart';
import 'package:sports_app/core/constant/colors.dart';
import 'package:sports_app/core/constant/text_style.dart';
import 'package:sports_app/core/model/online_store.dart';

class CustomOnlineStoreCard extends StatelessWidget {
  final OnlineStoreCardModel onlineStore;
  final VoidCallback onTap;
  const CustomOnlineStoreCard({
    required this.onTap,
    super.key,
    required this.onlineStore,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(onlineStore.title, style: style16),

            Image.asset(onlineStore.imageUrl),
            Text(onlineStore.price, style: style16),
          ],
        ),
      ),
    );
  }
}

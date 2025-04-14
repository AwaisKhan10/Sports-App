import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sports_app/ui/screens/the_team/teams/teams_view_model.dart';
import 'package:shimmer/shimmer.dart';

class TeamShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TeamViewModel(),
      child: Consumer<TeamViewModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount:
                    10, // You can adjust this to show as many shimmer items as needed
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.white,
                    margin: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 8.h,
                    ),
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: ListTile(
                        leading: Container(
                          margin: EdgeInsets.all(10),
                          width: 60.w,
                          height: 60.h,
                          color: Colors.white,
                        ),
                        title: Container(
                          height: 18.h,
                          width: 120.w,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

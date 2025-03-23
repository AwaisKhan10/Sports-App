import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sports_app/ui/screens/purchase_ticket/purchase_ticket_view_model.dart';
import 'package:sports_app/widget/purchase_ticket.dart';
import 'package:sports_app/widget/header.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sports_app/core/constant/colors.dart';

class PurchaseTicketScreen extends StatelessWidget {
  const PurchaseTicketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PurchaseTicketViewModel(),
      child: Consumer<PurchaseTicketViewModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(backgroundColor: whiteColor),
            backgroundColor: scaffoldColor,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  /// **Header Section**
                  CustomHeader(
                    title: 'Purchase Ticket',
                    icon: Icons.arrow_back_rounded,
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),

                  20.verticalSpace,

                  /// **GridView for Ticket Items**
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics:
                          NeverScrollableScrollPhysics(), // Prevents nested scrolling issues
                      itemCount: viewModel.matches.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1, // Only one item per row
                        mainAxisSpacing: 10,
                        childAspectRatio: 3.5,
                      ),
                      itemBuilder: (context, index) {
                        return CustomPurchaseTicketWidget(
                          match: viewModel.matches[index],
                        );
                      },
                    ),
                  ),

                  30.verticalSpace,

                  /// **Extra Buttons or Information (Can be modified later)**
                  30.verticalSpace,
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

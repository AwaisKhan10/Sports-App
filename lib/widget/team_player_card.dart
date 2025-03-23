// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:sports_app/core/model/team_payer.dart';

// class CustomTeamPlayerCard extends StatelessWidget {
//   final TeamPlayerModel player;

//   const CustomTeamPlayerCard({Key? key, required this.player})
//     : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 2,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//       child: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Row(
//           children: [
//             Container(
//               height: 100.h,
//               width: 100.w,
//               child: ClipRRect(
//                 child: Image.asset(player.imageUrl, fit: BoxFit.cover),
//               ),
//             ),
//             SizedBox(width: 10),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   player.name,
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//                 Text("${player.number} - ${player.position}"),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sports_app/core/constant/colors.dart';
import 'package:sports_app/core/constant/text_style.dart';
import 'package:sports_app/core/model/team_payer.dart';

class CustomTeamPlayerCard extends StatelessWidget {
  final TeamPlayerModel player;
  const CustomTeamPlayerCard({super.key, required this.player});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        height: 100.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 100.h,
                width: 100.w,
                child: ClipRRect(
                  child: Image.asset(player.imageUrl, fit: BoxFit.contain),
                ),
              ),
            ),
            15.0.horizontalSpace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  player.name,
                  style: style18.copyWith(fontWeight: FontWeight.w700),
                ),
                Text(
                  "${player.number} - ${player.position}",
                  style: style16.copyWith(fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:sports_app/core/constant/colors.dart';
// import 'package:sports_app/core/constant/text_style.dart';

// class CustomRegisterButton extends StatelessWidget {
//   final Color color;
//   final String title;
//   final String? imageUrl;
//   final Color textColor;

//   CustomRegisterButton({
//     required this.color,
//     required this.title,
//     this.imageUrl,
//     required this.textColor,
//   });
//   bool isSelected = false;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 56.h,
//       width: double.infinity,
//       decoration: BoxDecoration(
//         color: color,
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: Center(
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             if (imageUrl != null)
//               Container(
//                 height: 35.h,
//                 width: 35.w,
//                 child: Padding(
//                   padding: EdgeInsets.all(3),
//                   child: Image.asset('$imageUrl!', color: whiteColor),
//                 ),
//               ),
//             4.horizontalSpace,
//             Text(title, style: style16B.copyWith(color: textColor)),
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

class CustomRegisterButton extends StatefulWidget {
  final Color firstColor;
  final Color secondColor;
  final String title;
  final String? imageUrl;
  final Color firstTextColor;
  final Color secondTextColor;
  final VoidCallback? onPressed; // Callback function

  CustomRegisterButton({
    required this.firstColor,
    required this.secondColor,
    required this.title,
    this.imageUrl,
    required this.firstTextColor,
    required this.secondTextColor,
    this.onPressed, // Call the function when button is pressed
  });

  @override
  _CustomRegisterButtonState createState() => _CustomRegisterButtonState();
}

class _CustomRegisterButtonState extends State<CustomRegisterButton> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });

        if (widget.onPressed != null) {
          widget.onPressed!(); // Call the function properly
        }
      },
      child: Container(
        height: 56.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color:
              isSelected
                  ? widget.secondColor
                  : widget.firstColor, // Toggle color
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (widget.imageUrl != null)
                Container(
                  height: 35.h,
                  width: 35.w,
                  child: Padding(
                    padding: EdgeInsets.all(3),
                    child: Image.asset(widget.imageUrl!, color: whiteColor),
                  ),
                ),
              4.horizontalSpace,
              Text(
                widget.title,
                style: style16B.copyWith(
                  color:
                      isSelected
                          ? widget.secondTextColor
                          : widget.firstTextColor, // Toggle text color
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

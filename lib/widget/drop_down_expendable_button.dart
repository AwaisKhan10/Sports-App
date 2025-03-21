// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:sports_app/core/constant/colors.dart';
// import 'package:sports_app/core/constant/text_style.dart';

// class CustomDropDownExpendableButton extends StatefulWidget {
//   final String text;

//   const CustomDropDownExpendableButton({required this.text});

//   @override
//   _CustomDropDownExpendableButtonState createState() =>
//       _CustomDropDownExpendableButtonState();
// }

// class _CustomDropDownExpendableButtonState
//     extends State<CustomDropDownExpendableButton> {
//   bool _isExpanded = false;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         GestureDetector(
//           onTap: () {
//             setState(() {
//               _isExpanded = !_isExpanded;
//             });
//           },
//           child: Container(
//             height: 33.h,
//             width: 47.w,
//             decoration: BoxDecoration(
//               color: primaryColor,
//               borderRadius: BorderRadius.only(
//                 bottomLeft: Radius.circular(99),
//                 bottomRight: Radius.circular(99),
//               ),
//             ),
//             child: Center(
//               child: Icon(
//                 _isExpanded
//                     ? Icons.keyboard_arrow_up
//                     : Icons.keyboard_arrow_down,
//                 size: 30,
//                 color: whiteColor,
//               ),
//             ),
//           ),
//         ),
//         AnimatedContainer(
//           duration: Duration(milliseconds: 500),
//           //  height: _isExpanded ? 120.h : 0,
//           width: double.infinity,
//           color: scaffoldColor,
//           padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//           child:
//               _isExpanded
//                   ? Column(
//                     children: [
//                       Text(
//                         widget.text,
//                         textAlign: TextAlign.center,
//                         style: style16.copyWith(),
//                       ),
//                     ],
//                   )
//                   : null,
//         ),
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sports_app/core/constant/colors.dart';
import 'package:sports_app/core/constant/text_style.dart';

class CustomDropDownExpendableButton extends StatefulWidget {
  final String text;

  const CustomDropDownExpendableButton({required this.text});

  @override
  _CustomDropDownExpendableButtonState createState() =>
      _CustomDropDownExpendableButtonState();
}

class _CustomDropDownExpendableButtonState
    extends State<CustomDropDownExpendableButton>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = false;
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset(1, 0), // Start off-screen (right)
      end: Offset(0, 0), // Ends at normal position
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose(); // Properly dispose animation
    super.dispose();
  }

  void _toggleExpansion() {
    if (mounted) {
      // Ensure the widget is still in the tree
      setState(() {
        _isExpanded = !_isExpanded;
      });

      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: _toggleExpansion,
          child: Container(
            height: 33.h,
            width: 47.w,
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(99),
                bottomRight: Radius.circular(99),
              ),
            ),
            child: Center(
              child: Icon(
                _isExpanded
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down,
                size: 30,
                color: whiteColor,
              ),
            ),
          ),
        ),

        /// **Sliding Animation Container**
        AnimatedContainer(
          color: whiteColor,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut, // Smooth animation curve
          height: _isExpanded ? 120.h : 0, // Expands vertically
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: SlideTransition(
            position: _slideAnimation,
            child:
                _isExpanded
                    ? Text(
                      widget.text,
                      textAlign: TextAlign.center,
                      style: style16.copyWith(),
                    )
                    : null,
          ),
        ),
      ],
    );
  }
}

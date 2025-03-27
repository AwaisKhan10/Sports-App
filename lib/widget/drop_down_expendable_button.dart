// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api

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
  /*************  ✨ Codeium Command ⭐  *************/
  /// Properly dispose the animation controller.
  ///
  /// The [AnimationController] must be disposed of to prevent memory leaks.
  /// This method is automatically called when the [StatefulWidget] is removed
  /// from the tree.
  /******  c7a935d2-e7da-46ab-8561-c46da4b83b43  *******/
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
        _isExpanded == false
            ? GestureDetector(
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
                    Icons.keyboard_arrow_down,
                    size: 30,
                    color: whiteColor,
                  ),
                ),
              ),
            )
            : SizedBox(),
        _isExpanded
            ?
            /// **Sliding Animation Container**
            AnimatedContainer(
              color: whiteColor,
              duration: Duration(milliseconds: 500),
              curve: Curves.easeInOut, // Smooth animation curve
              // height: _isExpanded ? 140.h : 0, // Expands vertically
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
            )
            : SizedBox(),

        _isExpanded == true
            ? GestureDetector(
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
                    Icons.keyboard_arrow_up,
                    size: 30,
                    color: whiteColor,
                  ),
                ),
              ),
            )
            : SizedBox(),
      ],
    );
  }
}

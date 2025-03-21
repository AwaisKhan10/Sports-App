import 'package:flutter/material.dart';

class CustomSwitchButton extends StatefulWidget {
  final bool initialValue;
  final ValueChanged<bool> onChanged;

  const CustomSwitchButton({
    Key? key,
    this.initialValue = false,
    required this.onChanged,
  }) : super(key: key);

  @override
  _CustomSwitchButtonState createState() => _CustomSwitchButtonState();
}

class _CustomSwitchButtonState extends State<CustomSwitchButton> {
  bool isOn = false;

  @override
  void initState() {
    super.initState();
    isOn = widget.initialValue;
  }

  void _toggleSwitch() {
    setState(() {
      isOn = !isOn;
    });
    widget.onChanged(isOn);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleSwitch,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        width: 50,
        height: 27,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: isOn ? Color(0xff4ADE80) : Colors.grey,
        ),
        padding: EdgeInsets.symmetric(horizontal: 3),
        alignment: isOn ? Alignment.centerRight : Alignment.centerLeft,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          width: 22,
          height: 22,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 3,
                spreadRadius: 1,
                offset: Offset(0, 2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

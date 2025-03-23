import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sports_app/core/constant/colors.dart';
import 'package:sports_app/ui/screens/home/home_screen_view_model.dart';
import 'package:sports_app/widget/drop_down_expendable_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeScreenViewModel(),
      child: Consumer<HomeScreenViewModel>(
        builder: (context, value, child) {
          return Scaffold(
            appBar: AppBar(backgroundColor: whiteColor),
            body: Column(
              children: [
                CustomDropDownExpendableButton(
                  text:
                      'qwertyuioplkjhgfdazxcvbnm,klpoiuytrewqazxcvbnmklkjhgfdsaqwertyuiopkmnbvcxsawertyuioplkjhgfdsazxcvbnm,lpoiuytrewqasdfghjkl,mnbvcxza',
                ),
                Center(child: Text('Home UI is missing ')),
              ],
            ),
          );
        },
      ),
    );
  }
}

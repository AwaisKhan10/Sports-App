import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sports_app/ui/screens/home/home_screen_view_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeScreenViewModel(),
      child: Consumer<HomeScreenViewModel>(
        builder: (context, value, child) {
          return Scaffold(body: Column(children: [Text('home screen')]));
        },
      ),
    );
  }
}

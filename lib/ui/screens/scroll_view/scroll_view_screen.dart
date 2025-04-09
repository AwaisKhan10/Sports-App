// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sports_app/core/constant/colors.dart';
import 'package:sports_app/ui/screens/scroll_view/scroll_view_view_model.dart';
import 'package:sports_app/widget/scroll_view_screen_widget.dart';

class ScrollViewScreen extends StatefulWidget {
  const ScrollViewScreen({super.key});

  @override
  State<ScrollViewScreen> createState() => _ScrollViewScreenState();
}

class _ScrollViewScreenState extends State<ScrollViewScreen> {
  @override
  void initState() {
    super.initState();
    // Load posts when screen initializes
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ScrollViewViewModel()..loadPosts(),
      child: Scaffold(
        backgroundColor: scaffoldColor,

        body: Consumer<ScrollViewViewModel>(
          builder: (context, model, child) {
            if (model.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (model.error != null) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      model.error ?? '',
                      style: TextStyle(color: Colors.red),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: model.loadPosts,
                      child: Text('Retry'),
                    ),
                  ],
                ),
              );
            }

            if (model.posts.isEmpty) {
              return const Center(child: Text('No posts available'));
            }

            return RefreshIndicator(
              onRefresh: model.loadPosts,
              child: ListView.builder(
                padding: EdgeInsets.all(16.r),
                itemCount: model.posts.length,
                itemBuilder: (context, index) {
                  final post = model.posts[index];
                  return CustomTweetCardWidget(post: post, viewModel: model);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

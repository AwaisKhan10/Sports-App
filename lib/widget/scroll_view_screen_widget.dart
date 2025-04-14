// ignore_for_file: use_key_in_widget_constructors, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sports_app/core/constant/app_assets.dart';
import 'package:sports_app/core/constant/auth_field_decoration.dart';
import 'package:sports_app/core/constant/colors.dart';
import 'package:sports_app/core/constant/text_style.dart';
import 'package:sports_app/core/model/post.dart';
import 'package:sports_app/ui/screens/new_feeds/new_feeds_view_model.dart';
import 'package:timeago/timeago.dart' as timeago;

class CustomTweetCardWidget extends StatelessWidget {
  final Post post;
  final NewFeedsViewModel viewModel;

  const CustomTweetCardWidget({required this.post, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 2)],
      ),

      margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
      child: Padding(
        padding: EdgeInsets.all(12.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Header
            Row(
              children: [
                if (post.teamLogo != null)
                  Image.network(post.teamLogo!, height: 60.h, width: 60.w),
                SizedBox(width: 10.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(post.teamName, style: style16),
                      // Text(
                      //   "@sanjoseteam",
                      //   style: TextStyle(color: Colors.grey),
                      // ),
                    ],
                  ),
                ),
                Text(
                  timeago.format(post.createdAt),
                  style: style14.copyWith(color: darkGreyColor),
                ),
              ],
            ),
            SizedBox(height: 10.h),

            /// Post Text
            Text(post.postText, style: style16),

            /// Post Image (if exists)
            if (post.postImg != null) ...[
              SizedBox(height: 10.h),
              ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: Image.network(
                  post.postImg!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  errorBuilder:
                      (context, error, stackTrace) => Container(
                        height: 200.h,
                        color: Colors.grey[300],
                        child: Icon(Icons.error),
                      ),
                ),
              ),
            ],

            SizedBox(height: 12.h),

            /// Likes and Comments Count
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    viewModel.toggleLike(post: post); // Trigger the like toggle
                  },
                  child: Icon(
                    viewModel.isLike[post.id] == true
                        ? Icons.favorite
                        : Icons
                            .favorite_border, // Change the icon based on like status
                    size: 20.r,
                    color:
                        viewModel.isLike[post.id] == true
                            ? Colors.red
                            : blackColor, // Change color to red if liked
                  ),
                ),
                SizedBox(width: 4.w),
                Text('${post.totalLikes}'),
                SizedBox(width: 16.w),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder:
                          (_) => CommentBottomSheet(
                            post: post,
                            viewModel: viewModel,
                          ),
                    );
                  },
                  child: Image.asset(AppAssets().comment, scale: 2.5),
                ),
                SizedBox(width: 4.w),
                Text('${post.comments.length}'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CommentBottomSheet extends StatefulWidget {
  final Post post;
  final NewFeedsViewModel viewModel;

  CommentBottomSheet({required this.post, required this.viewModel});

  @override
  State<CommentBottomSheet> createState() => _CommentBottomSheetState();
}

class _CommentBottomSheetState extends State<CommentBottomSheet> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Add listener to ViewModel to trigger rebuilds
    widget.viewModel.addListener(_onViewModelChanged);
  }

  @override
  void dispose() {
    widget.viewModel.removeListener(_onViewModelChanged);
    _controller.dispose();
    super.dispose();
  }

  void _onViewModelChanged() {
    // Trigger rebuild when ViewModel changes
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.7, // half screen
      minChildSize: 0.3,
      maxChildSize: 0.9,
      expand: false,
      builder:
          (_, controller) => Container(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: Column(
              children: [
                20.verticalSpace,

                /// Drag Handle
                Container(
                  width: 40,
                  height: 4,
                  margin: EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),

                /// Title
                Align(
                  alignment: Alignment.center,
                  child: Text("Comments", style: style18B),
                ),

                SizedBox(height: 8),

                /// Comment List
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    controller: controller,
                    itemCount: widget.post.comments.length,
                    itemBuilder: (context, index) {
                      final comment = widget.post.comments[index];
                      return ListTile(
                        leading: CircleAvatar(
                          child: Image.asset(AppAssets().profilePic),
                        ),
                        title: Text(comment.userName),
                        subtitle: Text(comment.commentText),
                      );
                    },
                  ),
                ),

                Divider(),

                /// Add Comment Row
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 10,
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage(AppAssets().profilePic),
                      ),
                      10.horizontalSpace,
                      Expanded(
                        child: TextField(
                          controller: _controller,
                          decoration: authFieldDecoration.copyWith(
                            suffixIcon: IconButton(
                              icon: Icon(Icons.send, color: blackColor),
                              onPressed: () {
                                final text = _controller.text.trim();
                                if (text.isNotEmpty) {
                                  widget.viewModel.postComment(
                                    postId: widget.post.id,
                                    commentText: text,
                                  );
                                  // Navigator.pop(context);
                                  _controller.clear();
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                20.verticalSpace,
              ],
            ),
          ),
    );
  }
}

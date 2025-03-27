import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';
import 'package:sports_app/core/constant/app_assets.dart';
import 'package:sports_app/core/constant/auth_field_decoration.dart';
import 'package:sports_app/core/constant/colors.dart';
import 'package:sports_app/core/constant/text_style.dart';
import 'package:sports_app/ui/screens/stadium_information/fresh_classic.dart';
import 'package:sports_app/ui/screens/stadium_information/stadium_info_view_model.dart';
import 'package:sports_app/widget/custom_app_bar.dart';
import 'package:sports_app/widget/drop_down_expendable_button.dart';
import 'package:sports_app/widget/filter_button.dart';
import 'package:sports_app/widget/header.dart';

class StadiumInfoAmenitiesScreen extends StatefulWidget {
  const StadiumInfoAmenitiesScreen({super.key});

  @override
  State<StadiumInfoAmenitiesScreen> createState() =>
      _StadiumInfoAmenitiesScreenState();
}

class _StadiumInfoAmenitiesScreenState
    extends State<StadiumInfoAmenitiesScreen> {
  final FocusNode _searchFocusNode = FocusNode();
  final TextEditingController _searchController = TextEditingController();
  bool _showSuggestions = false;

  // Sample Dropdown Suggestions
  final List<String> _suggestions = [
    "Show All",
    "Restrooms",
    "Food & Drinks",
    "Medical",
    "Food Trucks",
    "Elevators & Lifts",
    "Information",
    "Merchandise",
  ];
  final List<String> _suggestionIcons = [
    AppAssets().home,
    AppAssets().home,
    AppAssets().home,
    AppAssets().home,
    AppAssets().home,
    AppAssets().home,
    AppAssets().home,
    AppAssets().home,
  ];

  @override
  void initState() {
    super.initState();
    _searchFocusNode.addListener(() {
      setState(() {
        _showSuggestions = _searchFocusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _searchFocusNode.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => StadiumInfoViewModel(),
      child: Consumer<StadiumInfoViewModel>(
        builder: (context, value, child) {
          return GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
              setState(() {
                _showSuggestions = false;
              });
            },

            child: Scaffold(
              ///
              /// App Bar
              ///
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(60.h),
                child: CustomAppBar(title: 'Amenities'),
              ),

              ///
              /// Start Body
              ///
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    CustomDropDownExpendableButton(
                      text:
                          ' Please type in a question below and tap Ask, Well \n  find the best answer to assist you and point \n you to the information that you need! \nonly',
                    ),
                    20.verticalSpace,

                    // 🔹 Search & Filter Section
                    _searchFilterSection(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // 🔹 Search & Filter Section
  Widget _searchFilterSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // 🔹 Search Box
              Expanded(
                child: TextField(
                  focusNode: _searchFocusNode,
                  controller: _searchController,
                  decoration: FilterauthFieldDecoration.copyWith(
                    hintText: 'Search',
                  ),
                ),
              ),
              SizedBox(width: 12), // Space between search and button
              // 🔹 Custom Filter Button
              CustomFilterButton(
                text: "Filter",
                onPressed: () {
                  // Add filter action
                },
              ),
            ],
          ),

          // 🔹 Show Suggestions when Focused
          if (_showSuggestions) _searchSuggestionsList(),
          30.verticalSpace,
          Container(
            height: 580.h,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppAssets().infoStadium),
                fit: BoxFit.contain,
                scale: 4,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //   130.verticalSpace,
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 70.0,
                    vertical: 130.0,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Get.to(() => FreshClassicScreen());
                    },
                    child: Container(
                      height: 50.h,
                      width: 160.w,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Center(
                        child: Text(
                          "Fresh Classic",
                          style: style16.copyWith(color: whiteColor),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 🔹 Suggestions Dropdown List
  Widget _searchSuggestionsList() {
    return Container(
      margin: EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 4)],
      ),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: _suggestions.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                leading: Image.asset(
                  height: 27.h,
                  width: 27.w,
                  _suggestionIcons[index],
                  color: blackColor,
                  scale: 1,
                ),
                title: Text(_suggestions[index], style: style16.copyWith()),
                onTap: () {
                  setState(() {
                    _searchController.text = _suggestions[index];
                    _showSuggestions = false;
                    _searchFocusNode.unfocus();
                  });
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Divider(
                  height: 0,
                  thickness: 1,
                  color: Color(0xffD6D6D6),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

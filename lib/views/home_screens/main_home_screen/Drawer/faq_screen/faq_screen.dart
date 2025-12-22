import 'package:car_app/utils/app_icons/app_icons.dart';
import 'package:car_app/views/home_screens/main_home_screen/Drawer/faq_screen/widget/faqContainer.dart';
import 'package:car_app/widget/CustomTexth.dart';
import 'package:car_app/widget/Custom_searchbar.dart';
import 'package:car_app/widget/Custom_text_italic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../common_widgets/Custom_text.dart';
import '../../../../../widget/Custom_Back_button.dart';

class FaqScreen extends StatelessWidget {
  FaqScreen({super.key});

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: CustomBackButton(),
        title: CustomText(
          text: "FAQ’s",
          fontSize: 20,
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.italic,
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20.w, 24.w, 20.w, 50.w),
          child: Column(
            children: [
              CustomSearchBar(controller: controller, onTap: () {}),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextItalic(text: "Top Questions"),
                  Text(
                    "See more",
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 14,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.green,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                  color: Color(0xFF212121),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(width: 1, color: Colors.grey),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomTexth(text: "How to create a account?"),
                        SvgPicture.asset(AppIcons.croxicon),
                      ],
                    ),
                    CustomText(
                      text:
                          "Open the Tradebase app to get started"
                          "and follow the steps.Tradebase doesn’t "
                          "charge a fee to create or maintain your"
                          "Tradebase account.",
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              FAQItem(
                question: "How to delete an account?",
                icon: SvgPicture.asset(AppIcons.tiricon),
              ),
              SizedBox(height: 16),
              FAQItem(
                question: "How long does it take to receive my order?",
                icon: SvgPicture.asset(AppIcons.tiricon),
              ),
              SizedBox(height: 16),
              FAQItem(
                question: "How long does it take to receive my order?",
                icon: SvgPicture.asset(AppIcons.tiricon),
              ),
              SizedBox(height: 16),
              FAQItem(
                question: "How long does it take to receive my order?",
                icon: SvgPicture.asset(AppIcons.tiricon),
              ),
              SizedBox(height: 16),
              FAQItem(
                question: "How long does it take to receive my order?",
                icon: SvgPicture.asset(AppIcons.tiricon),
              ),
              SizedBox(height: 16),
              FAQItem(
                question: "How long does it take to receive my order?",
                icon: SvgPicture.asset(AppIcons.tiricon),
              ),
              SizedBox(height: 16),
              FAQItem(
                question: "How to delete an account?",
                icon: SvgPicture.asset(AppIcons.tiricon),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

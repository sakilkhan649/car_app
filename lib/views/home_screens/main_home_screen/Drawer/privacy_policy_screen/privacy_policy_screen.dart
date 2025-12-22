import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../common_widgets/Custom_text.dart';
import '../../../../../widget/CustomTexth.dart';
import '../../../../../widget/Custom_Back_button.dart';
import '../termsandcondition_screen/widget/customrichtext.dart';
import 'widget/infotext.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: CustomBackButton(),
        title: CustomText(
          text: "Privacy Policy",
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: "Effective Date: [Insert Date]",
                color: Colors.orangeAccent,
              ),
              SizedBox(height: 15),
              CustomRichTextBlock(
                normalText1: 'At',
                highlightedText: ' E  PARTS',
                highlightedColor: Colors.green,
                normalText2:
                    ' your privacy is our priority. This policy explains how we collect, use, and protect your information when you use our app or services.',
              ),
              SizedBox(height: 20.h),
              CustomTexth(
                text: "1. Information We Collect",
                fontWeight: FontWeight.w500,
              ),
              InfoBlock(
                content:
                    '''We collect data to provide and improve your experience:

• Personal Info: Name, email, phone number, address.

• Usage Info: App interactions, preferences, and search history.

• Transaction Info: Payment details (handled securely via trusted gateways).''',
              ),
              SizedBox(height: 20.h),
              CustomTexth(
                text: "2. How We Use Your Data",
                fontWeight: FontWeight.w500,
              ),
              InfoBlock(
                content: '''Your data helps us:

Process and deliver your orders.

Improve app performance and product recommendations. 
Send updates, offers, and important notifications. 
Maintain security and prevent fraud.''',
              ),
              SizedBox(height: 20.h),
              CustomTexth(
                text: "3. Sharing Your Data",
                fontWeight: FontWeight.w500,
              ),
              SizedBox(height: 7),
              CustomText(text: "We do not sell your personal information."),
              InfoBlock(
                content: '''
We may share limited data with:

Trusted service providers (payments, delivery, analytics).

Legal authorities, if required by law.''',
              ),
              SizedBox(height: 20.h),
              CustomTexth(
                text: "4. Data Security",
                fontWeight: FontWeight.w500,
              ),
              SizedBox(height: 7),
              CustomText(
                text:
                    '''We use encryption and secure servers to protect your information.However, no online system is 100% secure,so we recommend keeping your login details private.''',
              ),
              SizedBox(height: 20.h),
              CustomTexth(text: "5. Your Rights", fontWeight: FontWeight.w500),
              InfoBlock(
                content: '''You can:

View, edit, or delete your account information.

Opt out of promotional notifications.

Request data removal by contacting our support.''',
              ),
              SizedBox(height: 20.h),
              CustomTexth(text: "6. Cookies", fontWeight: FontWeight.w500),
              SizedBox(height: 7),
              CustomText(
                text:
                    '''We use cookies to enhance your experience and remember your preferences.
You can disable them anytime in your settings.''',
              ),
              SizedBox(height: 20.h),
              CustomTexth(
                text: "7. Updates to This Policy",
                fontWeight: FontWeight.w500,
              ),
              SizedBox(height: 7),
              CustomText(
                text:
                    '''We may update this policy occasionally. The latest version will always be available inside the app.''',
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}

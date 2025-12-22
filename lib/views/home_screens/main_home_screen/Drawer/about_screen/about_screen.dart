import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../common_widgets/Custom_text.dart';
import '../../../../../widget/CustomTexth.dart';
import '../../../../../widget/Custom_Back_button.dart';
import '../privacy_policy_screen/widget/infotext.dart';
import '../termsandcondition_screen/widget/customrichtext.dart';

class AboutScreen extends StatelessWidget {
  AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: CustomBackButton(),
        title: CustomText(
          text: "About E-Parts",
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
              CustomRichTextBlock(
                normalText1: 'At',
                highlightedText: ' E-Parts, ',
                highlightedColor: Colors.orangeAccent,
                normalText2:
                    ' we believe your vehicle deserves nothing less than excellence. Our mission is to deliver premium car parts, tires, and accessories crafted for precision, durability, and style. Every product we offer meets global quality standards, ensuring the perfect balance of performance and reliability for every drive.',
              ),
              SizedBox(height: 20.h),
              CustomTexth(text: "1. Our Mission", fontWeight: FontWeight.w500),
              SizedBox(height: 7),
              CustomText(
                text:
                    '''To deliver premium car parts and a seamless shopping experience, ensuring every vehicle runs at its best.''',
              ),
              SizedBox(height: 20.h),
              CustomTexth(text: "2. Our Mission", fontWeight: FontWeight.w500),
              SizedBox(height: 7),
              CustomText(
                text:
                    '''To deliver premium car parts and a seamless shopping experience, ensuring every vehicle runs at its best.''',
              ),
              SizedBox(height: 20.h),
              CustomTexth(
                text: "3. What We Offer",
                fontWeight: FontWeight.w500,
              ),
              SizedBox(height: 7),
              InfoBlock(
                content: '''Genuine parts for all major car brands.

Fast delivery and easy returns.

Secure payment and real-time order tracking.

24/7 customer support.''',
              ),
              SizedBox(height: 20.h),
              CustomTexth(
                text: "4. Why Choose Us",
                fontWeight: FontWeight.w500,
              ),
              SizedBox(height: 7),
              CustomText(
                text:
                    '''We believe in trust, transparency, and technology. Every product is carefully verified to meet global standards of quality and performance.''',
              ),
              SizedBox(height: 20.h),
              CustomTexth(text: "5. Our Vision", fontWeight: FontWeight.w500),
              SizedBox(height: 7),
              CustomText(
                text:
                    '''To become the most reliable auto parts platform that connects every car owner with the parts they need — anytime, anywhere.''',
              ),
              SizedBox(height: 20.h),
              CustomTexth(
                text: "6. Opening Hours",
                fontWeight: FontWeight.w500,
              ),
              SizedBox(height: 7),
              CustomText(
                text: "Sat - Sun 12:00 Am-12:00 Pm",
                color: Colors.green,
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}

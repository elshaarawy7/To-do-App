import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/core/utils/app_router.dart';
import 'package:todo_app/features/ui/widget/custem_text_filed.dart';
import 'package:todo_app/features/ui/widget/setting_item.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            context.go(AppRouter.kHomePage);
          },
          icon: Icon(Icons.arrow_back_ios, size: 25, color: Colors.black),
        ),

        title: Text(
          "Settings",
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
   
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [ 
            SizedBox(height: 50,) , 
            Align(
              alignment: Alignment.center,
              child: CircleAvatar(
                backgroundColor: Colors.grey,  
                radius: 45, 
              ),
            ),    
            SizedBox(height: 20,) , 

            CustemTextFiled(
              icon: Icons.person, hintText: "Enter your name") ,

            SizedBox(height:20 ) ,  
              SettingItem(
                image: 'assets/settings/crown.svg',
                text: 'Go Premium!',
                colorText: Color(0xffF4AF25),
              ),
              Divider(),
              Text('Preferences', style: TextStyle(color: Color(0xFF7E8491))),

              SettingItem(
                image: 'assets/settings/theme.svg',
                text: 'Theme',
                colorText: Color(0xff0E100F),
              ),
              Divider(),
              SettingItem(
                image: 'assets/settings/color.svg',
                text: 'Color scheme',
                colorText: Color(0xff0E100F),
              ),
              Divider(),
              Text('More', style: TextStyle(color: Color(0xFF7E8491))),
              SettingItem(
                image: 'assets/settings/feedback.svg',
                text: 'Feedback',
                colorText: Color(0xff0E100F),
              ),
              Divider(),
              SettingItem(
                image: 'assets/settings/star.svg',
                text: 'Rate',
                colorText: Color(0xff0E100F),
              ),
              Divider(),
              SettingItem(
                image: 'assets/settings/support.svg',
                text: 'Support',
                colorText: Color(0xff0E100F),
              ),
              Divider(),
              SettingItem(
                image: 'assets/settings/faq.svg',
                text: 'FAQ',
                colorText: Color(0xff0E100F),
              ),
              Divider(),
              SettingItem(
                image: 'assets/settings/privacy.svg',
                text: 'Privacy policy',
                colorText: Color(0xff0E100F),
              ),
              Divider(),
              SettingItem(
                image: 'assets/settings/terms.svg',
                text: 'Terms of use',
                colorText: Color(0xff0E100F),
              ),
              Divider(),
              SettingItem(
                image: 'assets/settings/about.svg',
                text: 'About us',
                colorText: Color(0xff0E100F),
              ),
              Divider(),
              GestureDetector(
                onTap: () {
                  context.go(AppRouter.kSingInPage);
                },
                child: SettingItem(
                  image: 'assets/settings/logout.svg',
                  text: 'Logout',
                  colorText: Color(0xff0E100F),
                ),
              ),
              Divider(),
              Gap(20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Version',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff7E8491),
                    ),
                  ),
                  Text(
                    '1.4.2',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff7E8491),
                    ),
                  ),
                ],
              ),
              Gap(40),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:ecommerce_application/view/screen/Updateprofile.dart';
import 'package:ecommerce_application/view/widget/home/customProfileMenuWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart' as cc;
//import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  static String Name = "Mohamed Yousef";
  static String Phone = "0962269365";

  @override
  Widget build(BuildContext context) {
    Image img = Image.asset('assets/images/mo.jpg');
     

    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(cc.LineAwesomeIcons.angle_left_solid)),
        title: Text("User Profile"),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                  isDark ? cc.LineAwesomeIcons.sun : cc.LineAwesomeIcons.moon))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              /// -- IMAGE
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: CircleAvatar(
                            // radius: 50,
                            backgroundImage: img.image)

                        // Icon(
                        //   Icons.person,
                        //   size: 70,
                        // )

                        ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.cyan),
                      child: const Icon(
                        cc.LineAwesomeIcons.pencil_alt_solid,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                "$Name" ,
              ),
              // style: Theme.of(context).textTheme.headline4),
              Text(
                "$Phone",
              ),
              //  style: Theme.of(context).textTheme.bodyText2),
              const SizedBox(height: 20),

              /// -- BUTTON
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: ()
                       => Get.to(() => const UpdateProfileScreen()),
                      
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.cyan,
                      side: BorderSide.none,
                      shape: const StadiumBorder()),
                  child: const Text("Update Profile",
                      style: TextStyle(color: Colors.black)),
                ),
              ),
              const SizedBox(height: 30),
              const Divider(),
              const SizedBox(height: 10),

              /// -- MENU
              ProfileMenuWidget(
                  title: "Settings",
                  icon: cc.LineAwesomeIcons.copy,
                  onPress: () {}),
              ProfileMenuWidget(
                  title: "Billing Details",
                  icon: cc.LineAwesomeIcons.wallet_solid,
                  onPress: () {}),
              ProfileMenuWidget(
                  title: "User Management",
                  icon: cc.LineAwesomeIcons.check_solid,
                  onPress: () {}),
              const Divider(),
              const SizedBox(height: 10),

              ProfileMenuWidget(
                  title: "Information",
                  icon: cc.LineAwesomeIcons.info_circle_solid,
                  onPress: () {}),

              ProfileMenuWidget(
                  title: "Logout",
                  icon: cc.LineAwesomeIcons.sign_out_alt_solid,
                  textColor: Colors.red,
                  endIcon: false,
                  onPress: () {
                    Get.defaultDialog(
                      title: "LOGOUT",
                      titleStyle: const TextStyle(fontSize: 20),
                      content: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 15.0),
                        child: Text("Are you sure, you want to Logout?"),
                      ),
                      confirm: Expanded(
                        child: ElevatedButton(
                          onPressed: () {}
                          // => AuthenticationRepository.instance.logout()
                          ,
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.redAccent,
                              side: BorderSide.none),
                          child: const Text("Yes"),
                        ),
                      ),
                      cancel: OutlinedButton(
                          onPressed: () => Get.back(), child: const Text("No")),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

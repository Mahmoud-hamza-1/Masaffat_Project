import 'package:ecommerce_application/view/screen/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart' as cc;

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final controller = Get.put(ProfileController());
    final TextEditingController NameController = TextEditingController();
    final TextEditingController EmailController = TextEditingController();
    final TextEditingController PhoneNumberController = TextEditingController();
    final TextEditingController Password = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(cc.LineAwesomeIcons.angle_left_solid)),
        title: Text(
          "Edit Profile",
          // style: Theme.of(context).textTheme.headline4
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // -- IMAGE with ICON
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: const Image(
                            image: AssetImage('assets/images/mo.jpg'))),
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
                      child: const Icon(cc.LineAwesomeIcons.camera_solid,
                          color: Colors.black, size: 20),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),

              // -- Form Fields
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      controller: NameController,
                      decoration: const InputDecoration(
                          label: Text("Full Name"),
                          prefixIcon: Icon(cc.LineAwesomeIcons.user)),
                    ),
                    const SizedBox(height: 30),
                    TextFormField(
                      decoration: const InputDecoration(
                          label: Text("Email"),
                          prefixIcon: Icon(cc.LineAwesomeIcons.envelope)),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: PhoneNumberController,
                      decoration: const InputDecoration(
                        
                          label: Text("Phone Number"),
                          prefixIcon:
                              Icon(cc.LineAwesomeIcons.phone_alt_solid)),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        label: const Text("Password"),
                        prefixIcon: const Icon(Icons.fingerprint),
                        suffixIcon: IconButton(
                            icon: const Icon(cc.LineAwesomeIcons.eye_slash),
                            onPressed: () {}),
                      ),
                    ),
                    const SizedBox(height: 30),

                    // -- Form Submit Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: (){
                          ProfileScreen.Name = NameController.text;
                          ProfileScreen.Phone =  PhoneNumberController.text;
                            Get.to( const ProfileScreen());
                               },

                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.cyan,
                            side: BorderSide.none,
                            shape: const StadiumBorder()),
                        child: const Text("Edit Profile",
                            style: TextStyle(color: Colors.black)),
                      ),
                    ),
                    const SizedBox(height: 30),

                    // -- Created Date and Delete Button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // const Text.rich(
                        //   TextSpan(
                        //     text: "tJoined",
                        //     style: TextStyle(fontSize: 12),
                        //     children: [

                        //       TextSpan(
                        //           text: "tJoinedAt",
                        //           style: TextStyle(
                        //               fontWeight: FontWeight.bold,
                        //               fontSize: 12))
                        //     ],
                        //   ),
                        // ),

                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Colors.redAccent.withOpacity(0.1),
                              elevation: 0,
                              foregroundColor: Colors.red,
                              shape: const StadiumBorder(),
                              side: BorderSide.none),
                          child: const Text("Delete"),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
